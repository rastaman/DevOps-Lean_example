
################################
# Define our base network 
################################

module "vpc" {
    source = "../../../../../02-modules/01-aws/networking"

    #env       = "${var.env}"
    vpc_env   = "${var.vpc_env}"
    project   = "${var.project}"
    CostGroup = "${var.CostGroup}"

    cidr_prefix  = "${var.cidr_prefix}"
    number_of_zones = "${var.number_of_zones}"

   permanent_ip_ids = [ "${data.terraform_remote_state.permanent_ips.outgoing_eip_ids}" ]
}

################################
# Output VPC states to remote
################################

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "public_subnet_ids" {
  value = [ "${module.vpc.public_subnet_ids}" ]
}

output "services_subnet_ids" {
  value = [ "${module.vpc.services_subnet_ids}" ]
}

output "rds_subnet_ids" {
  value = [ "${module.vpc.rds_subnet_ids}" ]
}

output "internal_zone_id" {
  value = "${module.vpc.internal_zone_id}"
}

output "route_nat_ids" {
  value = [ "${module.vpc.route_nat_ids}" ]
}

output "rds_sng_name" {
  value = [ "${module.vpc.rds_sng_name}" ]
}

output "vpc_enpoint_id" {
  value = [ "${module.vpc.vpc_endpoint_id}" ]
}