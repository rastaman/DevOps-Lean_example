
# =========================================================
# Permanent Outgoing Elastic IP-s for the NAT instances
# Regulating traffic inside Kub and other assets
# =========================================================
resource "aws_eip" "perm_eip" {
  count = "${var.number_of_permanent_ips}"
  vpc      = true
}

output "perm_eip_ids" {
  value = [ "${aws_eip.perm_eip.*.id}" ]
}

output "perm_eip_public_ips" {
  value = [ "${aws_eip.perm_eip.*.public_ip}" ]
}
