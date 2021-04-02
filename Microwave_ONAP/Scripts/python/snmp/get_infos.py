import get_neighbords
import get_elines
import get_qinqlinks
import get_vlan_nec
import os
import json
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


def lldp_info_retrieve():
    #Retrieving LLDP tables for NEC and Huawei devices
    try:
        print('Retrieving LLDP tables from devices...')
        get_neighbords.get()
        print('LLDP Retrieving : Success')
    except  Exception as ex:
        print('Error while retrieving LLDP Infos -> %s' % ex)
        pass

#QinQ Links and E-Lines retrieving 
def huawei_links():
    try :
        print('Retrieving QinQ tables from RTN devices...')
        get_qinqlinks.update()
        print('Retrieving Eline tables from RTN devices...')
        get_elines.update()
        print('Huawei Links Retrieving : Success')
    except  Exception as ex:
        print('Error while retrieving Huawei Links Infos -> %s' % ex)
        pass

#NEC VLAN configurations retrieving
def nec_vlans():
    try:
        print('Retrieving VLAN config from NEC devices...')
        get_vlan_nec.updata_vlan()
        print('NEC Vlans Retrieving : Success')
    except Exception as ex:
        print('Error while retrieving NEC devices configuration  -> %s' % ex)
        pass




#run in workflow
if __name__ == "__main__":
    lldp_info_retrieve()
    huawei_links()
    nec_vlans()
    print("Print Get_Infos result")

    f=open("neighbordships.json",)
    neighbordships = json.load(f)
    f.close()
    print(neighbordships)

    f=open("elines.json",)
    elines = json.load(f)
    f.close()
    print(elines)

    f=open("qinqlinks.json",)
    qinqlinks = json.load(f)
    f.close()
    print(qinqlinks)

    f=open("nec_vlans.json",)
    nec_vlans = json.load(f)
    f.close()
    print(nec_vlans)

    os.remove("inventory.json")
    os.remove("neighbordships.json")
    os.remove("elines.json")
    os.remove("qinqlinks.json")
    os.remove("nec_vlans.json")

