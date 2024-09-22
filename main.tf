##Create and bootstrap webserver #lanzar
resource "aws_instance" "webserver" {
  ami                         = "ami-0e879a1b306fffb22"
  instance_type               = "t2.micro"
  #key_name                    = app-ssh-key 
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  user_data                   = "${file("c_apache.sh")}"

  tags = {
    Name = "webserver"
  }
}
