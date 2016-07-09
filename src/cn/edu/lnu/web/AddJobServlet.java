package cn.edu.lnu.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.lnu.domain.Job;
import cn.edu.lnu.persist.JobDao;
import cn.edu.lnu.persist.JobDaoImpl;

/**
 * Servlet implementation class AddEmp
 */
public class AddJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	JobDao jobDao = new JobDaoImpl();

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
		String jobId = request.getParameter("job_id");
		String jobName = request.getParameter("job_title");
		String lowestPay = request.getParameter("min_salary");
		String highesPay = request.getParameter("max_salary");

		Job job = new Job();
		job.setJobId(jobId);
		job.setJobName(jobName);
		job.setLowestPay(Float.valueOf(lowestPay));
		job.setHighstPay(Float.valueOf(highesPay));
		
		jobDao.addJob(job);
		response.sendRedirect("JobViewServlet.do");
	}

}
