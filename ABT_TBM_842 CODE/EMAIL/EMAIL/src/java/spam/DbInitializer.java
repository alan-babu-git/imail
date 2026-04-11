package spam;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;

public class DbInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("iMail: Starting Database Initialization...");
        Connection conn = null;
        try {
            System.out.println("iMail: Connecting to database using DbConfig...");
            conn = DbConfig.getConnection();
            System.out.println("iMail: Connection established. Executing /spam/init.sql...");
            executeSqlScript(conn, "/spam/init.sql");
            System.out.println("iMail: Database Initialization Completed Successfully.");
        } catch (Exception e) {
            System.err.println("iMail ERROR: Database Initialization Failed!");
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    }

    private void executeSqlScript(Connection conn, String scriptPath) throws Exception {
        InputStream is = getClass().getResourceAsStream(scriptPath);
        if (is == null) {
            throw new Exception("SQL Script not found: " + scriptPath);
        }

        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        StringBuilder sb = new StringBuilder();
        String line;
        Statement stmt = conn.createStatement();
        boolean inBlockComment = false;

        while ((line = reader.readLine()) != null) {
            String trimmedLine = line.trim();
            
            // Handle block comments (e.g., /* ... */)
            if (trimmedLine.startsWith("/*")) {
                inBlockComment = true;
            }
            if (inBlockComment) {
                if (trimmedLine.endsWith("*/")) {
                    inBlockComment = false;
                }
                continue;
            }

            // Skip empty lines and single-line comments
            if (trimmedLine.isEmpty() || trimmedLine.startsWith("--") || trimmedLine.startsWith("#")) {
                continue;
            }

            sb.append(line).append("\n"); // Keep line breaks for readability in logs

            // Check if statement ends with semicolon
            if (trimmedLine.endsWith(";")) {
                String sql = sb.toString().trim();
                // Remove trailing semicolon for JDBC execute
                if (sql.endsWith(";")) {
                    sql = sql.substring(0, sql.length() - 1);
                }

                if (!sql.isEmpty()) {
                    try {
                        // Log only first 100 chars of large statements
                        System.out.println("iMail: Executing SQL (" + sql.length() + " chars): " + 
                                         (sql.length() > 100 ? sql.substring(0, 100) + "..." : sql));
                        stmt.execute(sql);
                    } catch (SQLException e) {
                        // Skip common "already exists" errors to allow script to continue
                        if (e.getMessage().toLowerCase().contains("already exists")) {
                            // Silently skip
                        } else {
                            System.err.println("SQL Warning on command [" + 
                                             (sql.length() > 50 ? sql.substring(0, 50) + "..." : sql) + 
                                             "]: " + e.getMessage());
                        }
                    }
                }
                sb.setLength(0);
            }
        }
        stmt.close();
        reader.close();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Nothing to do
    }
}
