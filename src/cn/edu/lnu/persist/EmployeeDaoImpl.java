package cn.edu.lnu.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.edu.lnu.domain.Page;
import cn.edu.lnu.util.DbUtil;

public class EmployeeDaoImpl implements EmployeeDao {

	@Override
	public Page findEmployeeByPage(int currentPage) {
		// TODO 自动生成的方法存根
		Connection connection = null;
		Page page = new Page();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DbUtil.getConnection();
			
			String sqlString = "select count(*) from employee";
			preparedStatement = connection.prepareStatement(sqlString);
			preparedStatement.executeQuery();
			int totalNumber = 0;
			while(resultSet.next()){
				totalNumber = resultSet.getInt(1);
			}
			
			page.setTotalNember(totalNumber);
			
			int totalPage = 0;
			page.setTotalPage(totalPage);
			
			
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		return null;
	}

}
