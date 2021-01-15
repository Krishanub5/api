FROM amazonlinux:2018.03

RUN yum update -y
RUN yum install vim httpd24  git curl unzip wget mod24_ssl -y

# Install NodeJS
RUN yum install -y gcc-c++ make
RUN curl -sL https://rpm.nodesource.com/setup_12.x | /bin/bash -
RUN yum install -y nodejs

RUN mkdir /data
COPY myapp /data/myapp

WORKDIR /data/myapp

RUN npm install
RUN npm install -g pm2

RUN echo "IncludeOptional vhosts/*.conf" >> /etc/httpd/conf/httpd.conf

COPY vhosts /etc/httpd/vhosts

EXPOSE 80
EXPOSE 443

COPY startup.sh /startup.sh
RUN chmod 777 /startup.sh
CMD sh /startup.sh
