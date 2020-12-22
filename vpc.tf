resource "aws_vpc" "main_vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = var.tenancy

    tags = {
        Name = "Main-VPC-${terraform.workspace}"
    }
}

