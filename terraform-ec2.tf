terraform {
       required_providers{
        aws = { 
       source = "hashicorp/aws"
       version = "~> 4.54.0"
}
}
required_version = ">= 1.2.0"
}

provider "aws"{
 region = "ap-southeast-2"
}

resource "aws_instance" "my_ec2_instance"{
     count = 4
     ami = "ami-08f0bc76ca5236b20"
 instance_type = "t2.micro"
tags = {
     Name = "terraformaws"
}
}

output "ec2_public_ips" {
   value = aws_instance.my_ec2_instance[*].public_ip
}
