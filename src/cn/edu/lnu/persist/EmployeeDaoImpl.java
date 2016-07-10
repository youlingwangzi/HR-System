package cn.edu.lnu.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.lnu.domain.Page;
import cn.edu.lnu.domain.Staff;
import cn.edu.lnu.util.Constants;
import cn.edu.lnu.util.DbUtil;

public class EmployeeDaoImpl implements EmployeeDao {

	@SuppressWarnings("resource")
	@Override
	public Page findEmployeeByPage(int currentPage) {
		// TODO 自动生成的方法存根
		Connection connection = null;
		Page page = new Page();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DbUtil.getConnection();
			
			String sqlString = "select count(*) from staff";
			preparedStatement = connection.prepareStatement(sqlString);
			resultSet = preparedStatement.executeQuery();
			int totalNumber = 0;
			while(resultSet.next()){
				totalNumber = resultSet.getInt(1);
			}
			
			page.setTotalNumber(totalNumber);
			
			int totalPage = totalNumber%Constants.ITEM_PER_PAGE==0?totalNumber/Constants.ITEM_PER_PAGE:(int)(totalNumber/Constants.ITEM_PER_PAGE)+1;
			page.setTotalPage(totalPage);
			
			page.setCurrentPage(currentPage);
			
			String sql2 = "select * from staff e,department d,job j where e.depart_id=d.depart_id and e.job_id=j.job_id limit ?,?";
			preparedStatement = connection.prepareStatement(sql2);
			preparedStatement.setInt(1, (currentPage-1)*Constants.ITEM_PER_PAGE);
			preparedStatement.setInt(2, Constants.ITEM_PER_PAGE);
			resultSet = preparedStatement.executeQuery();
			
			List<Staff> list = new ArrayList<Staff>();
			
			while(resultSet.next()){
				Staff staff = new Staff();
				staff.setStaffId(resultSet.getString("STAFF_ID"));
				staff.setStaffName(resultSet.getString("STAFF_NAME"));
				staff.setStaffEmail(resultSet.getString("STAFF_EMAIL"));
				staff.setStaffPhone(resultSet.getString("STAFF_PHONE"));
				staff.setEntryTime(resultSet.getDate("ENTRY_TIME"));
				staff.setDeptNo(resultSet.getString("DEPART_ID"));
				staff.setJobId(resultSet.getString("JOB_ID"));
				staff.setStaffPay(resultSet.getFloat("STAFF_PAY"));
				
				staff.setDeptName(resultSet.getString("DEPART_NAME"));
				staff.setJobName(resultSet.getString("JOB_NAME"));
				
				list.add(staff);
			}
			
			page.setList(list);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally{
			DbUtil.closeAll(connection, preparedStatement, resultSet);
		}
		return page;
	}

	@Override
	public boolean addEmployee(Staff staff) {
		// TODO 自动生成的方法存根
		Connection connection = null;
		
		connection = DbUtil.getConnection();
		String sqlString = "insert into staff(job_id,depart_id,staff_name,staff_email,staff_phone,entry_time,staff_pay) values(?,?,?,?,?,?,?)";
		
		PreparedStatement psPreparedStatement = null;
		try {
			psPreparedStatement = connection.prepareStatement(sqlString);
		
			psPreparedStatement.setString(1, staff.getJobId());
			psPreparedStatement.setString(2, staff.getDeptNo());
			psPreparedStatement.setString(3, staff.getStaffName());
			psPreparedStatement.setString(4, staff.getStaffEmail());
			psPreparedStatement.setString(5, staff.getStaffPhone());
			psPreparedStatement.setDate(6, staff.getEntryTime());
			psPreparedStatement.setFloat(7, staff.getStaffPay());
			psPreparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return false;
		} finally{
			DbUtil.closeAll(connection, psPreparedStatement);
		}
		
		return true;
	}

}
