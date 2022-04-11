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
  params: {
    location: resourceGroupLocation
    clustername:'alexkecluster'
  }
}





