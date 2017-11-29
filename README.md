# Google Cloud Platform Cloud SQL Terraform Module

A Terraform Module for creating a Cloud SQL Database instance, with optional failover instance for HA configurations.

## Usage

```
module "bosh-db" {
  source = "github.com/migs/terraform-gcp-database"
  project = "${var.project}"
  region = "${var.region}"
  authorized_networks = "${module.terraform-gcp-natgateway.nat-gateway-ips["0"]}"
}
```

The `authorized_networks` variable must be a string, containing either an IP address or a network in CIDR format. In the example above, this is string is an output from the `terraform-gcp-natgateway` module.

## High Availability

By passing the `ha` variable as `true`, a failover instance is created which will assume the IP address of the primary instance in the event of a failure.

## Variables

See `variables.tf` for a complete list of variables that can be overridden as required.
