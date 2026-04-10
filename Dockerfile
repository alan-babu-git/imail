# Build stage
FROM eclipse-temurin:8-jdk AS build

# Install Ant and wget
RUN apt-get update && \
    apt-get install -y ant wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the entire workspace
COPY . .

# Rename directory to avoid issues with spaces and quotes
RUN mv "ABT_TBM_842 CODE" project

# Download missing NetBeans and J2EE libraries into the JAR folder
RUN mkdir -p /app/project/EMAIL/JAR && \
    wget -O /app/project/EMAIL/JAR/copylibs.jar https://repo1.maven.org/maven2/org/netbeans/external/org-netbeans-modules-java-j2seproject-copylibstask/RELEASE120/org-netbeans-modules-java-j2seproject-copylibstask-RELEASE120.jar && \
    wget -O /app/project/EMAIL/JAR/servlet-api.jar https://repo1.maven.org/maven2/javax/servlet/javax.servlet-api/3.1.0/javax.servlet-api-3.1.0.jar && \
    wget -O /app/project/EMAIL/JAR/jsp-api.jar https://repo1.maven.org/maven2/javax/servlet/jsp/javax.servlet.jsp-api/2.3.1/javax.servlet.jsp-api-2.3.1.jar && \
    wget -O /app/project/EMAIL/JAR/mysql-connector-java-5.1.49.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.49/mysql-connector-java-5.1.49.jar

# Move to the project directory
WORKDIR /app/project/EMAIL/EMAIL

# Ensure WEB-INF/lib exists and contains all our JARs for the WAR packaging
RUN mkdir -p web/WEB-INF/lib && \
    cp /app/project/EMAIL/JAR/*.jar web/WEB-INF/lib/

# Build the WAR file
RUN ant -Dlibs.CopyLibs.classpath=/app/project/EMAIL/JAR/copylibs.jar \
    -Dj2ee.server.home=/tmp \
    -Dj2ee.platform.classpath=/app/project/EMAIL/JAR/servlet-api.jar:/app/project/EMAIL/JAR/jsp-api.jar \
    -Djavac.classpath=/app/project/EMAIL/JAR/mysql-connector-java-5.1.49.jar:/app/project/EMAIL/JAR/servlet-api.jar:/app/project/EMAIL/JAR/jsp-api.jar \
    -Dbuild.compiler=modern dist

# Final stage
FROM tomcat:8.5-jdk8-openjdk-slim

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR from the build stage
# Note: Ant build usually puts the war in a 'dist' folder
COPY --from=build /app/project/EMAIL/EMAIL/dist/EMAIL.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
