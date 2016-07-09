package cn.edu.lnu.persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.lnu.domain.Job;
import cn.edu.lnu.util.DbUtil;

public class JobDaoImpl implements JobDao {

	@Override
	public List<Job> findJobs() {
		// TODO 自动生成的方法存根
		Connection connection = null;
		List<Job> list = new ArrayList<Job>();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DbUtil.getConnection();
			
			String sqlString = "select * from JOB";
			preparedStatement = connection.prepareStatement(sqlString);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				Job job = new Job();
				job.setJobId(resultSet.getString("JOB_ID"));
				job.setJobName(resultSet.getString("JOB_NAME"));
				job.setLowestPay(resultSet.getFloat("LOWEST_PAY"));
				job.setHighstPay(resultSet.getFloat("HIGHES_PAY"));
				
				list.add(job);
			}
			
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally{
			DbUtil.closeAll(connection, preparedStatement, resultSet);
		}
		return list;
	}
	
	public boolean addJob(Job job) {
		// TODO 自动生成的方法存根
		Connection connection = null;
		
		connection = DbUtil.getConnection();
		String sqlString = "insert into job(job_id,job_name,Lowest_pay,higest_pay) values(?,?,?,?)";
		
		PreparedStatement psPreparedStatement = null;
		try {
			psPreparedStatement = connection.prepareStatement(sqlString);
		
			psPreparedStatement.setString(1, job.getJobId());
			psPreparedStatement.setString(2, job.getJobName());
			psPreparedStatement.setFloat(3, job.getLowestPay());
			psPreparedStatement.setFloat(4, job.getHighstPay());
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
