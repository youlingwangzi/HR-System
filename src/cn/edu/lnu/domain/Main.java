package cn.edu.lnu.domain;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

import java.sql.PreparedStatement;

public class Main {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO 自动生成的方法存根
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr_system?characterEncoding=UTF-8", "root", "125113");
		String sqlString = "insert into department values(?,?,?)";
		
		PreparedStatement psPreparedStatement = connection.prepareStatement(sqlString);
		
		psPreparedStatement.setString(1, "2");
		psPreparedStatement.setString(2, "市场部");
		psPreparedStatement.setString(3, "蕙星楼");
		
		psPreparedStatement.executeUpdate();
		
		psPreparedStatement.close();
		connection.close();
		
		System.out.println("yijingbaocun");
		
		
	}

}
