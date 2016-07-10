package cn.edu.lnu.persist;

import cn.edu.lnu.domain.Admin;

public interface AdminDao {
	public Admin findAdminByName(String adminName);
}
