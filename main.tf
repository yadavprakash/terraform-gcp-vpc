module "labels" {
  source      = "git::git@github.com:yadavprakash/terraform-gcp-labels.git?ref=v1.0.0"
  name        = var.name
  environment = var.environment
  label_order = var.label_order
  managedby   = var.managedby
  repository  = var.repository
}
data "google_client_config" "current" {
}

########################(vpc)#########################
resource "google_compute_network" "vpc_network" {
  count                                     = var.google_compute_network_enabled && var.enabled ? 1 : 0
  project                                   = data.google_client_config.current.project
  name                                      = var.name
  auto_create_subnetworks                   = var.auto_create_subnetworks
  mtu                                       = var.mtu
  description                               = var.description
  routing_mode                              = var.routing_mode
  enable_ula_internal_ipv6                  = var.enable_ula_internal_ipv6
  internal_ipv6_range                       = var.internal_ipv6_range
  network_firewall_policy_enforcement_order = var.network_firewall_policy_enforcement_order
  delete_default_routes_on_create           = var.delete_default_routes_on_create
}

