variable "region" {
    default = "us-east-1"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "tenancy" {
    default = "default"
}

variable "subnet_cidr" {
    default = "10.0.2.0/24"
}