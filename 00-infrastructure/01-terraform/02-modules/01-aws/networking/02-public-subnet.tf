/* All external traffic to the cluster will go throught network traffic controls in the public subnet */

####################################################
# Create Public subnets
####################################################

# https://www.terraform.io/docs/providers/aws/d/subnet.html

resource "aws_subnet" "public" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.cidr_prefix}.${var.public_subnets[count.index]}"
  availability_zone = "${var.azones[count.index]}"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.igw"]
  tags { 
    Name = "public${count.index}-${var.vpc_env}-${var.letters[count.index]}" 
    vpc  = "${var.vpc_env}"
    CostCentre = "${var.CostGroup}"
  }
  count = "${var.number_of_zones}"
}

# Public subnet output

output "public_subnet_ids" {
  value = [ "${aws_subnet.public.*.id}" ]
}


#####################################################
# Define our routing table for public subnet
#####################################################

# https://www.terraform.io/docs/providers/aws/d/route_table.html

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags {
    Name = "rt-public-${var.vpc_env}"
    CostCentre = "${var.CostGroup}"
  }
}

####################################################
# Associate the routing table to the subnet 
####################################################

# https://www.terraform.io/docs/providers/aws/r/route_table_association.html

resource "aws_route_table_association" "route_public" {
  subnet_id = "${element(aws_subnet.public.*.id,count.index)}"
  route_table_id = "${aws_route_table.public.id}"
  count = "${var.number_of_zones}"
}