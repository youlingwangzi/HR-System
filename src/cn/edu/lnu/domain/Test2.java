package cn.edu.lnu.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class Test2 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO 自动生成的方法存根
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr_system?characterEncoding=UTF-8", "root", "125113");
		String sqlString = "select * from department";
		
		PreparedStatement psPreparedStatement = connection.prepareStatement(sqlString);
		ResultSet rSet = psPreparedStatement.executeQuery();
		
		List<Department> list = new ArrayList<Department>();
		
		while(rSet.next()){
			Department department = new Department();
			department.setDepartName(rSet.getString("DEPART_NAME"));
			
			list.add(department);
		}
	
		for(int i = 0; i<list.size(); i++){		
			Department department = list.get(i);
			System.out.print(department.getDepartName());
		}
	}

}
