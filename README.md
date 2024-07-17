# Terraform-gcp-vpc
# Terraform Google Cloud VPC Module

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Authors](#authors)
- [License](#license)

## Introduction
This Terraform module creates structured vpc for GCP resources with specific attributes.

## Usage

- Use the module by referencing its source and providing the required variables.
## Example: vpc
```hcl
module "vpc" {
  source                                    = "git::https://github.com/yadavprakash/terraform-gcp-vpc.git"
  name                                      = "dev"
  environment                               = "test"
  label_order                               = ["name", "environment"]
  mtu                                       = 1460
  routing_mode                              = "REGIONAL"
  google_compute_network_enabled            = true
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
  delete_default_routes_on_create           = false
}

```
Please ensure you specify the correct 'source' path for the module.

## Module Inputs

- `name`: The name of the application or resource.
- `environment`: The environment in which the resource exists.
- `label_order`: The order in which labels should be applied.
- `business_unit`: The business unit associated with the application.
- `attributes`: Additional attributes to add to the labels.
- `extra_tags`: Extra tags to associate with the resource.

## Module Outputs
- This module currently does not provide any outputs.

# Examples
For detailed examples on how to use this module, please refer to the [example](https://github.com/yadavprakash/terraform-gcp-vpc/tree/master/_example) directory within this repository.

## Authors
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/yadavprakash/terraform-gcp-vpc/blob/master/LICENSE) file for details.



<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.50, < 5.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.50, < 5.11.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git::git@github.com:yadavprakash/terraform-gcp-labels.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_network.vpc_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_subnetworks"></a> [auto\_create\_subnetworks](#input\_auto\_create\_subnetworks) | (Optional) When set to true, the network is created in [auto\_subnet\_mode] and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. | `bool` | `false` | no |
| <a name="input_delete_default_routes_on_create"></a> [delete\_default\_routes\_on\_create](#input\_delete\_default\_routes\_on\_create) | (Optional) If set to true, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) An optional description of the VPC. The resource must be recreated to modify this field.Default is ''. | `string` | `""` | no |
| <a name="input_enable_ula_internal_ipv6"></a> [enable\_ula\_internal\_ipv6](#input\_enable\_ula\_internal\_ipv6) | (Optional) Enable ULA internal ipv6 on this network. Enabling this feature will assign a /48 from google defined ULA prefix fd20::/20. | `bool` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_google_compute_network_enabled"></a> [google\_compute\_network\_enabled](#input\_google\_compute\_network\_enabled) | A boolean flag to enable/disable vpc. | `bool` | `true` | no |
| <a name="input_internal_ipv6_range"></a> [internal\_ipv6\_range](#input\_internal\_ipv6\_range) | (Optional) When enabling ula internal ipv6, caller optionally can specify the /48 range they want from the google defined ULA prefix fd20::/20. The input must be a valid /48 ULA IPv6 address and must be within the fd20::/20. Operation will fail if the speficied /48 is already in used by another resource. If the field is not speficied, then a /48 range will be randomly allocated from fd20::/20 and returned via this field. | `bool` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | `[]` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy,yadavprakash'. | `string` | `"yadavprakash'."` | no |
| <a name="input_mtu"></a> [mtu](#input\_mtu) | (Optional) Maximum Transmission Unit in bytes. The minimum value for this field is 1460 and the maximum value is 1500 bytes. Default is '1460'. | `number` | `1460` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_network_firewall_policy_enforcement_order"></a> [network\_firewall\_policy\_enforcement\_order](#input\_network\_firewall\_policy\_enforcement\_order) | (Optional) Set the order that Firewall Rules and Firewall Policies are evaluated. Default value is AFTER\_CLASSIC\_FIREWALL. Possible values are: BEFORE\_CLASSIC\_FIREWALL, AFTER\_CLASSIC\_FIREWALL | `string` | `"AFTER_CLASSIC_FIREWALL"` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `""` | no |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | - (Optional) The network-wide routing mode to use. If set to REGIONAL, this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. | `string` | `"REGIONAL"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gateway_ipv4"></a> [gateway\_ipv4](#output\_gateway\_ipv4) | The IPv4 address of the gateway |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | The URI of the created resource |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The outputs of the created VPC. |
<!-- END_TF_DOCS -->