from tomcat:8.0.20-jre8 

RUN mkdir /usr/local/tomcat/webapps/mywebapp 

RUN cd /usr/local/tomcat/conf


RUN sed -i 's+</tomcat-users>+  <role rolename="admin-script"/>+gI' /usr/local/tomcat/conf/tomcat-users.xml
RUN echo '  <role rolename="manager"/>'  >> /usr/local/tomcat/conf/tomcat-users.xml
RUN echo '  <role rolename="manager-gui"/>'  >> /usr/local/tomcat/conf/tomcat-users.xml
RUN echo '  <role rolename="manager-script"/>'  >> /usr/local/tomcat/conf/tomcat-users.xml
RUN echo '  <role rolename="manager-jmx"/>'  >> /usr/local/tomcat/conf/tomcat-users.xml
RUN echo '  <role rolename="manager-status"/>'  >> /usr/local/tomcat/conf/tomcat-users.xml
RUN echo '  <user username="tomcat" password="tomcat" roles="admin, manager,admin-script,manager-script,manager-jmx,manager-status,manager-gui,admingui"/>'  >> /usr/local/tomcat/conf/tomcat-users.xml
RUN echo "</tomcat-users>"  >> /usr/local/tomcat/conf/tomcat-users.xml

COPY /target/AVNCommunication-1.0.war /usr/local/tomcat/webapps/Dockerdemo.war 


