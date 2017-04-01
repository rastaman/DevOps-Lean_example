/* Define our vpc */
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

#confgure AWS routing table for VPC



# 
# https://www.terraform.io/docs/providers/aws/r/vpc_endpoint.html

resource "aws_vpc_endpoint" "private-s3" {
    vpc_id = "${aws_vpc.vpc.id}"
    service_name = "com.amazonaws.eu-west-1.s3"
    route_table_ids = [ "${aws_route_table.public.id}", "${aws_route_table.nat.*.id}" ]
}

output vpc_endpoint_id {
  value = "${aws_vpc_endpoint.private-s3.id}"
}

