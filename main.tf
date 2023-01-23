provider "aws" {
  profile = "personal"
  region = "us-east-1"
}

# create ec2 instance

resource "aws_instance" "my-first-ec2" {
    ami = "ami-0b5eea76982371e91"
    count = 1
    key_name = "weather"
    instance_type = "t2.micro"
    security_groups = ["security_ec2_port"]
    tags = {
        Name = "my-first-ec2"
    }
  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start
sudo yum search docker
sudo yum info docker
sudo yum install docker -y
sudo usermod -a -G docker ec2-user -y
EOF
}

# security group with ports 80 and 443
resource "aws_security_group" "security_ec2_port" {
    name = "security_ec2_port"
    description = "This SG is to listen ports on 80 and 443"

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
  
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
tags = {
    Name = "security_ec2_port"
}
}
