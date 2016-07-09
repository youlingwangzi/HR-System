package cn.edu.lnu.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.lnu.domain.Job;
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
		
		List<Job> jobs = jobDao.findJobs();
		request.setAttribute("j", jobs);
		request.getRequestDispatcher("admin/JobViewServlet.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
