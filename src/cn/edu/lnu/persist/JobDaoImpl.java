package cn.edu.lnu.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.lnu.domain.Page;
import cn.edu.lnu.domain.Job;
import cn.edu.lnu.util.Constants;
import cn.edu.lnu.util.DbUtil;

public class JobDaoImpl implements JobDao {

	@Override
	public Page findEmployeeByPage(int currentPage) {
		// TODO 自动生成的方法存根
		Connection connection = null;
		Page page = new Page();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DbUtil.getConnection();
			
			String sqlString = "select count(*) from JOB";
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
			
			List<Job> list = new ArrayList<Job>();
			
			while(resultSet.next()){
				Job job = new Job();
				job.setJobId(resultSet.getString("JOB_ID"));
				job.setJobName(resultSet.getString("JOB_NAME"));
				job.setJobLowestPay(resultSet.getFloat("LOWEST_PAY"));
				job.setJobHigestPay(resultSet.getFloat("HIGHES_PAY"));
				
				job.setDeptName(resultSet.getString("DEPART_NAME"));
				job.setJobName(resultSet.getString("JOB_NAME"));
				
				list.add(job);
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

}
