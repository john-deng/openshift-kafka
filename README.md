> Thanks https://github.com/Yolean/kubernetes-kafka.


```sh
# Pre-req
git clone https://github.com/debianmaster/openshift-kafka.git && cd openshift-kafka

# Unfortunately we need root priv for the containers that are used in this example
oc adm policy add-scc-to-user anyuid -z default

# Create namespace
oc new-project kafka

# Create Persistant Volumes
./zookeeper/bootstrap/pv.sh
./bootstrap/pv.sh

# Create  Persistant volumes claims
oc create -f ./bootstrap/pvc.yml
oc create -f ./zookeeper/bootstrap/pvc.yml

# Create Zookeeper & Kakfa
oc create -f ./zookeeper/service.yml
oc create -f ./zookeeper/zookeeper.yaml 
oc create -f ./

# Cleanup
oc delete all,petset --all
oc delete pv,pvc --all
```
