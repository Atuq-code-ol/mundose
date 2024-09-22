#! /bin/bash
# Atualiza a lista de pacotes
sudo apt update

# Instala o Apache em modo desatendido
sudo apt install -y apache2

# Reinicia o serviço Apache
sudo systemctl restart apache2

# Verifica se o serviço está ativo
sudo systemctl status apache2
