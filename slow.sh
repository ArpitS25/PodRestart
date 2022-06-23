#!/bin/bash
SLEEP_TIME1="110"
SLEEP_TIME2="90"
echo "Geting Pod Details from Cluster"
echo ""
echo ""

#gke_appointy-test_europe-west1-c_devqa-cluster
#nginx

kubectl --context gke_appointy-test_europe-west1-c_devqa-cluster -n infratest get pod | egrep -i 'nginx' | awk '{print $1}'i | head -n 3  >> /tmp/head
echo  "Current pod Details from Cluster"
echo ""
echo "nginx pod"
echo ""
echo  "Start pod delete process"
echo ""
#cat /tmp/head
kubectl --context gke_appointy-test_europe-west1-c_devqa-cluster -n infratest delete pod $(cat /tmp/head)
sleep ${SLEEP_TIME1}
echo ""
echo "New Pod Details from cluster"
echo ""
kubectl --context gke_appointy-test_europe-west1-c_devqa-cluster -n infratest get pod | egrep -i 'nginx' | awk '{print $1}'
echo ""
echo "New pods status"
echo ""
echo "Waiting for pod from cluster"
echo ""
sleep ${SLEEP_TIME2}
kubectl --context gke_appointy-test_europe-west1-c_devqa-cluster -n infratest get pod | egrep -i 'nginx'
echo ""
echo "Pod delete process finish!"
echo ""
rm -rf /tmp/head
rm -rf /tmp/tail
echo "Thank You for using auto-pod rotation script for Appointy"
echo ""
