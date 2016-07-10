package cn.edu.lnu.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.lnu.persist.JobDao;
import cn.edu.lnu.persist.JobDaoImpl;

/**
 * Servlet implementation class DeleteJobServlet
 */
public class DeleteJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	JobDao jobDao = new JobDaoImpl();
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String jobId = request.getParameter("job_id");
		
		jobDao.deleteJobById(jobId);
		response.sendRedirect("JobViewServlet.do");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
