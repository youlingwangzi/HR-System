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

}
