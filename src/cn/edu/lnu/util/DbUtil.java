package cn.edu.lnu.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.PreparedStatement;


public class DbUtil {
	public static Connection getConnection() throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr_system?characterEncoding=UTF-8", "root", "125113");
		return connection;
	}
	
	public static void closeAll(Connection connection,PreparedStatement preparedStatement ,ResultSet resultSet) throws Exception {
		connection.close();
		preparedStatement.close();
		resultSet.close();
	}
}
