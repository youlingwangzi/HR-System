package cn.edu.lnu.web;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.lnu.domain.Job;
import cn.edu.lnu.domain.Staff;
import cn.edu.lnu.persist.EmployeeDao;
import cn.edu.lnu.persist.EmployeeDaoImpl;
import cn.edu.lnu.persist.JobDao;
import cn.edu.lnu.persist.JobDaoImpl;

/**
 * Servlet implementation class UpdateEmpServlet
 */
@WebServlet("/UpdateEmpServlet.do")
public class UpdateJobServlet extends HttpServlet {
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
		String jobname = request.getParameter("job_title");
		String lowpay = request.getParameter("min_salary");
		String heipay = request.getParameter("max_salary");
		String jobid = request.getParameter("job_id");
		Job job = new Job();
		job.setJobName(jobname);
		job.setLowestPay(Float.valueOf(lowpay));
		job.setHighstPay(Float.valueOf(heipay));
		job.setJobId(jobid);
		
		jobDao.updateJob(job);
		response.sendRedirect("JobViewServlet.do");
	}

}
