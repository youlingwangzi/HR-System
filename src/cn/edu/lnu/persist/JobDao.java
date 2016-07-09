package cn.edu.lnu.persist;

import java.util.List;

import cn.edu.lnu.domain.Job;
import cn.edu.lnu.domain.Page;

public interface JobDao {
	public List<Job> findJobs();
}
