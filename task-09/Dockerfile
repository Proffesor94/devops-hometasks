FROM debian:latest
RUN apt-get update && apt-get install -y apache2 php php-mysql wget  
RUN rm /var/www/html/index.html && wget -O /var/www/html/index.php https://raw.githubusercontent.com/Proffesor94/devops-hometasks/master/task-01/index/index.php
EXPOSE 80
CMD apachectl -D FOREGROUND