##imagen base 
FROM debian:latest

LABEL org.opencontainers.image.authors="carloscandela.alu@iespacomolla.es"

# Actualiza los repositorios e instala apache2
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y apache2 \
    && apt-get clean

# Habilitar módulos de Apache
RUN a2enmod rewrite 
RUN a2enmod headers

# Expón el puerto 80
EXPOSE 80

# Comando para iniciar Apache en primer plano
CMD ["apache2ctl", "-D", "FOREGROUND"]
