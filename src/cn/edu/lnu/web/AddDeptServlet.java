package cn.edu.lnu.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.lnu.domain.Department;
import cn.edu.lnu.persist.DepartmentDao;
import cn.edu.lnu.persist.DepartmentDaoImpl;

/**
 * Servlet implementation class AddDeptServlet
 */
public class AddDeptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DepartmentDao departmentDao = new DepartmentDaoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDeptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		String departId = request.getParameter("department_id");
		String departName = request.getParameter("department_name");
		String departAddress = request.getParameter("location_name");

		Department department = new Department();
		department.setDepartNo(departId);
		department.setDepartName(departName);
		department.setDepartAdrress(departAddress);
		
		departmentDao.addDepartment(department);
		response.sendRedirect("DepartViewServlet.do");
		
	}

}
