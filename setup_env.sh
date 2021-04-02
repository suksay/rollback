{
    "commonHeader": {
        "timestamp": "2021-03-29T13:54:51.283Z",
        "originatorId": "SDNC_DG",
        "requestId": "e5eb1f1e-3386-435d-b290-d49d8af8db4c",
        "subRequestId": "143748f9-3cd5-4910-81c9-a4601ff2ea58",
        "flags": null
    },
    "actionIdentifiers": {
        "blueprintName": "mw-manager",
        "blueprintVersion": "1.1.0",
        "actionName": "network-discovery",
        "mode": "sync"
    },
    "status": {
        "code": 200,
        "eventType": "EVENT_COMPONENT_EXECUTED",
        "timestamp": "2021-03-29T13:56:25.270Z",
        "errorMessage": null,
        "message": "success"
    },
    "payload": {
        "network-discovery-response": {
            "execute-command-logs": [
                "Retrieving LLDP tables from devices...",
                "DEBUG: len of result from fetch() 1",
                "DEBUG: len of result from fetch() 0",
                "DEBUG: len of result from fetch() 1",
                "DEBUG: len of result from fetch() 0",
                "DEBUG: len of result from fetch() 1",
                "DEBUG: len of result from fetch() 0",
                "DEBUG: len of result from fetch() 1",
                "DEBUG: len of result from fetch() 0",
                "DEBUG: len of result from fetch() 2",
                "DEBUG: len of result from fetch() 1",
                "DEBUG: len of result from fetch() 2",
                "DEBUG: len of result from fetch() 1",
                "DEBUG: len of result from fetch() 2",
                "DEBUG: len of result from fetch() 1",
                "DEBUG: len of result from fetch() 6",
                "DEBUG: len of result from fetch() 1",
                "DEBUG: len of result from fetch() 1",
                "DEBUG: len of result from fetch() 1",
                "DEBUG: len of result from fetch() 2",
                "DEBUG: len of result from fetch() 1",
                "{}",
                "{'neighborships': []}",
                "LLDP Retrieving : Success",
                "Retrieving QinQ tables from RTN devices...",
                "DEBUG: len of result from fetch() 18",
                "DEBUG: len of result from fetch() 18",
                "DEBUG: len of result from fetch() 0",
                "DEBUG: len of result from fetch() 0",
                "QINQ-LINKS not exist",
                "QINQ-LINKS not exist",
                "QINQ-LINKS not exist",
                "QINQ-LINKS not exist",
                "{'qinqlinks': {'0x346ac21d93b9': [{'qinq-link-id': '1', 'port-name': '3/255/1', 'qinq-vlan-id': '123', 'status': 'active'}, {'qinq-link-id': '2', 'port-name': '3/255/1', 'qinq-vlan-id': '1', 'status': 'active'}, {'qinq-link-id': '3', 'port-name': '3/255/1', 'qinq-vlan-id': '1234', 'status': 'active'}], '0x346ac25f1b5c': [{'qinq-link-id': '1', 'port-name': '3/255/1', 'qinq-vlan-id': '123', 'status': 'active'}, {'qinq-link-id': '2', 'port-name': '3/255/1', 'qinq-vlan-id': '1', 'status': 'active'}, {'qinq-link-id': '3', 'port-name': '3/255/1', 'qinq-vlan-id': '1234', 'status': 'active'}], '0x883fd3386dd1': [], '0x18ded7a85991': []}}",
                "Retrieving Eline tables from RTN devices...",
                "DEBUG: len of result from fetch() 33",
                "DEBUG: len of result from fetch() 33",
                "DEBUG: len of result from fetch() 0",
                "DEBUG: len of result from fetch() 0",
                "DEBUG: len of result from fetch() 0",
                "DEBUG: len of result from fetch() 0",
                "DEBUG: len of result from fetch() 56",
                "DEBUG: len of result from fetch() 56",
                "DEBUG: len of result from fetch() 0",
                "DEBUG: len of result from fetch() 0",
                "DEBUG: len of result from fetch() 0",
                "DEBUG: len of result from fetch() 0",
                "0X883FD3386DD1?DEPTH=ALL not exist",
                "0X18DED7A85991?DEPTH=ALL not exist",
                "{'elines': {'0x346ac21d93b9': {'uni2nnis': [{'link-id': '1.1.1', 'nms-index': '1', 'link-name': '950-1-REN-950-2-REN-E-Line-00003', 'port': '1/255/1', 'qinq-link-id': '1', 'vlan-list': \"['785']\", 'status': 'active'}, {'link-id': '2.1.1', 'nms-index': '2', 'link-name': 'Energy test', 'port': '1/255/2', 'qinq-link-id': '2', 'vlan-list': \"['1234']\", 'status': 'active'}, {'link-id': '3.1.1', 'nms-index': '3', 'link-name': '950-1-REN-950-2-REN-E-Line-00006', 'port': '6/255/3', 'qinq-link-id': '3', 'vlan-list': \"['123']\", 'status': 'active'}], 'uni2unis': [], 'nni2nnis': []}, '0x346ac25f1b5c': {'uni2nnis': [{'link-id': '1.1.1', 'nms-index': '1', 'link-name': '950-1-REN-950-2-REN-E-Line-00003', 'port': '1/255/1', 'qinq-link-id': '1', 'vlan-list': \"['777']\", 'status': 'active'}, {'link-id': '2.1.1', 'nms-index': '2', 'link-name': 'Energy test', 'port': '1/255/2', 'qinq-link-id': '2', 'vlan-list': \"['1234']\", 'status': 'active'}, {'link-id': '3.1.1', 'nms-index': '3', 'link-name': '950-1-REN-950-2-REN-E-Line-00006', 'port': '6/255/3', 'qinq-link-id': '3', 'vlan-list': \"['123']\", 'status': 'active'}], 'uni2unis': [], 'nni2nnis': []}, '0x883fd3386dd1': {'uni2nnis': [], 'uni2unis': [{'link-id': '1.1.2', 'nms-index': '1', 'link-name': '980-1-REN/22/1--980-2-REN/17/11599743455319', 'port-a': '22/255/1', 'vlan-list-a': \"['20']\", 'port-b': '14/255/1', 'vlan-list-b': \"['20']\", 'status': 'active'}, {'link-id': '2.1.2', 'nms-index': '2', 'link-name': '980-1-REN/22/1--980-2-REN/17/11599743552225', 'port-a': '22/255/1', 'vlan-list-a': \"['30']\", 'port-b': '14/255/1', 'vlan-list-b': \"['30']\", 'status': 'active'}, {'link-id': '3.1.2', 'nms-index': '3', 'link-name': '980-1-REN/22/2--980-2-REN/17/11599743796087', 'port-a': '22/255/2', 'vlan-list-a': \"['40', '41', '42', '43', '44', '45', '48']\", 'port-b': '14/255/1', 'vlan-list-b': \"['40', '41', '42', '43', '44', '45', '48']\", 'status': 'active'}, {'link-id': '4.1.2', 'nms-index': '4', 'link-name': 'popo', 'port-a': '22/255/2', 'vlan-list-a': \"['888']\", 'port-b': '14/255/1', 'vlan-list-b': \"['888']\", 'status': 'active'}], 'nni2nnis': []}, '0x18ded7a85991': {'uni2nnis': [], 'uni2unis': [{'link-id': '1.1.2', 'nms-index': '1', 'link-name': '980-1-REN/22/1--980-2-REN/17/11599743455319', 'port-a': '14/255/1', 'vlan-list-a': \"['20']\", 'port-b': '17/255/1', 'vlan-list-b': \"['20']\", 'status': 'active'}, {'link-id': '2.1.2', 'nms-index': '2', 'link-name': '980-1-REN/22/1--980-2-REN/17/11599743552225', 'port-a': '14/255/1', 'vlan-list-a': \"['30']\", 'port-b': '17/255/1', 'vlan-list-b': \"['30']\", 'status': 'active'}, {'link-id': '3.1.2', 'nms-index': '3', 'link-name': '980-1-REN/22/2--980-2-REN/17/11599743796087', 'port-a': '14/255/1', 'vlan-list-a': \"['40', '41', '42', '43', '44', '45', '48']\", 'port-b': '17/255/1', 'vlan-list-b': \"['40', '41', '42', '43', '44', '45', '48']\", 'status': 'active'}, {'link-id': '4.1.2', 'nms-index': '4', 'link-name': 'popo', 'port-a': '14/255/1', 'vlan-list-a': \"['888']\", 'port-b': '17/255/2', 'vlan-list-b': \"['888']\", 'status': 'active'}], 'nni2nnis': []}}}",
                "Huawei Links Retrieving : Success",
                "Retrieving VLAN config from NEC devices...",
                "DEBUG: len of result from fetch() 4",
                "DEBUG: len of result from fetch() 10",
                "DEBUG: len of result from fetch() 10",
                "DEBUG: len of result from fetch() 15",
                "DEBUG: len of result from fetch() 10",
                "DEBUG: len of result from fetch() 18",
                "DEBUG: len of result from fetch() 4",
                "DEBUG: len of result from fetch() 10",
                "DEBUG: len of result from fetch() 8",
                "DEBUG: len of result from fetch() 0",
                "DEBUG: len of result from fetch() 20",
                "DEBUG: len of result from fetch() 9",
                "DEBUG: len of result from fetch() 10",
                "DEBUG: len of result from fetch() 10",
                "DEBUG: len of result from fetch() 7",
                "{'nec_vlans': {'0x8cdf9d5a4b80': [{'vlan-id': 15, 'vlan-name': 'OMA-JRE_test_V1', 'vlan-mode': 'trunk', 'port-id': 16842752, 'port-name': 'Modem-1'}, {'vlan-id': 30, 'vlan-name': 'OMA-JRE_test_V2', 'vlan-mode': 'trunk', 'port-id': 16842752, 'port-name': 'Modem-1'}, {'vlan-id': 1, 'vlan-name': 'default', 'vlan-mode': 'access', 'port-id': 83951616, 'port-name': 'Ethernet_9/1'}, {'vlan-id': 1, 'vlan-name': 'default', 'vlan-mode': 'access', 'port-id': 84017152, 'port-name': 'Ethernet_9/2'}, {'vlan-id': 1, 'vlan-name': 'default', 'vlan-mode': 'access', 'port-id': 84082688, 'port-name': 'Ethernet_9/3'}, {'vlan-id': 1, 'vlan-name': 'default', 'vlan-mode': 'access', 'port-id': 84148224, 'port-name': 'Ethernet_9/4'}, {'vlan-id': 15, 'vlan-name': 'OMA-JRE_test_V1', 'vlan-mode': 'trunk', 'port-id': 142671872, 'port-name': 'Ethernet_16/1'}, {'vlan-id': 30, 'vlan-name': 'OMA-JRE_test_V2', 'vlan-mode': 'tunnel', 'port-id': 142737408, 'port-name': 'Ethernet_16/2'}, {'vlan-id': 1, 'vlan-name': 'default', 'vlan-mode': 'access', 'port-id': 142802944, 'port-name': 'Ethernet_16/3'}, {'vlan-id': 1, 'vlan-name': 'default', 'vlan-mode': 'access', 'port-id': 142868480, 'port-name': 'Ethernet_16/4'}], '0x8cdf9d4efe40': [{'vlan-id': 700, 'vlan-name': '736e6d702d74657374', 'vlan-mode': 'trunk', 'port-id': 8454144, 'port-name': 'Ethernet_0/1'}, {'vlan-id': 352, 'vlan-name': 'Snmp-352', 'vlan-mode': 'trunk', 'port-id': 8519680, 'port-name': 'Ethernet_0/2'}, {'vlan-id': 1, 'vlan-name': 'default', 'vlan-mode': 'access', 'port-id': 8585216, 'port-name': 'Ethernet_0/3'}, {'vlan-id': 1, 'vlan-name': 'default', 'vlan-mode': 'access', 'port-id': 8650752, 'port-name': 'Ethernet_0/4'}, {'vlan-id': 100, 'vlan-name': 'test', 'vlan-mode': 'trunk', 'port-id': 16842752, 'port-name': 'Modem-1'}, {'vlan-id': 200, 'vlan-name': 'test1', 'vlan-mode': 'trunk', 'port-id': 16842752, 'port-name': 'Modem-1'}, {'vlan-id': 1, 'vlan-name': 'default', 'vlan-mode': 'trunk', 'port-id': 25231360, 'port-name': 'Modem-2'}, {'vlan-id': 100, 'vlan-name': 'test', 'vlan-mode': 'trunk', 'port-id': 33619968, 'port-name': 'Ethernet_3/1'}, {'vlan-id': 520, 'vlan-name': '09/08/2020,07:36:30', 'vlan-mode': 'trunk', 'port-id': 33619968, 'port-name': 'Ethernet_3/1'}, {'vlan-id': 600, 'vlan-name': 'Silas-Test-1', 'vlan-mode': 'access', 'port-id': 33619968, 'port-name': 'Ethernet_3/1'}, {'vlan-id': 667, 'vlan-name': '09/07/2020,20:47:16', 'vlan-mode': 'trunk', 'port-id': 33619968, 'port-name': 'Ethernet_3/1'}, {'vlan-id': 2000, 'vlan-name': '09/07/2020,14:10:23', 'vlan-mode': 'trunk', 'port-id': 33619968, 'port-name': 'Ethernet_3/1'}, {'vlan-id': 2001, 'vlan-name': '09/07/2020,14:22:16', 'vlan-mode': 'trunk', 'port-id': 33619968, 'port-name': 'Ethernet_3/1'}, {'vlan-id': 4002, 'vlan-name': '09/07/2020,15:22:02', 'vlan-mode': 'trunk', 'port-id': 33619968, 'port-name': 'Ethernet_3/1'}, {'vlan-id': 200, 'vlan-name': 'test1', 'vlan-mode': 'trunk', 'port-id': 33685504, 'port-name': 'Ethernet_3/2'}, {'vlan-id': 520, 'vlan-name': '09/08/2020,07:36:30', 'vlan-mode': 'trunk', 'port-id': 33685504, 'port-name': 'Ethernet_3/2'}, {'vlan-id': 1, 'vlan-name': 'default', 'vlan-mode': 'access', 'port-id': 33751040, 'port-name': 'Ethernet_3/3'}, {'vlan-id': 1, 'vlan-name': 'default', 'vlan-mode': 'access', 'port-id': 33816576, 'port-name': 'Ethernet_3/4'}], '0x00255ce8fef0': [{'vlan-id': 100, 'vlan-name': 'ixia port4', 'vlan-mode': 'trunk', 'port-id': 8454144, 'port-name': 'Ethernet_0/1'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'access', 'port-id': 8519680, 'port-name': 'Ethernet_0/2'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'access', 'port-id': 8585216, 'port-name': 'Ethernet_0/3'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'access', 'port-id': 8650752, 'port-name': 'Ethernet_0/4'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'access', 'port-id': 8716288, 'port-name': 'Ethernet_0/5'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'access', 'port-id': 8781824, 'port-name': 'Ethernet_0/6'}, {'vlan-id': 100, 'vlan-name': 'ixia port4', 'vlan-mode': 'trunk', 'port-id': 16842752, 'port-name': 'Modem-1'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'trunk', 'port-id': 25231360, 'port-name': 'Modem-2'}], '0x8cdf9dc01100': [{'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'trunk', 'port-id': 25231360, 'port-name': 'Modem-2'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'trunk', 'port-id': 33619968, 'port-name': 'Modem-3'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'trunk', 'port-id': 75563008, 'port-name': 'Modem-7'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'access', 'port-id': 83951616, 'port-name': 'Ethernet_9/1'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'access', 'port-id': 84017152, 'port-name': 'Ethernet_9/2'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'access', 'port-id': 84082688, 'port-name': 'Ethernet_9/3'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'access', 'port-id': 84148224, 'port-name': 'Ethernet_9/4'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'access', 'port-id': 117506048, 'port-name': 'Ethernet_13/1'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'access', 'port-id': 125894656, 'port-name': 'Ethernet_14/1'}], '0x8cdf9d6602d0': [{'vlan-id': 100, 'vlan-name': '', 'vlan-mode': 'trunk', 'port-id': 16842752, 'port-name': 'Modem-1'}, {'vlan-id': 100, 'vlan-name': '', 'vlan-mode': 'trunk', 'port-id': 142671872, 'port-name': 'Ethernet_0/1'}, {'vlan-id': 100, 'vlan-name': '', 'vlan-mode': 'trunk', 'port-id': 142737408, 'port-name': 'Ethernet_0/2'}, {'vlan-id': 100, 'vlan-name': '', 'vlan-mode': 'trunk', 'port-id': 142802944, 'port-name': 'Ethernet_0/3'}, {'vlan-id': 100, 'vlan-name': '', 'vlan-mode': 'trunk', 'port-id': 142868480, 'port-name': 'Ethernet_0/4'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'access', 'port-id': 142934016, 'port-name': 'Ethernet_0/5'}, {'vlan-id': 1, 'vlan-name': '', 'vlan-mode': 'access', 'port-id': 142999552, 'port-name': 'Ethernet_0/6'}]}}/opt/app/onap/blueprints/deploy/mw-manager/1.1.0/lib/python3.6/site-packages/urllib3/connectionpool.py:1020: InsecureRequestWarning: Unverified HTTPS request is being made to host 'aai-resources'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#ssl-warnings",
                "InsecureRequestWarning,",
                "/opt/app/onap/blueprints/deploy/mw-manager/1.1.0/lib/python3.6/site-packages/urllib3/connectionpool.py:1020: InsecureRequestWarning: Unverified HTTPS request is being made to host 'aai-resources'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#ssl-warnings",
                "InsecureRequestWarning,",
                "/opt/app/onap/blueprints/deploy/mw-manager/1.1.0/lib/python3.6/site-packages/urllib3/connectionpool.py:1020: InsecureRequestWarning: Unverified HTTPS request is being made to host 'aai-resources'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#ssl-warnings",
                "InsecureRequestWarning,",
                "/opt/app/onap/blueprints/deploy/mw-manager/1.1.0/lib/python3.6/site-packages/urllib3/connectionpool.py:1020: InsecureRequestWarning: Unverified HTTPS request is being made to host 'aai-resources'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#ssl-warnings",
                "InsecureRequestWarning,",
                "/opt/app/onap/blueprints/deploy/mw-manager/1.1.0/lib/python3.6/site-packages/urllib3/connectionpool.py:1020: InsecureRequestWarning: Unverified HTTPS request is being made to host 'aai-resources'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#ssl-warnings",
                "InsecureRequestWarning,",
                "/opt/app/onap/blueprints/deploy/mw-manager/1.1.0/lib/python3.6/site-packages/urllib3/connectionpool.py:1020: InsecureRequestWarning: Unverified HTTPS request is being made to host 'aai-resources'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#ssl-warnings",
                "InsecureRequestWarning,",
                "/opt/app/onap/blueprints/deploy/mw-manager/1.1.0/lib/python3.6/site-packages/urllib3/connectionpool.py:1020: InsecureRequestWarning: Unverified HTTPS request is being made to host 'aai-resources'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#ssl-warnings",
                "InsecureRequestWarning,",
                "/opt/app/onap/blueprints/deploy/mw-manager/1.1.0/lib/python3.6/site-packages/urllib3/connectionpool.py:1020: InsecureRequestWarning: Unverified HTTPS request is being made to host 'aai-resources'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#ssl-warnings",
                "InsecureRequestWarning,",
                "",
                "NEC Vlans Retrieving : Success"
            ]
        }
    }
}