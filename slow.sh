#!/bin/bash

cloud auth activate-service-account --key-file=/tmp/serviceaccount4.json
gcloud container clusters get-credentials staging-production --zone europe-west1-c --project appointy-prod
#gke_appointy-prod_europe-west1-c_staging-production

context=gke_appointy-prod_europe-west1-c_staging-production
namespace=prod
SLEEP_TIME1="110"
SLEEP_TIME2="90"

PRINT () {
    echo ""
    echo "######################################"
    echo "$1"
    echo "######################################"
    echo ""
}


PRINT 'Geting Pod Details from Cluster'



echo "Counting Number of pods"

podcount=$(kubectl --context $context -n $namespace get pod | egrep -i $podname | awk '{print $1}'i | awk '{print $1}'i | wc -l)

#echo '#########################'
PRINT "Number of Pod is $podcount"
#echo '#########################'

temp=$(($podcount%2))

if [ $temp -eq 1 ]
then
    headcount=$(($podcount/2))
    tailcount=$(($podcount - $headcount))
    kubectl --context $context -n $namespace get pod | egrep -i $podname | awk '{print $1}'i | head -n $headcount >> /tmp/head
    kubectl --context $context -n $namespace get pod | egrep -i $podname | awk '{print $1}'i | tail -n $tailcount >> /tmp/tail 
else
    count=$(($podcount/2))
    kubectl --context $context -n $namespace get pod | egrep -i $podname | awk '{print $1}'i | head -n $count >> /tmp/head
    kubectl --context $context -n $namespace get pod | egrep -i $podname | awk '{print $1}'i | tail -n $count >> /tmp/tail
fi
     

PRINT "Current pod Details from Cluster"

echo '######### POD ##########'
cat /tmp/head 
cat /tmp/tail
echo '########################'



PRINT  "Start pod delete process"

#cat /tmp/head
if [ -s /tmp/head ]
then
    kubectl --context $context -n $namespace delete pod $(cat /tmp/head)
    sleep ${SLEEP_TIME1}
fi

#cat /tmp/tail
kubectl --context $context -n $namespace delete pod $(cat /tmp/tail)

PRINT "New Pod Details from cluster"
kubectl --context $context -n $namespace get pod | egrep -i $podname | awk '{print $1}'

PRINT "Waiting for pod from cluster"
sleep ${SLEEP_TIME2}
kubectl --context $context -n $namespace get pod | egrep -i $podname

PRINT "Pod delete process finish!"
rm -rf /tmp/head
rm -rf /tmp/tail
PRINT "Thank You for using auto-pod rotaion script for Appointy"
