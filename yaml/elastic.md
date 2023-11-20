### Allow Kubernetes get the necessary credentials 
kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole=cluster-admin \
    --user=$(gcloud config get-value core/account)


### Clear the default version
istioctl x uninstall --purge

### Install on the new version
istioctl uninstall --purge

### this will create custom crds for elasticsearch
kubectl create -f https://download.elastic.co/downloads/eck/2.3.0/crds.yaml

### Enable namespace
kubectl label namespace elastic-system istio-injection=enabled

### install the operator with its RBAC rules
### this will create namespace called elastic-system and install elastic operator on it
kubectl apply -f https://download.elastic.co/downloads/eck/2.3.0/operator.yaml

### To check resource in a namespace
kubectl get all -n elastic-system

### get password for elastic-search system
❯❯ PASSWORD=$(kubectl get secret np-elasticsearch-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode)


### port forward cluster ip service
❯❯ kubectl port-forward service/np-elasticsearch-es-http 9200

### Save elastic password to Cli
PASSWORD=$(kubectl get secret np-elasticsearch-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode)

### reach access elasticsearch api via curl with baseic auth
❯❯ curl -u "elastic:$PASSWORD" -k "https://localhost:9200"

### deploy kibana
❯❯ kubectl apply -f kibana.yaml


### port forward kibana cluster ip service
❯❯ kubectl port-forward service/np-elasticsearch-kb-http 5601


kubectl rollout restart deployment

Use the elastic password to login to kibana
