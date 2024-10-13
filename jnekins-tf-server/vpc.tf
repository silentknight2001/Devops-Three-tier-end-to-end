resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      name = var.vpc-name
    }
}
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      name = var.igw-name
    }
}
resource "aws_subnet" "subnet-public" {
    vpc_id = aws_vpc.vpc.id 
    cidr_block = "10.0.0.1/24"
    availability_zone = "ap-south-1"
    map_public_ip_on_launch = true
  tags = {
    name = var.subnet-name
  }
}
resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.vpc.id 
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
  tags = {
    name = var.rt-name
  }
}
resource "aws_route_table_association" "rta" {
    route_table_id = aws_route_table.rt.id
    subnet_id = aws_subnet.subnet-public.id 
  
}
resource "aws_security_group" "sg-group" {
   vpc_id = aws_vpc.vpc.id 
   description = "allowing jenkins sonar quebe , ssh"
   ingress = [
    for port in [22, 8080, 9090, 80, 9000  ] : {
        description = " TLS from vpc"
        from_port = port
        to_port = port 
        protocol = "tcp"
        ipv6_cidr_blocks = ["::/0"]
        self = false
        prefix_list_id = []
        security_group = []
        cidr_blocks = ["0.0.0.0/0"]
    }
   ]
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
   tags = {
     name = var.sg-name
   }
}
