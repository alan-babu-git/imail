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
            conn = DbConfig.getConnection();
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

        while ((line = reader.readLine()) != null) {
            line = line.trim();
            if (line.isEmpty() || line.startsWith("--") || line.startsWith("/*")) {
                continue;
            }
            sb.append(line);
            if (line.endsWith(";")) {
                String sql = sb.toString().replace(";", "").trim();
                if (!sql.isEmpty()) {
                    try {
                        System.out.println("iMail: Executing SQL: " + (sql.length() > 50 ? sql.substring(0, 50) + "..." : sql));
                        stmt.execute(sql);
                    } catch (SQLException e) {
                        // Ignore errors like "Table already exists" if not using IF NOT EXISTS
                        if (!e.getMessage().contains("already exists")) {
                            System.err.println("SQL Execution Warning: " + e.getMessage());
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
