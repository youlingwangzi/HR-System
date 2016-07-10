package cn.edu.lnu.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.lnu.domain.Admin;
import cn.edu.lnu.persist.AdminDao;
import cn.edu.lnu.persist.AdminDaoImpl;

/**
 * Servlet implementation class DepartViewServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDao adminDao = new AdminDaoImpl();
	/**
	 * 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//从数据库中查询员工信息
		request.setCharacterEncoding("utf-8");
		String adminName = request.getParameter("adminname");
		String adminPwd = request.getParameter("adminpwd");
		int adminAuthority = Integer.valueOf(request.getParameter("adminlevel"));
		
		
		Admin admin = adminDao.findAdminByName(adminName);
		if(admin.getAdminNameString() != null){
			if(admin.getPassword().equals(adminPwd)){
				//跳转到defult；
				response.sendRedirect("admin/default.jsp");
			}else{
				//跳回并说明用户名或密码错误
				response.sendRedirect("Login.jsp?error=wrongPassword");
			}
		}else{
			//跳回并说明此用户不存在
			response.sendRedirect("Login.jsp?error=wrongName");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

