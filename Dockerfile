# Use the custom image rm-343710
FROM quay.io/leandrosantana1/do180-custom-httpd

LABEL author="leandrosantana1@gmail.com"

USER root

ENV DOCROOT=/var/www/html

RUN yum install -y --nodocs --disableplugin=subscription-manager httpd && yum clean all --disableplugin=subscription-manager -y && echo "Hello RM-343710" > ${DOCROOT}/index.html

COPY src/ ${DOCROOT}/

RUN rm -rf /run/httpd && mkdir /run/httpd

EXPOSE 80

CMD ["/bin/sh" "-c" "/usr/sbin/httpd -DFOREGROUND"]