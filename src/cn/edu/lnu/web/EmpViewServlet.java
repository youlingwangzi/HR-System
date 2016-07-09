package cn.edu.lnu.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.lnu.domain.Page;
import cn.edu.lnu.persist.EmployeeDao;
import cn.edu.lnu.persist.EmployeeDaoImpl;

/**
 * Servlet implementation class EmpViewServlet
 */

public class EmpViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployeeDao empDao = new EmployeeDaoImpl();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//从数据库中查询员工信息
		request.setCharacterEncoding("utf-8");
		String page = request.getParameter("page");
		
		Page p = empDao.findEmployeeByPage(Integer.parseInt(page));
		request.setAttribute("p", p);
		request.getRequestDispatcher("admin/EmpViewServlet.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
