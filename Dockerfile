FROM tomcat:8.0
COPY tomcat-users.xml /usr/local/tomcat/conf/
ADD **/*.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh","run"]
