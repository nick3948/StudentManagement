package com.studentdata.dbconnection;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBManager {
	public static Connection getconfig() {
		try {
			// Open and get configuration file
			FileReader dbConfigPropertiesFile = new FileReader(
					"C:\\Users\\nagatt\\eclipse-workspace\\StudentManagementSystem\\src\\main\\java\\com\\studentdata\\resource\\config.properties");
			Properties dbConfigProperties = new Properties();
			dbConfigProperties.load(dbConfigPropertiesFile);

			String dbServer, dbName, dbUsername, dbPassword, dbDriver;
			int dbPort;

			dbServer = dbConfigProperties.getProperty("database_host");
			dbPort = Integer.parseInt(dbConfigProperties.getProperty("database_port"));
			dbName = dbConfigProperties.getProperty("database_name");
			dbUsername = dbConfigProperties.getProperty("database_username");
			dbPassword = dbConfigProperties.getProperty("database_password");
			dbDriver = dbConfigProperties.getProperty("driver");

			// the final url will be
			final String url = "jdbc:mysql://" + dbServer + ':' + dbPort + "/" + dbName;
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);

			// return the connection.
			return con;

		} catch (IOException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
