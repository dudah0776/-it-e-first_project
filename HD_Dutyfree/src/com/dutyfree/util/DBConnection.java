package com.dutyfree.util;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {

	   private static String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
	   private static String uid ="dutyfree";
	   private static String pwd= "dutyfree";
	   
	   private DBConnection() {
	   }

	   public static Connection getConnection() {
		   Connection conn = null;
		   try {
			   Class.forName("oracle.jdbc.driver.OracleDriver");
			   conn = DriverManager.getConnection(url,uid,pwd);
		   } catch (Exception e) {
			   e.printStackTrace();
		   }
	      return conn;
	   }
	}
