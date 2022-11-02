resource "aws_subnet" "public" {
  vpc_id = var.vpc_id
  count = 2
  availability_zone = var.availability_zones[count.index]
  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index)
}

resource "aws_subnet" "private" {
  vpc_id = var.vpc_id
  count = 2
  availability_zone = var.availability_zones[count.index]
  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index + length(aws_subnet.public))
}


