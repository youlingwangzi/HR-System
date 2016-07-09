package cn.edu.lnu.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.lnu.domain.Page;
import cn.edu.lnu.persist.JobDao;
import cn.edu.lnu.persist.JobDaoImpl;

/**
 * Servlet implementation class EmpViewServlet
 */
public class JobViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private JobDao jobDao = new JobDaoImpl();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//从数据库中查询员工信息
		request.setCharacterEncoding("utf-8");
		String page = request.getParameter("page");
		
		Page p = jobDao.findEmployeeByPage(Integer.parseInt(page));
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
