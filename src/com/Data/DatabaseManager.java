package com.Data;

import org.apache.log4j.Logger;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

/**
 * Created by Chathumini on 28/03/2016.
 */
public class DatabaseManager {

    Logger logger = Logger.getLogger(DatabaseManager.class);
    static DatabaseManager databaseManager= new DatabaseManager();
    Properties prop = new Properties();

    InputStream inputStream;

    public static Connection con() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classNotFound) {
            databaseManager.logger.error("Class Error",classNotFound);

        }
        try {

            String propFileName = "property.properties";

            databaseManager.inputStream = databaseManager.getClass().getClassLoader().getResourceAsStream(propFileName);

            if (databaseManager.inputStream != null) {
                databaseManager.prop.load(databaseManager.inputStream);
            } else {
                throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
            }
        }catch (FileNotFoundException fileNotFound){

            databaseManager.logger.error(fileNotFound);
        } catch (IOException ioEception) {
            databaseManager.logger.error("IO Error",ioEception);
        }
        Connection c = null;
        try {

            c = DriverManager.getConnection("jdbc:mysql://"+databaseManager.prop.getProperty("URL")+":" +
                    ""+databaseManager.prop.getProperty("PORT")+"" +
                    "/"+databaseManager.prop.getProperty("DATABASE")+"",
                    ""+databaseManager.prop.getProperty("USERNAME")+"",
                    ""+databaseManager.prop.getProperty("PASSWORD")+"");

        } catch (SQLException sqlError) {

            databaseManager.logger.error("SQL Error",sqlError);
        }
        return c;
    }

    public static void con_close(Connection c) {
        if (c != null) {
            try {
                c.close();
            } catch (SQLException sQLException) {
                databaseManager.logger.error("SQL Error",sQLException);
            }
        }
    }

    public static void stmt_close(Statement s) {
        if (s != null) {
            try {
                s.close();
            } catch (SQLException sQLException) {
                databaseManager.logger.error("SQL Error",sQLException);
            }
        }
    }

    public static void rs_close(ResultSet r) {
        if (r != null) {
            try {
                r.close();
            } catch (SQLException sQLException) {
                databaseManager.logger.error("SQL Error",sQLException);
            }
        }
    }
}
