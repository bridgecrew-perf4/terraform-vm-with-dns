variable "name" {
  type = string
}

variable "records" {
  type = list(string)
}

variable "ttl" {
  type = number
  default = 300
}

variable "type" {
  type = string
  default = "A"
}

variable "zone" {
  type = string
}
