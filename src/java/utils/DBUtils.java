
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBUtils {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost\\LAPTOP-3RHVEV37\\FISHBONE:1433;databaseName=FacilitiesFeedback";
        conn = DriverManager.getConnection(url, "sa", "vanhleg123");
        return conn;
    }
}
