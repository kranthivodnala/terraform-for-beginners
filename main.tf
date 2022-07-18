provider "aws" {
  profile = "personal"
  region = "us-east-1"
}

# create ec2 instance

resource "aws_instance" "myfirsterraform" {
    ami = "ami-0cff7528ff583bf9a"
    instance_type = "t2.micro"

    tags = {
        Name = "TestServer"
    }
  
}

# create code commit repository

resource "aws_codecommit_repository" "wordpressapp" {
  repository_name = "thechroniclecloud"
  description = "Sample wordpress application"
  default_branch = "dev"
  
}