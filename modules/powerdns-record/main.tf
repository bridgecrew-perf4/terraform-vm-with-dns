resource "powerdns_record" "powerdns_record" {
  name = "${var.name}.${var.zone}."
  records = var.records
  ttl = var.ttl
  type = var.type
  zone = "${var.zone}."
}
