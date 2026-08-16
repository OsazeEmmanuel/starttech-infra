variable "bucket_name" {
  type = string
}

variable "bucket_domain" {
  type = string
}

variable "alb_dns_name" {
  type    = string
  default = ""
}

variable "tags" {
  type = map(string)
}
