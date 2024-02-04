resource "aws_eip" "nat_eip" {
  domain     = "vpc"
  depends_on = [ aws_internet_gateway.igw ]
  
  tags = {
    Name = "NAT Gateway EIP"
  }
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.pub_sub1.id

  tags = {
    Name = "gw NAT"
  }
}

resource "aws_route_table" "pvt_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.example.id
  }
}

resource "aws_route_table_association" "pvt_sub_ass1" {
  subnet_id      = aws_subnet.pvt_sub1.id 
  route_table_id = aws_route_table.pvt_route.id
}