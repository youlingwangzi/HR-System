package cn.edu.lnu.web;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.lnu.domain.Staff;
import cn.edu.lnu.persist.EmployeeDao;
import cn.edu.lnu.persist.EmployeeDaoImpl;

/**
 * Servlet implementation class AddEmp
 */
public class AddEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmployeeDao employeeDao = new EmployeeDaoImpl();

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
		String staffName = request.getParameter("empname");
		String staffEmail = request.getParameter("email");
		String staffPhone = request.getParameter("phone_number");
		String entryDate = request.getParameter("hire_date");
		String jobId = request.getParameter("job_id");
		String staffPay = request.getParameter("salary");
		String departNo = request.getParameter("department_id");

		Staff staff = new Staff();
		staff.setStaffName(staffName);
		staff.setStaffEmail(staffEmail);
		staff.setStaffPhone(staffPhone);
		staff.setEntryTime(Date.valueOf(entryDate));
		staff.setJobId(jobId);
		staff.setStaffPay(Float.valueOf(staffPay));
		staff.setDeptNo(departNo);
		
		employeeDao.addEmployee(staff);
		response.sendRedirect("/EmpViewServlet.jsp?page=1");
	}

}
