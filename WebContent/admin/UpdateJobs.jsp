<%@page import="cn.edu.lnu.persist.DepartmentDaoImpl"%>
<%@page import="cn.edu.lnu.persist.DepartmentDao"%>
<%@page import="cn.edu.lnu.domain.Department"%>
<%@page import="cn.edu.lnu.persist.JobDaoImpl"%>
<%@page import="cn.edu.lnu.persist.JobDao"%>
<%@page import="cn.edu.lnu.domain.Job"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cn.edu.lnu.persist.EmployeeDaoImpl"%>
<%@page import="cn.edu.lnu.persist.EmployeeDao"%>
<%@page import="cn.edu.lnu.domain.Staff"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
String postJobId = request.getParameter("job_id");//用request得到 
 %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



















<jsp:include page="header.jsp" />

<script language = "javascript">
$(document).ready(function(){
	$(".cat_list_dt").siblings().hide();
	$(".cat_list_dt").click(function(){
		if($(this).siblings().is(":hidden")){
			$(this).siblings().show(200);
		}else{
			$(this).siblings().hide(200);
		}
	});
});
</script>

<table>
<tr>
<td id = "bar">
<table>
<jsp:include page="UserCenter.jsp" />
<tr><td><a class = "login_button" href = "../LogoutServlet.do">注销●</a></td></tr>
<tr><td class = "bar_line" ></td></tr>
<tr><td>
<dl></br>
	<dt class = cat_list_dt_on><h3>管理系统</h3></dt>
	<dd><p class = articleList><a href = 'default.jsp'>▎主页</a></p></dd></br>
	<dd><p class = articleList><a href = '../DepartViewServlet.do'>▎部门查询</a></p></dd>
	<dd><p class = articleList><a href = '../JobViewServlet.do'>▎职务查询</a></p></dd>
	<dd><p class = articleList><a href = '../EmpViewServlet.do?page=1'>▎员工查询</a></p></dd></dl>
</dl>
</td></tr>
</table>
</td>

<td id = "main_body">

<h1>更新职务信息</h1>
		<table border="0" width="700" height="350" bgcolor="#ffffff"
			align="center">
			<tr>
				<td align="center" valign="top">
					<form method="post" action="../UpdateJobServlet.do">
						<table width="500" border="0" cellpadding="5" cellspacing="1"
							bgcolor="#CCCCCC">
							<tr>
								<td height="24" colspan="2" align="center" bgcolor="#FFCC00">
									请修改职务类型信息
								</td>
							</tr>
							<%
							Job job = null;
							JobDao jobDao = new JobDaoImpl();
							job = jobDao.findJobById(postJobId);
							%>
							<tr>
								<td width="130" height="24" bgcolor="#FFFFFF">
									职务编号
								</td>
								<td width="347" height="24" bgcolor="#FFFFFF">
									<input name="job_id" type="text" id="job_id"
										readonly="readonly" value="<%=job.getJobId() %>">
									*
								</td>
							</tr>
							<tr>
								<td height="24" bgcolor="#FFFFFF">
									职务名称
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<input name="job_title" type="text" id="job_title"
										value="<%=job.getJobName() %>">
									*
								</td>
							</tr>
							<tr>
								<td height="24" bgcolor="#FFFFFF">
									最低工资
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<input name="min_salary" type="text" id="min_salary"
										value="<%=job.getLowestPay() %>">
									*
								</td>
							</tr>
							<tr>
								<td height="24" bgcolor="#FFFFFF">
									最高工资
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<input name="max_salary" type="text" id="max_salary"
										value="<%=job.getHighstPay() %>">
									*
								</td>
							</tr>
							<tr>
								<td height="24" colspan="2" align="center" bgcolor="#FFFFFF">
									<input type="submit" name="Submit" value="更新" onClick="alert('修改职务成功');location.href='../JobViewServlet.do'">
									<input type="button" name="Submit2" value="取消"
										onclick="history.back()">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
</td>
</tr>
</table>

<jsp:include page="footer.jsp" />
