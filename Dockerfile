# Build stage
FROM openjdk:8-jdk AS build

# Install Ant
RUN apt-get update && \
    apt-get install -y ant && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the entire workspace
COPY . .

# Move to the project directory where build.xml is located
WORKDIR "/app/ABT_TBM_842 CODE/EMAIL/EMAIL"

# Build the WAR file
RUN ant -Dlibs.CopyLibs.classpath=/usr/share/ant/lib/ant-contrib.jar -Dbuild.compiler=modern war

# Final stage
FROM tomcat:8.5-jdk8-openjdk-slim

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR from the build stage
# Note: Ant build usually puts the war in a 'dist' folder
COPY --from=build "/app/ABT_TBM_842 CODE/EMAIL/EMAIL/dist/EMAIL.war" /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
