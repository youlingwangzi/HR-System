package cn.edu.lnu.persist;

import java.util.List;

import cn.edu.lnu.domain.Department;
import cn.edu.lnu.domain.Job;

public interface JobDao {
	public List<Job> findJobs();
	public boolean addJob(Job job);
	public boolean updateJob(Job job);
	public Job findJobById(String jobId);
}
