package cn.edu.lnu.persist;

import java.util.List;

import cn.edu.lnu.domain.Department;

public interface DepartmentDao {
	public List<Department> findDepartments();
	public boolean addDepartment(Department department);
	public boolean deleteDepartmentById(String depatmentId);
	public boolean updateDepartment(Department department);
	public Department findDepartmentById(String departmentId);
}
