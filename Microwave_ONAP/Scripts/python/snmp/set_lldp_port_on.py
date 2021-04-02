import quicksnmp
from pyconfig import *
from pysnmp.smi.rfc1902 import rfc1902
import json
import os
import time
from aai_requests import *

def set_nec_lldp_port(host_ip):
    nec_port_lldp_to_enable = []
    comp = 0
    statuts = quicksnmp.get_table(host_ip, nec_port_lldp_status,credentials)
    for stat in statuts:
        if stat[1].prettyPrint() != 'txAndRx' :
            comp +=1
            nec_port_lldp_to_enable.append(('.1.0.8802.1.1.2.1.1.6.1.2.'+str(stat[0][-1]),rfc1902.Integer32(3)))
    print('Port to Set : ', comp)
    if nec_port_lldp_to_enable != [] :
        lldp_on = quicksnmp.add_row_oids(host_ip,nec_port_lldp_to_enable,credentials)
        print('LLDP Set')

def set_hua_lldp_port(host_ip) :
    hua_port_lldp_to_enable = []
    comp = 0
    statuts = quicksnmp.get_table(host_ip, hua_port_lldp_status,credentials)
    for stat in statuts:
        if stat[1].prettyPrint() != 'txrx' :
            comp +=1
            hua_port_lldp_to_enable.append(('.1.3.6.1.4.1.2011.2.25.4.50.27.1.5.1.4.'+str(stat[0][-3])+'.'+str(stat[0][-2])+'.'+str(stat[0][-1]),rfc1902.Integer32(3)))
    print('Ports to Set : ', comp)
    if hua_port_lldp_to_enable != [] :
        lldp_on = quicksnmp.add_row_oids(host_ip,hua_port_lldp_to_enable,credentials)
        print('LLDP Set')



def set():
    
    cwd = os.getcwd()
    if cwd.split('/')[-1]!='snmp' : os.chdir("Scripts/python/snmp/")

    try:
        f=open("inventory.json",)
        devices=json.load(f)['devices']
        f.close()
    except:
        devices = dict()
    """
    try :
        devices = get_request(URL_GET_DEVICES)[1]['device']
    except:
        devices = list()
    """

    for ne in devices :
        print("---------- NE : ", ne["hostname"], ' - IP : ',ne['address'], " -----------")
        if 'nec' in ne['vendor']:
            set_nec_lldp_port(ne['address'])
        
        if ne['vendor'] == 'huawei' :
            set_hua_lldp_port(ne['address'])

set()

print("Wait LLDP communications")
time.sleep(30)