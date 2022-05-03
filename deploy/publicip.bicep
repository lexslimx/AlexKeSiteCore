param location string

resource alexkepublicip 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: 'string'
  location: location
  sku: {
    name:'Basic'
  }
  properties: {
    deleteOption:'Delete'
  }
}

output publicIpId string =alexkepublicip.id
