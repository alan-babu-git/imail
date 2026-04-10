# ============================================================
# Build stage - Compile and package WAR manually (No Ant/NetBeans)
# ============================================================
FROM eclipse-temurin:8-jdk AS build

# Install wget
RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the entire workspace
COPY . .

# Rename directory to avoid issues with spaces
RUN mv "ABT_TBM_842 CODE" project

# Download required JARs
RUN mkdir -p /app/jars && \
    wget -q -O /app/jars/servlet-api.jar https://repo1.maven.org/maven2/javax/servlet/javax.servlet-api/3.1.0/javax.servlet-api-3.1.0.jar && \
    wget -q -O /app/jars/jsp-api.jar https://repo1.maven.org/maven2/javax/servlet/jsp/javax.servlet.jsp-api/2.3.1/javax.servlet.jsp-api-2.3.1.jar && \
    wget -q -O /app/jars/mysql-connector.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.49/mysql-connector-java-5.1.49.jar && \
    wget -q -O /app/jars/commons-io.jar https://repo1.maven.org/maven2/commons-io/commons-io/2.4/commons-io-2.4.jar

# Set up WAR structure
RUN mkdir -p /app/war/WEB-INF/classes/spam && \
    mkdir -p /app/war/WEB-INF/lib

# Copy web content (JSPs, CSS, JS, etc.)
RUN cp -r /app/project/EMAIL/EMAIL/web/. /app/war/

# Copy JARs into WEB-INF/lib
RUN cp /app/jars/mysql-connector.jar /app/war/WEB-INF/lib/ && \
    cp /app/jars/servlet-api.jar /app/war/WEB-INF/lib/ && \
    cp /app/jars/jsp-api.jar /app/war/WEB-INF/lib/ && \
    cp /app/jars/commons-io.jar /app/war/WEB-INF/lib/

# Copy existing JAR files from project if any
RUN cp /app/project/EMAIL/JAR/*.jar /app/war/WEB-INF/lib/ 2>/dev/null || true

# Compile Java source files (spam package + dataset package)
RUN javac -cp "/app/jars/servlet-api.jar:/app/jars/jsp-api.jar:/app/jars/mysql-connector.jar:/app/jars/commons-io.jar" \
    -d /app/war/WEB-INF/classes \
    /app/project/EMAIL/EMAIL/src/java/dataset/*.java \
    /app/project/EMAIL/EMAIL/src/java/spam/*.java

# Package into WAR
RUN cd /app/war && jar -cvf /app/EMAIL.war .

# ============================================================
# Final stage - Tomcat
# ============================================================
FROM tomcat:8.5-jdk8-openjdk-slim

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy our WAR
COPY --from=build /app/EMAIL.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
