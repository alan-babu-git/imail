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

# Download missing J2EE libraries into the JAR folder
RUN mkdir -p /app/project/EMAIL/JAR && \
    wget -O /app/project/EMAIL/JAR/servlet-api.jar https://repo1.maven.org/maven2/javax/servlet/javax.servlet-api/3.1.0/javax.servlet-api-3.1.0.jar && \
    wget -O /app/project/EMAIL/JAR/jsp-api.jar https://repo1.maven.org/maven2/javax/servlet/jsp/javax.servlet.jsp-api/2.3.1/javax.servlet.jsp-api-2.3.1.jar

# Move to the project directory where build.xml is located
WORKDIR /app/project/EMAIL/EMAIL

# Build the WAR file
RUN ant -Dlibs.CopyLibs.classpath=/usr/share/ant/lib/ant-contrib.jar -Dbuild.compiler=modern war

# Final stage
FROM tomcat:8.5-jdk8-openjdk-slim

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR from the build stage
# Note: Ant build usually puts the war in a 'dist' folder
COPY --from=build /app/project/EMAIL/EMAIL/dist/EMAIL.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
