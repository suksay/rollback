#! /bin/sh
echo "Sending request"

curl --location --request POST 'http://localhost:8000/api/v1/execution-service/process' \
--header 'Content-Type: application/json' \
--header 'Authorization: Basic Y2NzZGthcHBzOmNjc2RrYXBwcw==' \
--data '{
    "actionIdentifiers": {
        "mode": "sync",
        "blueprintName": "mw-manager",
        "blueprintVersion": "1.1.0",
        "actionName": "network-discovery"
    },
    "payload": {
        "network-discovery-request" :{}
    },
    "commonHeader": {
        "subRequestId": "143748f9-3cd5-4910-81c9-a4601ff2ea58",
        "requestId": "e5eb1f1e-3386-435d-b290-d49d8af8db4c",
        "originatorId": "SDNC_DG"
    }
}' | python -m json.tool


