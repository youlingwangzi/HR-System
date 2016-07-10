package cn.edu.lnu.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.lnu.persist.EmployeeDao;
import cn.edu.lnu.persist.EmployeeDaoImpl;

/**
 * Servlet implementation class DeleteEmpServlet
 */
public class DeleteEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmployeeDao employeeDao = new EmployeeDaoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEmpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String staffId = request.getParameter("empid");
		
		employeeDao.deleteEmployeeById(Integer.valueOf(staffId));
		response.sendRedirect("EmpViewServlet.do?page=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
