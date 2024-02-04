provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}


#Creating public subnets
resource "aws_subnet" "pub_sub1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/28"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "Pub_sub1"
  }
}

resource "aws_subnet" "pub_sub2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/28"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "Pub_sub2"
  }
}

#Creating private subnets
resource "aws_subnet" "pvt_sub1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/28"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "Pvt_sub1"
  }
}


#Creating IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
    tags = {
    Name = "igw"
  }
}

#Creating the route table
resource "aws_route_table" "pub_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

#Creating the public subnet association
resource "aws_route_table_association" "pub_sub_ass1" {
  subnet_id      = aws_subnet.pub_sub1.id
  route_table_id = aws_route_table.pub_route.id
}

resource "aws_route_table_association" "pub_sub_ass2" {
  subnet_id      = aws_subnet.pub_sub2.id
  route_table_id = aws_route_table.pub_route.id
}


#Security group
resource "aws_security_group" "webSg" {
  name   = "web"
  vpc_id = aws_vpc.main.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-sg"
  }
}

output "pub_sub1" {
  value = aws_subnet.pub_sub1.id
}

output "pub_sub2" {
  value = aws_subnet.pub_sub2.id
}

output "pvt_sub1" {
  value = aws_subnet.pvt_sub1.id
}

output "webSg" {
  value = aws_security_group.webSg.id
  
}
output "vpc_id" {
  value = aws_vpc.main.id
}
