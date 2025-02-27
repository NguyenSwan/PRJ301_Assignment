package dal;            //NHO PACKAGE

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

	protected Connection connection;

	public DBContext() {
		try {
			// Edit URL , username, password to authenticate with your MS SQL Server
			String url = "jdbc:sqlserver://localhost:1433;databaseName=CakeProject;"
				+ "encrypt=false;trustServerCertificate=false;";     //doi ten database
			String username = "sa";
			String password = "181198";                     //dung cua mk
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException | SQLException ex) {
			System.out.println(ex);
		}
	}
}
