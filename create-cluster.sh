az group create --name k8sDemoResourceGroup --location westeurope

ACR=demoacr$RANDOM

az acr create -n $ACR -g k8sDemoResourceGroup --sku basic

az aks create --resource-group k8sDemoResourceGroup --name myAksCluster --node-count 1 --enable-addons monitoring --generate-ssh-keys

az aks install-cli

az aks get-credentials --resource-group k8sDemoResourceGroup --name myAksCluster

demoacr1480.azurecr.io


az aks update -n myAksCluster -g k8sDemoResourceGroup --attach-acr demoacr1480

 az acr login -n demoacr1480
 