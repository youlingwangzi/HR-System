package cn.edu.lnu.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.lnu.persist.DepartmentDao;
import cn.edu.lnu.persist.DepartmentDaoImpl;

/**
 * Servlet implementation class DeleteDeptServlet
 */
public class DeleteDeptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DepartmentDao departmentDao = new DepartmentDaoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDeptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String depatmentId = request.getParameter("department_id");
		
		departmentDao.deleteDepartmentById(depatmentId);
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
