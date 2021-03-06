from tomcat:8.0.20-jre8 

RUN mkdir /usr/local/tomcat/webapps/mywebapp 

RUN mkdir /var/lib/tomcat8/conf

RUN cd /var/lib/tomcat8/conf

RUN touch tomcat-users.xml

RUN chmod 777 tomcat-users.xml

RUN sed -i 's+</tomcat-users>+  <role rolename="admin-script"/>+gI' /var/lib/tomcat8/conf/tomcat-users.xml
RUN echo '  <role rolename="manager"/>'  >> /var/lib/tomcat8/conf/tomcat-users.xml
RUN echo '  <role rolename="manager-gui"/>'  >> /var/lib/tomcat8/conf/tomcat-users.xml
RUN echo '  <role rolename="manager-script"/>'  >> /var/lib/tomcat8/conf/tomcat-users.xml
RUN echo '  <role rolename="manager-jmx"/>'  >> /var/lib/tomcat8/conf/tomcat-users.xml
RUN echo '  <role rolename="manager-status"/>'  >> /var/lib/tomcat8/conf/tomcat-users.xml
RUN echo '  <user username="tomcat" password="tomcat" roles="admin, manager,admin-script,manager-script,manager-jmx,manager-status,manager-gui,admingui"/>'  >> /var/lib/tomcat8/conf/tomcat-users.xml
RUN echo "</tomcat-users>"  >> /var/lib/tomcat8/conf/tomcat-users.xml

COPY /target/AVNCommunication-1.0.war /usr/local/tomcat/webapps/Dockerdemo.war 


