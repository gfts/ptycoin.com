FROM httpd
COPY httpd.conf /usr/local/apache2/conf/httpd.conf

ADD html/ /usr/local/apache2/htdocs/
