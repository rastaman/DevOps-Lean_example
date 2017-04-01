
################################
# Define our base network 
################################

module "networking" {
    source = "../../../../../02-modules/01-aws/networking"

    vpc_env   = "${var.vpc_env}"
    project   = "${var.project}"
    CostGroup = "${var.CostGroup}"

    cidr_prefix  = "${var.cidr_prefix}"
    number_of_zones = "${var.number_of_zones}"

   permanent_ip_ids = [ "${data.terraform_remote_state.permanent_ips.perm_eip_ids}" ]
}

######################################
# Output networking states to remote
######################################

output "vpc_id" {
  value = "${module.networking.vpc_id}"
}

output "public_subnet_ids" {
  value = [ "${module.networking.public_subnet_ids}" ]
}

output "route_nat_ids" {
  value = [ "${module.networking.route_nat_ids}" ]
}
