package utils;

import java.io.InputStream;
import java.util.Properties;

public class ConfigUtils {

    public static String DB_URL;
    public static String DB_NAME;
    public static String DB_USER;
    public static String DB_PASS;

    public static String CL_NAME;
    public static String CL_API_KEY;
    public static String CL_API_SECRET;

    static {
        Properties prop = new Properties();
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        InputStream input = classLoader.getResourceAsStream("config/config.properties");
        try {
            prop.load(input);
        } catch (Exception e) {
        }
        DB_URL = prop.getProperty("dburl");
        DB_NAME = prop.getProperty("dbname");
        DB_USER = prop.getProperty("dbuser");
        DB_PASS = prop.getProperty("dbpass");
        CL_NAME = prop.getProperty("cloudinaryname");
        CL_API_KEY = prop.getProperty("cloudinaryapikey");
        CL_API_SECRET = prop.getProperty("cloudinaryapisecret");
    }
}
