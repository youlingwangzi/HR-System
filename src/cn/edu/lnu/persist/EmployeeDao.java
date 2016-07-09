package cn.edu.lnu.persist;

import java.util.List;

import cn.edu.lnu.domain.Page;

public interface EmployeeDao {
	public Page findEmployeeByPage(int currentPage);
}
