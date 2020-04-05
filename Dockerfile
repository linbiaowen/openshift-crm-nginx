FROM registry.access.redhat.com/ubi8:8.0

MAINTAINER Samuel Lin <samuel.lin@hthk.com>

LABEL version="1.0" \
description="crm-frontend Nginx" \ 
creationDate="2020-04-05" \ 
updatedDate="2020-04-05"


RUN yum install -y --disableplugin=subscription-manager --nodocs nginx nginx-mod-http-perl \ 
&& yum clean all

# deploy specific nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

COPY ./s2i/bin/ /usr/libexec/s2i

RUN touch /run/nginx.pid \
&& chgrp -R 0 /var/log/nginx /run/nginx.pid \ 
&& chmod -R g+rwx /var/log/nginx /run/nginx.pid

# users are not allowed to listen on privileged ports
RUN sed -i.bak 's/listen\(.*\)80;/listen 8080;/' /etc/nginx/nginx.conf

RUN sed -i.bak "s/crm-backend-app/crm-backend/" /etc/nginx/nginx.conf


EXPOSE 8080

USER 1001

CMD ["/usr/libexec/s2i/usage"]