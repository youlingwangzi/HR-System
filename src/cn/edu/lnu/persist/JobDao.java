package cn.edu.lnu.persist;

import java.util.List;

import cn.edu.lnu.domain.Job;

public interface JobDao {
	public List<Job> findJobs();
	public boolean addJob(Job job);
	public boolean deleteJobById(String jobId);
}
