FROM httpd
COPY httpd.conf /usr/local/apache2/conf/httpd.conf

RUN rm -f /usr/local/apache2/htdocs/index.html
ADD html/ /usr/local/apache2/htdocs/
