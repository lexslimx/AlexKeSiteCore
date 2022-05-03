targetScope='subscription'

param resourceGroupName string = 'alexke-rg'
param resourceGroupLocation string = 'southafricanorth'

resource newRG 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

module alexkecluster 'kubernetes.bicep' = {
  name: 'alexkecluster'
  scope: newRG
  dependsOn:[
    alexkepublicip
  ]
  params: {
    location: resourceGroupLocation
    clustername:'alexkecluster'
  }
}

module alexkepublicip 'publicip.bicep' = {
  name: 'alexkepublicip'
  scope: newRG
  params: {
    location: resourceGroupLocation
  }
}







