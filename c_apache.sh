#! /bin/bash
sudo update -y
sudo install -y httpd.x86_64
sudo systemctl enable httpd --now
