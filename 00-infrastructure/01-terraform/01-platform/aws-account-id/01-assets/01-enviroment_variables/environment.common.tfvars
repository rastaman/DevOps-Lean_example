# GLOBAL VARIABLES FOR THE ACCOUNT
aws_region           = "eu-west-1"
aws_profile          = "aws-account-id"
aws_bucket           = "aws-kubernetes"

statefile_key_prefix = "aws/main"

route53_main         = "example.io"
route53_main_zone_id = "XXXXXXXXXXXX"
ssl_certificate_arn  = "arn:aws:acm:eu-west-1:XXXXXXXXXXXX:certificate/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"

# Module versions to use
modversion           = "stage"

providers_key_prefix = "aws/main"

# ======================
#   Tagging and Naming
# ======================
env       = "common"
vpc_env   = "02-main"
project   = "example"
Owner     = "johnathan phan"

# ========================
#  Network and High Avail
# ========================
cidr_prefix          = "10.111"
number_of_zones      = "3"

# =================================
#  Environment master SSH key
# =================================
ssh_key_name   = "example-02-main"
ssh_access_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

number_of_permanent_ips= "3"
