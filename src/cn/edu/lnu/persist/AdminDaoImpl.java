package cn.edu.lnu.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.edu.lnu.domain.Admin;
import cn.edu.lnu.util.DbUtil;

public class AdminDaoImpl implements AdminDao {

	@Override
	public Admin findAdminByName(String adminName) {
		// TODO 自动生成的方法存根
		Admin admin = new Admin();		
			// TODO 自动生成的方法存根
		Connection connection = DbUtil.getConnection();
			
		String sqlString = "select * from Admin where ADMIN_NAME = ?";
			
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			try{
				preparedStatement = connection.prepareStatement(sqlString);
				preparedStatement.setString(1, adminName);
				resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					admin.setAdminId(resultSet.getInt("ADMIN_ID"));
					admin.setAdminNameString(resultSet.getString("ADMIN_NAME"));
					admin.setPassword(resultSet.getString("PASSWORD"));
					admin.setAdminAuthority(resultSet.getInt("ADMIN_AUTHORITY"));
				}
					
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			} finally{
				DbUtil.closeAll(connection, preparedStatement, resultSet);
			}
				
			return admin;
		
	}

}
