import os
from pysnmp.hlapi import *
import json

import quicksnmp
from pyconfig import *
from aai_requests import *

import json
from jinja2 import Environment, FileSystemLoader

#Checking workspace
cwd = os.getcwd()
if cwd.split('/')[-1]!='snmp' : os.chdir("Scripts/python/snmp/")

env = Environment(loader=FileSystemLoader('./aai_templates/'))

qinqlink_model = env.get_template('qinq-link.json')
# os.chdir("Scripts/python/snmp/")

def update():
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


    qinqlinks= dict()

    #Sending SNMP request and processing values for each huawei devices
    for node in devices :
        id = node['device_id']
        if node['vendor'] == 'huawei':
            qinq_list = list()
            qinqtable=quicksnmp.get_table(node['address'],qinq_hua,credentials)
            for qinq_e in qinqtable:
                index=qinq_e[1][0][-1]
                board=qinq_e[1][1].prettyPrint()
                subboard=qinq_e[2][1].prettyPrint()
                port=board+'/'+subboard+'/'+qinq_e[3][1].prettyPrint()
                vlan=qinq_e[4][1].prettyPrint()
                status=qinq_e[5][1].prettyPrint()
                keys=['qinq-link-id','port-name','qinq-vlan-id','status']
                values=[str(index),port,vlan,status]
                qinq_list.append(make_dict(keys,values))
            qinqlinks[id]=qinq_list.copy()

    #AAI Operations
    aai_qinqlinks_data = dict()
    aai_qinqlinks_data['qinqlinks'] = dict()

    for node in qinqlinks:
        current_node_qinqlinks_data = list()

        #Get Current qinqlinks config in device
        current_qinqlinks = dict()
        URL_GET_DEVICE_QINQ_LINK = URL_GET_DEVICES +'/device/{device_id}/qinq-links'.format(device_id=node)
        req_get_qinq_links = get_request(URL_GET_DEVICE_QINQ_LINK)
        try:
            current_qinqlinks = { link['qinq-link-id']:link['resource-version'] for link in req_get_qinq_links[1]['qinq-link'] }
        except:
            current_qinqlinks = dict()

        
        for config in qinqlinks[node]:
            qinqlink_data = json.loads(qinqlink_model.render(qinq_link_id=config['qinq-link-id'],port_name=config['port-name'],qinq_vlan_id=config['qinq-vlan-id'],status=config['status']))
            if config['qinq-link-id'] in current_qinqlinks.keys():
                qinqlink_data['resource-version'] = current_qinqlinks[config['qinq-link-id']]

            current_node_qinqlinks_data.append(qinqlink_data)

            #URL_PUT_DEVICE_QINQ_LINK = URL_GET_DEVICE_QINQ_LINK + '/qinq-link/{qinq_link_id}'.format(qinq_link_id=config['qinq-link-id'])
            #req_put_qinq_links = put_request(URL_PUT_DEVICE_QINQ_LINK, qinqlink_data)


        aai_qinqlinks_data['qinqlinks'][node] = current_node_qinqlinks_data
    """        
    with open('json/huawei/qinqlinks.json', 'w') as fp:
        json.dump(qinqlinks, fp)
    """
    fp = open('qinqlinks.json', 'w+') 
    json.dump(aai_qinqlinks_data, fp)
    fp.close()
    #print(aai_qinqlinks_data)

if __name__ == "__main__":
    update()
