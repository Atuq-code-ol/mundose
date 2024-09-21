# Filtrar AMIs por nombre y estado disponible

data "aws_ami" "webserver_ami" {

  filter {
    name = "name"
    values = ["webserver-base"]  # Reemplaza "webserver-base" con el nombre de tu AMI
  }

  filter {
    name = "state"
    values = ["available"]
  }

  most_recent = true
}

# Crear instancia EC2 con la AMI obtenida dinámicamente

resource "aws_instance" "webserver" {
  ami           = data.aws_ami.webserver_ami.id
  instance_type = "t2.micro"
  # key_name      = "app-ssh-key"  # Puedes descomentar si usas una llave SSH
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id             = aws_subnet.subnet.id
  user_data             = "${file("c_apache.sh")}"

  tags = {
    Name = "webserver"
  }
}
