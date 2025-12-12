provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-0ecb62995f68bb549"
  instance_type          = "c7i-flex.large"
  key_name               = "Swiggy"
  vpc_security_group_ids = ["sg-0835cee6b8de1f54f"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins1", "tomcat-1", "tomcat-2", "Monitoring server"]
}