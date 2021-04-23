#imagen de CentOs 7
FROM centos:7
#actualizar los repositorios
RUN yum -y update
#instalar httpd apache
RUN yum -y install httpd httpd-tools
#instalar repositorios epel para instalar software de terceros en sistemas basados en RedHat como RHEL y CentOS
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm

RUN yum --enablerepo=remi-php73 -y install php php-bcmath php-cli php-common php-gd php-intl php-ldap php-mbstring \ 
    php-mysqlnd php-pear php-soap php-xml php-xmlrpc php-zip


#exponer puerto 80
EXPOSE 80
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]