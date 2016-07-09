package cn.edu.lnu.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.lnu.domain.Department;
import cn.edu.lnu.util.DbUtil;

public class DepartmentDaoImpl implements DepartmentDao {

	@Override
	public List<Department> findDepartments() {
		// TODO 自动生成的方法存根
		Connection connection = null;
		List<Department> list = new ArrayList<Department>();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		connection = DbUtil.getConnection();
		
		String sqlString = "select * from department";
		try {
			preparedStatement = connection.prepareStatement(sqlString);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()){
				Department department = new Department();
				department.setDepartNo(resultSet.getString("DEPART_ID"));
				department.setDepartName(resultSet.getString("DEPART_NAME"));
				department.setDepartAdrress(resultSet.getString("DEPART_ADRRESS"));
				
				list.add(department);
			}
			
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally{
			DbUtil.closeAll(connection, preparedStatement, resultSet);
		}
		
		return list;
	}

	@Override
	public boolean addDepartment(Department department) {
		// TODO 自动生成的方法存根
		

		Connection connection = null;
		
		connection = DbUtil.getConnection();
		String sqlString = "insert into department "
				+ "(depart_id,depart_name,depart_adrress) values(?,?,?)";
		
		PreparedStatement psPreparedStatement = null;
		try {
			psPreparedStatement = connection.prepareStatement(sqlString);
		
			psPreparedStatement.setString(1, department.getDepartNo());
			psPreparedStatement.setString(2, department.getDepartName());
			psPreparedStatement.setString(3, department.getDepartAdrress());
			psPreparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return false;
		} finally{
			DbUtil.closeAll(connection, psPreparedStatement);
		}
		
		
		return false;
	}
	
	

}
