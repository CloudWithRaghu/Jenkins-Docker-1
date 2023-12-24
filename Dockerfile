FROM: ubuntu:22.04
RUN apt update
RUN apt install apache2
RUN apt install wget -y
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page291/drool.zip
RUN apt install unzip -y
RUN cp -Rf drool-html/. /var/www/html
RUN chown -R $USER:$USER /var/www/mywebsite
RUN chmod -R 755 /var/www/mywebsite
