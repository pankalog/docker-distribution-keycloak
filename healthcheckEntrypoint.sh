#!/bin/bash
cd /opt/keycloak/bin
while true; do
  ./kcadm.sh config credentials --server http://localhost:8080 --realm master --user admin --client admin-cli
  response=$(./kcadm.sh get users/count -r test)
  echo "$response"
  if [ -n "$response" ] && [ $response -ge 1 ]; then
    echo "Keycloak has started"
    break
  else
    echo "Waiting for Keycloak to start..."
    sleep 5
  fi
done

./kcadm.sh get clients/ca2d03d4-f12d-4229-80cf-06f5dc5a5f35/installation/providers/docker-v2-compose-yaml -r test > adapterOutput.zip

unzip adapterOutput.zip -d /registry/

echo "Adapter output unzipped"
exit 0

# Check if the cert.pem file exists in the /providers/ directory
if [ ! -f /registry/keycloak-docker-compose-yaml/certs/localhost.crt ]; then
  echo "cert.pem not found"
  exit 1
fi
exit 0