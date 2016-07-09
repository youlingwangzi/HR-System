package cn.edu.lnu.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.lnu.domain.Department;
import cn.edu.lnu.persist.DepartmentDao;
import cn.edu.lnu.persist.DepartmentDaoImpl;

/**
 * Servlet implementation class DepartViewServlet
 */
public class DepartViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DepartmentDao departmentDao = new DepartmentDaoImpl();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//从数据库中查询员工信息
		request.setCharacterEncoding("utf-8");
		
		List<Department> departments = departmentDao.findDepartments();
		request.setAttribute("d", departments);
		request.getRequestDispatcher("admin/DepartViewServlet.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
