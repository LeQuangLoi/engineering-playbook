@description('Azure region where the virtual network is deployed.')
param location string = resourceGroup().location

@description('Name of the virtual network.')
param virtualNetworkName string

@description('Address space for the virtual network.')
param virtualNetworkAddressSpace string = '10.0.0.0/16'

@description('Address prefix for the first subnet.')
param subnetOneAddressPrefix string = '10.0.0.0/24'

@description('Address prefix for the second subnet.')
param subnetTwoAddressPrefix string = '10.0.1.0/24'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [virtualNetworkAddressSpace]
    }
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: subnetOneAddressPrefix
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: subnetTwoAddressPrefix
        }
      }
    ]
  }
}

output virtualNetworkId string = virtualNetwork.id
output virtualNetworkName string = virtualNetwork.name
