package cn.edu.lnu.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.lnu.domain.Department;
import cn.edu.lnu.persist.DepartmentDao;
import cn.edu.lnu.persist.DepartmentDaoImpl;

/**
 * Servlet implementation class UpdateEmpServlet
 */
@WebServlet("/UpdateEmpServlet.do")
public class UpdateDepartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DepartmentDao departmentdao = new DepartmentDaoImpl();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		String departName = request.getParameter("department_name");
		String departAdrress = request.getParameter("location_name");
		String departId = request.getParameter("department_id");

		Department department = new Department();
		department.setDepartName(departName);
		department.setDepartAdrress(departAdrress);
		department.setDepartNo(departId);
		
		departmentdao.updateDepartment(department);
		response.sendRedirect("DepartViewServlet.do");
	}

}
