# Create VPC
resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

# Create Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.azs[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
}

# Create Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.azs[1]
  tags = {
    Name = "Private Subnet"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "Internet Gateway"
  }
}

# Create Route Table for Public Subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public Route Table"
  }
}

# Associate Public Subnet with Route Table
resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Allocate a new Elastic IP
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "NAT Elastic IP"
  }
}

# Create NAT Gateway using the newly allocated Elastic IP
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "NAT Gateway"
  }
}

# Create Route Table for Private Subnet
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "Private Route Table"
  }
}

# Associate Private Subnet with Route Table
resource "aws_route_table_association" "private_route_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

# Create Security Group
resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.main_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open port 22 for SSH
  }

  tags = {
    Name = "EC2 Security Group"
  }
}

# Create EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-04f76ebf53292ef4d"  # Example AMI, replace with the desired AMI ID
  instance_type = "t2.micro"
  key_name      = "second-test-ec2"  # Reference the key pair without the `.pem` extension
  subnet_id     = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]


  tags = {
    Name = "MyEC2Instance"
  }

  # Optionally add a provisioner to run commands on instance creation
  # provisioner "remote-exec" {
  #   inline = [
  #     "echo 'EC2 instance created!'"
  #   ]

  #   connection {
  #     type        = "ssh"
  #     user        = "ec2-user"  # Change according to your AMI
  #     private_key = file("${path.module}/second-test-ec2.pem")
  #     host        = self.public_ip
  #   }
  # }
}

# Output the public IP of the EC2 instance
