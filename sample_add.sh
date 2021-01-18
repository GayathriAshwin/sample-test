#!/bin/bash

# Script used to add a history message to the deployment

msg=$1

security_header=`/opt/python-2.6.4/bin/python /0config/create_security_header.py`

url="https://IBMWorkloadDeployer:9443/services/deployments/${DEPLOYMENT_ID}/command"

cmd={\"operation\":\"addHistory\",\"history_message\":\""${msg}"\"}

curl -X POST -H "X-IWD-Authorization : $security_header" -H "Content-Type: application/json" --cacert /0config/cert.tmp/cert_1.pem  -d "${cmd}"  --url "$url"
