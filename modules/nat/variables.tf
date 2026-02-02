variable "public_subnet_id" {
  description = "Public subnet ID for placement of NAT Gateway"
  type        = string
}

variable "private_route_table_id" {
  description = "Private Route Table ID to add NAT route"
  type        = string
}
