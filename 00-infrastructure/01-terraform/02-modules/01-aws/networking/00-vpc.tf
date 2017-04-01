/* This creates a basic VPC in a region for a project and storews the state in remote s3 bucket */

################################
# Define our VPC
################################

# https://www.terraform.io/docs/providers/aws/d/vpc.html

resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_prefix}.0.0/16"

  enable_dns_support = true
  enable_dns_hostnames = true

  tags { 
    Name = "vpc-${var.vpc_env}" 
    project = "${var.project}"
    CostCentre = "${var.CostGroup}"
  }
}

################################
# Define our VPC output
################################

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}



