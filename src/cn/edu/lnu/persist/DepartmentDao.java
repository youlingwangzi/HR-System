package cn.edu.lnu.persist;

import java.util.List;

import cn.edu.lnu.domain.Department;
import cn.edu.lnu.domain.Staff;

public interface DepartmentDao {
	public List<Department> findDepartments();
	public boolean addDepartment(Department department);
	public boolean updateDepartment(Department department);
	public Department findDepartmentById(String departmentId);
}
