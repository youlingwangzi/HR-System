package cn.edu.lnu.persist;

import java.util.List;

import cn.edu.lnu.domain.Department;

public interface DepartmentDao {
	public List<Department> findDepartments();
}