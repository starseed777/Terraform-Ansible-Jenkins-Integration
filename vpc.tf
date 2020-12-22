resource "aws_vpc" "main_vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = var.tenancy

    tags = {
        Name = "Main-VPC-${terraform.workspace}"
    }
}

resource "aws_subnet" "public_subnet" {
    cidr_block = "10.0.2.0/16"
    vpc_id = aws_vpc.main_vpc.id

    tags = {
        Name = "PubSubnet1"
    }
}