#create vpc
resource "aws_vpc" "my_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

#public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  count = length(var.availability_zone)
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.public_cidr[count.index]

  tags = {
    Name = "${var.name_prefix}_public"
  }
}

#private subnet 
resource "aws_subnet" "web_tier" {
  vpc_id     = aws_vpc.my_vpc.id
  count = length(var.availability_zone)
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.web_tier[count.index]

  tags = {
    Name = "${var.name_prefix}_private"
  }
}

resource "aws_subnet" "app_tier" {
  vpc_id     = aws_vpc.my_vpc.id
  count = length(var.availability_zone)
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.app_tier[count.index]

  tags = {
    Name = "${var.name_prefix}_private"
  }
}

resource "aws_subnet" "data_tier" {
  vpc_id     = aws_vpc.my_vpc.id
  count = length(var.availability_zone)
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.data_tier[count.index]

  tags = {
    Name = "${var.name_prefix}_private"
  }
}

#Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "igw"
  }
}

#elastic IP for Nat Gateway
resource "aws_eip" "lb" {
  count = var.enable_gateway ? 2 :0
  domain   = "vpc"
  depends_on = [aws_internet_gateway.gw]

  tags = {
    Name = "eip_${count.index +1}"

  }
}

#NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  count = length(var.availability_zone)
  allocation_id = aws_eip.lb[count.index].id
  subnet_id     = aws_subnet.public_subnet[count.index].id

  tags = {
    Name = "Nat_gateway_${count.index+1}"
  }

  depends_on = [aws_internet_gateway.gw]
}

#Route table for public subnet
resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Route_table_public"
  }
}

#Route table association for public
resource "aws_route_table_association" "public_internet" {
  count = length(var.availability_zone)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.route_table_public.id
}

#Route table for web_tier
resource "aws_route_table" "route_table_web" {
  vpc_id = aws_vpc.my_vpc.id
  count = length(var.availability_zone)

  route {
    cidr_block = var.route_cidr
    nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
  }

  tags = {
    Name = "Route_table_web_tier"
  }
}

#Route table association for web_tier
resource "aws_route_table_association" "web_internet" {
  count = length(var.availability_zone)
  subnet_id      = aws_subnet.web_tier[count.index].id
  route_table_id = aws_route_table.route_table_web[count.index].id
}


#Route table for app_tier
resource "aws_route_table" "route_table_app" {
  vpc_id = aws_vpc.my_vpc.id
  count = length(var.availability_zone)

  route {
    cidr_block = var.route_cidr
    nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
  }

  tags = {
    Name = "Route_table_app_tier"
  }
}

#Route table association for app_tier
resource "aws_route_table_association" "app_internet" {
  count = length(var.availability_zone)
  subnet_id      = aws_subnet.app_tier[count.index].id
  route_table_id = aws_route_table.route_table_app[count.index].id
}


#Route table for data_tier(no internet access)
resource "aws_route_table" "route_table_data" {
  vpc_id = aws_vpc.my_vpc.id


  tags = {
    Name = "Route_table_data_tier"
  }
}

#Route table association for data_tier
resource "aws_route_table_association" "data_internet" {
  count = length(var.availability_zone)
  subnet_id      = aws_subnet.data_tier[count.index].id
  route_table_id = aws_route_table.route_table_data.id
}






