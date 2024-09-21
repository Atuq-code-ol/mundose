# Configuración del proveedor de AWS
provider "aws" {
  region = "us-east-1" # Reemplaza con tu región
}

# Creación de un grupo de seguridad
resource "aws_security_group" "allow_http_ssh" {
  name        = "allow_http_ssh"
  description = "Allow HTTP and SSH traffic"

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_ SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Creación de una instancia EC2
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Reemplaza con una AMI de tu elección
  instance_type = "t2.micro"

  tags = {
    Name = "my-ec2-instance"
  }

  security_groups = [aws_security_group.allow_http_ssh.id]
}
