
import json
import quicksnmp
from pysnmp import hlapi
from pyconfig import *
from pyconfig import _MW_INVARIANT_ID_, _HUAWEI_MW_VERSION_ID_, _NEC_MW_VERSION_ID_
import os
from contextlib import contextmanager
import sys
import ipaddress
from multiprocessing import Pool
from  aai_requests import *
import json
from jinja2 import Environment, FileSystemLoader, Template


global devices

devices = dict()

#Checking workspace
cwd = os.getcwd()
if cwd.split('/')[-1]!='snmp' : os.chdir("Scripts/python/snmp/")

env = Environment(loader=FileSystemLoader('./aai_templates/'))

#Network parameters
network = "172.20.183.128"
mask = "25"

hua_ne_id =  ".1.3.6.1.4.1.2011.2.25.3.40.2.1.1.0"

def create_dict(*args):
    return dict({i:eval(i) for i in args})

@contextmanager
def no_stdout():
    with open(os.devnull, "w") as devnull:
        old_stdout = sys.stdout
        sys.stdout = devnull
        try:  
            yield
        finally:
            sys.stdout = old_stdout

#SNMP Ping + Chassis ID + Hostname + Vendor retrieving function
def get_hostname(ip):
    """
    inputs:
        ip (str) : Device IP address
    
    outputs:
        Tuple : (Chassis ID, [Device information])
    """ 
    global devices
    def create_dict(*args):
        return dict({i:eval(i) for i in args})
    try:
        with no_stdout():
            vendor=quicksnmp.get(str(ip), snmp_ping,credentials)
    except:
        return False
    else:
        address=str(ip)
        vendor=str(vendor[0][1])
        id=''
        if vendor=="Optix product" : 
            vendor="huawei"
            ne_id = str(quicksnmp.get_oid(str(ip), hua_ne_id,credentials)[0][-1])
            hostname = str(quicksnmp.get_oid(str(ip), huawei_sysname,credentials)[0][1])
            id='0x'+str(quicksnmp.get(str(ip), lldp_hua_id,credentials)[0][1]).replace('-','')
            return (id,[address,hostname,vendor,ne_id])            
        elif vendor=='ipe' : 
            vendor="nec-ipa"
            hostname = str(quicksnmp.get(str(ip), sysName_named_oid,credentials)[0][1])
            id=quicksnmp.get(str(ip), lldp_id,credentials)[0][1].prettyPrint()
        elif vendor=='-':
            try :
                #Checking the "Equipment Type" OID that return an integer >10000 for VR products
                if int(str(quicksnmp.get_oid(address,nec_vr_type,credentials)[0][1]))>10000:
                    vendor="nec-vr"
                    hostname = str(quicksnmp.get(str(ip), sysName_named_oid,credentials)[0][1])
                    id=quicksnmp.get(str(ip), lldp_id,credentials)[0][1].prettyPrint()
                else: raise ValueError('')
            except:
                return False
        if id=='': return False
        return (id,[address,hostname,vendor])



list_addr=ipaddress.IPv4Network(network+'/'+mask).hosts()

#Building a pool of subprocesses for each IP address (e.g : for /24 network, creates 254 subprocesses)
"""
This operation may require analysis in order to get the best optimized value here.
The subprocessing segmentation here is therefore guaranteed up to 1024 addresses.
"""
a_pool = Pool(2**(32-int(mask))-2)

#Subprocessing get_hostname() function for each addresses
db_hostname=a_pool.map(get_hostname,list_addr)

#Filtering successfully polled addresses
db=[host for host in db_hostname if host != False]

#Building and updating/creating Inventory file
for id,infos in db:
    address=infos[0]
    hostname=infos[1]
    vendor=infos[2]
    if vendor == "huawei" :
        ne_id = infos[3]
        devices[id]=create_dict('address','hostname','vendor', 'ne_id')
    else : 
        devices[id]=create_dict('address','hostname','vendor')


### Save Host in AAI Database ###
aai_devices_data = dict()
aai_devices_data['devices'] = list()

devices_model = env.get_template('device.json')
old_device_model = env.get_template('old_device.json')
pnf_model = env.get_template('pnf.json')
old_pnf_model = env.get_template('old_pnf.json')


def update_aai(devices):

    def create_device(device_id, device_info, isExist=False):
        URL_DEVICE = URL_GET_DEVICES + '/device/{device_id}'.format(device_id = device_id)

        if isExist == True :
            device_data = json.loads(old_device_model.render(device_id=device_id, operational_status="down", resource_version=device_info))
        else :
            if device_info['vendor'] == 'huawei' :
                device_data = json.loads(devices_model.render(device_id=device_id, device_name=device_info['hostname'], vendor=device_info['vendor'], ipv4=device_info['address'], description="We use model-customization-id for NE ID ", operational_status ="up", ne_id=device_info['ne_id'], model_invariant_id=_MW_INVARIANT_ID_, model_version_id=_HUAWEI_MW_VERSION_ID_))
            else:
                device_data = json.loads(devices_model.render(device_id=device_id, device_name=device_info['hostname'], vendor=device_info['vendor'], ipv4=device_info['address'], description="We use model-customization-id for NE ID ", operational_status ="up", model_invariant_id=_MW_INVARIANT_ID_, model_version_id=_NEC_MW_VERSION_ID_))

        req_device = put_request(URL_DEVICE, device_data)

    def create_pnf(device_id, device_info, isExist=False):
        URL_DEVICE = URL_GET_DEVICES + '/device/{device_id}'.format(device_id = device_id)
        URL_PNF = URL_GET_PNFS + '/pnf/{pnf_name}'.format(pnf_name = device_id )

        if isExist == True :
            pnf_data = json.loads(old_pnf_model.render(device_id=device_id, operational_status="down", resource_version=device_info))
        else :
            if device_info['vendor'] == 'huawei' :
                pnf_data = json.loads(pnf_model.render(device_id=device_id, device_name=device_info['hostname'], selflink=URL_DEVICE, equip_type="microwave", vendor=device_info['vendor'], operational_status ="up", model_invariant_id=_MW_INVARIANT_ID_, model_version_id=_HUAWEI_MW_VERSION_ID_))
            else:
                pnf_data = json.loads(pnf_model.render(device_id=device_id, device_name=device_info['hostname'], selflink=URL_DEVICE, equip_type="microwave", vendor=device_info['vendor'], operational_status ="up", model_invariant_id=_MW_INVARIANT_ID_, model_version_id=_NEC_MW_VERSION_ID_))

        req_pnf = put_request(URL_PNF, pnf_data)

    

    #Get current Devices (and Pnfs) in AAI
    try:
        current_devices = get_request(URL_GET_DEVICES)[1]['device']
        current_devices = {node['device-id']:node for node in current_devices}
    except:
        current_devices = dict()
    
    for id in devices:
        devices[id]['device_id'] = id
        aai_devices_data['devices'].append(devices[id])

        if id in current_devices.keys() :
            del(current_devices[id])
            create_device(id, devices[id])
            create_pnf(id, devices[id])

    for id in current_devices:
        create_device(id,current_devices[id],True)
        create_pnf(id,current_devices[id],True


if __name__ == "__main__":
    update_aai(devices)
    
    fp = open('inventory.json', 'w+') 
    json.dump(aai_devices_data, fp)
    fp.close()
    print('Current Available Devices')
    print(aai_devices_data)

