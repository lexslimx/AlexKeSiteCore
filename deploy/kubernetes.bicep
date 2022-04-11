param clustername string
param location string
param dnsPrefix string = 'alexke'
targetScope= 'resourceGroup'

resource alexkecluster 'Microsoft.ContainerService/managedClusters@2022-01-01' = {
  name: clustername
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    dnsPrefix: dnsPrefix
    agentPoolProfiles: [
      {
        name: 'agentpool'
        osDiskSizeGB: 30
        count: 2
        vmSize: 'Standard_D2s_v3'
        osType: 'Linux'
        mode: 'System'
      }
    ]
  }
}

output controlPlaneFQDN string =alexkecluster.properties.fqdn
