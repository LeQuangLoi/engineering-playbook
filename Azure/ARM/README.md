# ARM and Bicep

Infrastructure-as-code templates for Azure resources.

## Contents

- [main.bicep](main.bicep): Deploys a virtual network with two configurable subnets.

## Prerequisites

- Azure CLI with Bicep support.
- An Azure subscription and resource group.
- Permission to deploy `Microsoft.Network/virtualNetworks`.

## Validate and Deploy

From this directory, validate the template:

```bash
az bicep build --file main.bicep
```

Preview a deployment:

```bash
az deployment group what-if \
	--resource-group <resource-group> \
	--template-file main.bicep \
	--parameters virtualNetworkName=<virtual-network-name>
```

Deploy after reviewing the what-if result:

```bash
az deployment group create \
	--resource-group <resource-group> \
	--template-file main.bicep \
	--parameters virtualNetworkName=<virtual-network-name>
```

## Parameters

- `location`: Defaults to the resource group's location.
- `virtualNetworkName`: Required virtual network name.
- `virtualNetworkAddressSpace`: Defaults to `10.0.0.0/16`.
- `subnetOneAddressPrefix`: Defaults to `10.0.0.0/24`.
- `subnetTwoAddressPrefix`: Defaults to `10.0.1.0/24`.

Do not deploy overlapping address spaces. Replace all placeholders and review the target subscription before deployment.
