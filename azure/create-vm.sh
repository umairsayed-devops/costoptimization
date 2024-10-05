#!/bin/bash

resourceGroup=devops_rg

vmName=az-costoptimization-svc
subnetName=azure-devops-43522-india-vnet
vnetName=azure-devops-43522-india900_z1

az vm create \
  --resource-group $resourceGroup \
  --name $vmName \
  --image Ubuntu2204 \
  --vnet-name $vnetName \
  --size Standard_B1s \
  --location centralindia \
  --subnet $subnetName \
  --generate-ssh-keys \
  --output json \
  --verbose 