provider "aws" {
  profile = "personal"
  region = "us-east-1"
}

# create ec2 instance

resource "aws_instance" "my-first-ec2" {
    ami = "ami-0cff7528ff583bf9a"
    count = 1
    key_name = "abcd"
    instance_type = "t2.micro"
    security_groups = ["security_ec2_port"]
    tags = {
        Name = "my-first-ec2"
    }
}

# security group with ports 80 and 443
resource "aws_security_group" "security_ec2_port" {
    name = "security_ec2_port"
    description = "This SG is to listen ports on 80 and 443"

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
tags = {
    Name = "security_ec2_port"
}
}
