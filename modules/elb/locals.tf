locals {
  all_instances = concat(var.private-instance, var.public-instance)
}
