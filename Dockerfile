FROM tomcat:8.0
RUN apt update -y
COPY tomcat-users.xml /usr/local/tomcat/conf/
ADD **/*.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh","run"]
