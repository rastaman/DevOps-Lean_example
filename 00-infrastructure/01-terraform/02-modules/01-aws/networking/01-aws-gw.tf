#####################################################
# Define our Internet Gateway for VPC
#####################################################

# https://www.terraform.io/docs/providers/aws/r/internet_gateway.html

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "igw-${var.vpc_env}"
    CostCentre = "${var.CostGroup}"
  }
}

