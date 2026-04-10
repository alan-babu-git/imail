package spam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConfig {
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            
            // Environment variables for deployment
            String dbHost = System.getenv("DB_HOST");
            String dbPort = System.getenv("DB_PORT");
            String dbName = System.getenv("DB_NAME");
            String dbUser = System.getenv("DB_USER");
            String dbPass = System.getenv("DB_PASS");
            
            // Default values for local development
            if (dbHost == null) dbHost = "localhost";
            if (dbPort == null) dbPort = "3306";
            if (dbName == null) dbName = "defaultdb";
            if (dbUser == null) dbUser = "root";
            if (dbPass == null) dbPass = "root";
            
            String url = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName + "?useSSL=true&requireSSL=true&verifyServerCertificate=false";
            return DriverManager.getConnection(url, dbUser, dbPass);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Database connection failed", e);
        }
    }
}
