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