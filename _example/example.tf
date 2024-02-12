provider "google" {
  project = "local-concord-408802"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

module "labels" {
  source      = "git::git@github.com:opsstation/terraform-gcp-labels.git?ref=v1.0.0"
  name        = "labels"
  environment = "test"
  label_order = ["name", "environment"]
}
###################################################################
##=======================  (VPC)  ===============================##
###################################################################
module "vpc" {
  source                                    = "../"
  name                                      = "dev"
  environment                               = "test"
  label_order                               = ["name", "environment"]
  mtu                                       = 1460
  routing_mode                              = "REGIONAL"
  google_compute_network_enabled            = true
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
  delete_default_routes_on_create           = false
}