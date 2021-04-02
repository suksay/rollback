from pyconfig import *
import quicksnmp 
from pysnmp import hlapi
from pysnmp.hlapi import *
import os, json
import code
import itertools
import time
from pysnmp.smi import builder
from aai_requests import *
import json
from jinja2 import Environment, FileSystemLoader

#Checking workspace
cwd = os.getcwd()
if cwd.split('/')[-1]!='snmp' : os.chdir("Scripts/python/snmp/")

env = Environment(loader=FileSystemLoader('./aai_templates/'))

vlan = env.get_template('vlan.json')

def get_host_ports_id(hostname):
    data_interf_list = quicksnmp.get_table(hostname,get_nec_eth_list, credentials)
    interfaces = dict()

    for interface in data_interf_list:
        interfaces[interface[0][-1]] = interface[1].prettyPrint()

    return interfaces

def get_vlans_by_host(hostname):
    #Check workspace and load data files
    data_vlan_list = quicksnmp.get_table(hostname,get_nec_vlan_list, credentials)
    vlan_dict = {}

    for vlan in data_vlan_list:
        vlan_id = vlan[0][-1]
        vlan_name = vlan[1].prettyPrint()
        vlan_dict[str(vlan_id)] = vlan_name

    return vlan_dict
        
def get_vlans_conf_by_host(hostname):
    interfaces = get_host_ports_id(hostname)
    #data_interf_list = quicksnmp.get_table(hostname,get_nec_eth_list, credentials)
    data_vlan_config = quicksnmp.get_table(hostname,get_nec_vlan_config, credentials)

    vlan_config = []
    #List of Ethernet Interface
    eth_list = {item:interfaces[item] for item in interfaces if "Ethernet" in interfaces[item] }
    """
    for interface in data_interf_list:
        #interface[1].prettyPrint()   = Port Name
        if "Ethernet" in interface[1].prettyPrint()  :
            eth_list[interface[0][-1]] = interface[1].prettyPrint()
    """

    for config in data_vlan_config:
        temp_ = {}
        temp_['vlan'] = config[0][-1]
        temp_['port_id'] = config[0][-2]
        temp_['mode'] = config[1].prettyPrint()

        if temp_['port_id'] in [*eth_list] :
            temp_['port_name'] = eth_list[temp_['port_id']]
        
        else :
            temp_['port_name'] = "Modem-"+ str(temp_['port_id'])[0]

        vlan_config.append(temp_)
    

    return vlan_config


def updata_vlan() :
    #Check workspace and load data files
    cwd = os.getcwd()
    if cwd.split('/')[-1]!='snmp' : os.chdir("Scripts/python/snmp/")

    #Get Devices list 
    try:
        f=open("inventory.json",)
        devices=json.load(f)['devices']
        f.close()
    except:
        devices = dict()


    #nec_hosts =  [(id,host['address']) for (id,host) in hosts.items() if 'nec' in host['vendor']]
    aai_nec_vlans_datas = dict()
    aai_nec_vlans_datas['nec_vlans'] = dict()

    for device in devices:
        if 'nec' in device['vendor']:
            vlans_mapping = get_vlans_by_host(device['address'])
            vlans_configs = get_vlans_conf_by_host(device['address'])
            aai_nec_vlans_datas['nec_vlans'][device['device_id']] = list()

            for vlan_config in vlans_configs:
                #URL_DEVICE_INTF_VLAN  =  URL_GET_PNFS +'/pnf/{device_id}/p-interfaces/p-interface/{interface_id}/l-interfaces/l-interface/{interface_id}/vlans/vlan/{vlan_id}'.format(device_id=device['device-id'], interface_id=vlan_config['port_id'], vlan_id=vlan_config['vlan'])
                #vlan_data = json.loads(vlan.render(vlan_id=vlan_config['vlan'], vlan_mode=vlan_config['mode']))
                #req_vlan = put_request(URL_DEVICE_INTF_VLAN, vlan_data)
                
                aai_data = dict()
                aai_data['vlan-id'] = vlan_config['vlan']

                try:
                    #If Vlan List Request empty
                    aai_data['vlan-name'] = vlans_mapping[str(vlan_config['vlan'])]
                except:
                     aai_data['vlan-name'] = ""
        
                aai_data['vlan-mode'] = vlan_config['mode']
                aai_data['port-id'] = vlan_config['port_id']
                aai_data['port-name'] = vlan_config['port_name']

                aai_nec_vlans_datas['nec_vlans'][device['device_id']].append(aai_data)

            #vlans[device['device-id']] = dict()
            #vlans[device['device-id']]['vlans'] = get_vlans_by_host(device['system-ipv4'])
            #vlans[device['device-id']]['config']=get_vlans_conf_by_host(device['system-ipv4'])


    """
    #Overwriting vlans.json file    
    with open('json/nec/vlans.json', 'w') as fp:
        json.dump(vlans, fp)
    """
    fp = open('nec_vlans.json', 'w+') 
    json.dump(aai_nec_vlans_datas, fp)
    fp.close()
    #print(aai_nec_vlans_datas)

#run in workflow
if __name__ == "__main__":
    updata_vlan()   

    


    




