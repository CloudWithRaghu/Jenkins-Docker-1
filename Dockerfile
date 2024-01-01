FROM ubuntu
ENV TZ=Asia/Kolkata
RUN apt-get update
RUN apt-get install -y tzdata
RUN apt-get install -y apache2
RUN apt-get install -y apache2-utils
RUN apt-get install unzip -y
RUN apt-get install wget -y
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page289/bluene.zip
RUN unzip bluene.zip
RUN apt update
RUN apt-get clean
RUN mkdir /var/www/www.raghu.wiki
RUN cp -Rf bluene-html/. /var/www/www.raghu.wiki
RUN chown -R $USER:$USER /var/www/www.raghu.wiki
RUN chmod -R 755 /var/www/www.raghu.wiki
RUN touch /etc/apache2/sites-available/www.raghu.wiki.conf
RUN echo "<VirtualHost *:80>" >> /etc/apache2/sites-available/www.raghu.wiki.conf
RUN echo "ServerAdmin raghavendra@raghu.wiki" >> /etc/apache2/sites-available/www.raghu.wiki.conf
RUN echo "ServerName raghu.wiki" >> /etc/apache2/sites-available/www.raghu.wiki.conf
RUN echo "ServerAlias www.raghu.wiki" >> /etc/apache2/sites-available/www.raghu.wiki.conf
RUN echo "DocumentRoot /var/www/www.raghu.wiki" >> /etc/apache2/sites-available/www.raghu.wiki.conf
RUN echo "ErrorLog ${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-available/www.raghu.wiki.conf
RUN echo "CustomLog ${APACHE_LOG_DIR}/access.log combined" >> /etc/apache2/sites-available/www.raghu.wiki.conf
RUN echo "</VirtualHost>" >> /etc/apache2/sites-available/www.raghu.wiki.conf
RUN a2ensite www.raghu.wiki.conf
RUN service apache2 reload
RUN a2dissite 000-default.conf
RUN service apache2 reload
RUN apt-get install -y certbot python3-certbot-apache
RUN certbot -n -d www.raghu.wiki --apache --agree-tos -m raghavendra@raghu.wiki
EXPOSE 80 443
CMD ["apache2ctl", "-D", "FOREGROUND"]
