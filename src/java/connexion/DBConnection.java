package connexion;

import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Define the connection object
    private static java.sql.Connection con;

    // JDBC URL, username, and password of the Oracle database
    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String JDBC_USER = "system";
    private static final String JDBC_PASSWORD = "root";

    // Method to get a database connection
    public static java.sql.Connection getConnection() {
        try {
            // Load the JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish the connection
            con = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            return con;
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions (print or log, and potentially throw)
            e.printStackTrace();
            return null;
        }
    }

    // Method to close the database connection
    public static void closeConnection() {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException e) {
            // Handle exceptions (print or log)
            e.printStackTrace();
        }
    }
}

