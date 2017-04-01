/* All private subnets can access the internet throught this NAT gateway. This will allow us to standardize ip address on outgoing traffic */

#####################################################
# NAT Gateways for the Private Subnets
#####################################################

# https://www.terraform.io/docs/providers/aws/r/nat_gateway.html

resource "aws_nat_gateway" "nat" {
    allocation_id = "${element(var.permanent_ip_ids,count.index)}"
    subnet_id = "${element(aws_subnet.public.*.id,count.index)}"
    depends_on = ["aws_internet_gateway.igw"]
    count = "${var.number_of_zones}"
}

#####################################################
# Define our routing table for private subnet
##################################################### 

# https://www.terraform.io/docs/providers/aws/d/route_table.html

resource "aws_route_table" "nat" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${element(aws_nat_gateway.nat.*.id,count.index)}"
  }
  tags {
    Name = "route-private${count.index}-${var.vpc_env}-${var.letters[count.index]}"
    CostCentre = "${var.CostGroup}"
  }
  count = "${var.number_of_zones}"
}

#####################################################
# Routing table nat output
##################################################### 

output "route_nat_ids" {
  value = [ "${aws_route_table.nat.*.id}" ]
}
