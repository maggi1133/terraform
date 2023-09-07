# variable "ami_id" {
#   default = "ami-03265a0778a880afb"
# }

variable "instance_names" {
  type = list
  default = ["MongoDB", "Cart", "Catalogue", "User" , "Redis", "MySQL", "RabbitMQ", "Shipping", "Payment", "Web"]
}

variable "zone_id" {
  default = "Z0308214GYCUYHGJHT8R"
}

variable "domain" {
  default = "joindevops.online"
}

variable "isPROD" {
  default = false
}