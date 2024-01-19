resource "aws_instance" "web" {
  ami           = "ami-0d3f444bc76de0a79"
  instance_type = "t2.micro"

  tags = {
    Name      = "exercise_0100"
    Terraform =  true
  }
}

resource "aws_security_group" "sec_ssh" {
  name        = "security group using Terraform"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0365ac2b87223e786"

  ingress{
    description = "TLC from VPC"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sec_ssh"
    Terraform =  true
  }
}