#!/bin/bash

# Actualizar la lista de paquetes
sudo apt update

# Instalar Apache
sudo apt install apache2 -y

# Reiniciar el servicio Apache
sudo systemctl restart apache2

# Crear el directorio de documentos
sudo mkdir /var/www/html/my_app

# Cambiar los permisos del directorio
sudo chown -R www-data:www-data /var/www/html/my_app

# Crear un archivo index.html de ejemplo
sudo echo "<h1>Hola, mundo!</h1>" | sudo tee /var/www/html/my_app/index.html

# Habilitar el módulo rewrite (opcional, para utilizar .htaccess)
sudo a2enmod rewrite

# Reiniciar Apache nuevamente para aplicar los cambios
sudo systemctl restart apache2

# Verificar la instalación
echo "Apache instalado y configurado correctamente. Acceda a http://tu_ip_publica/my_app para ver tu aplicación."
