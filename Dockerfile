# Use the official Apache Tomcat image
FROM tomcat:10.1-jdk17-temurin

# Remove the default Tomcat web apps to keep it clean
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into the Tomcat webapps directory as ROOT.war
# (This ensures your app runs at the main URL '/' instead of '/your-app-name')
COPY productWebApp.war

# Tomcat runs on port 8080 by default
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
