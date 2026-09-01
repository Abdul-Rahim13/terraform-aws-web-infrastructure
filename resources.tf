resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "terraform-igw"
  }
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    availability_zone = var.zone1
    map_public_ip_on_launch = true

    tags = {
    Name = "terraform-subnet1"
  }
}

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    availability_zone = var.zone2
    map_public_ip_on_launch = true

    tags = {
    Name = "terraform-subnet2"
  }
}

resource "aws_route_table" "routeTable" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform-route-table"
  }
}

resource "aws_route" "router" {
  route_table_id = aws_route_table.routeTable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "tableAssociation1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.routeTable.id
}

resource "aws_route_table_association" "tableAssociation2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.routeTable.id
}

resource "aws_security_group" "SG" {
  vpc_id = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "allowHTTP" {
  security_group_id = aws_security_group.SG.id

  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allowSSHMyIP" {
  security_group_id = aws_security_group.SG.id

  cidr_ipv4 = "182.180.20.233/32"
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allowAllOutbound" {
  security_group_id = aws_security_group.SG.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port = 0
  to_port = 0
  ip_protocol = "-1"
}