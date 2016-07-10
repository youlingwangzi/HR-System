package cn.edu.lnu.persist;

import cn.edu.lnu.domain.Page;
import cn.edu.lnu.domain.Staff;

public interface EmployeeDao {
	public Page findEmployeeByPage(int currentPage);
	public boolean addEmployee(Staff staff);
}
