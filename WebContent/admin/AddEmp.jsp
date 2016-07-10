<%@page import="cn.edu.lnu.persist.DepartmentDaoImpl"%>
<%@page import="cn.edu.lnu.persist.DepartmentDao"%>
<%@page import="cn.edu.lnu.domain.Department"%>
<%@page import="cn.edu.lnu.persist.JobDaoImpl"%>
<%@page import="cn.edu.lnu.persist.JobDao"%>
<%@page import="cn.edu.lnu.domain.Job"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.lnu.web.AddEmpServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>增加员工</title>
		<link rel="stylesheet" type="text/css" href="../css/style.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<script type="text/javascript" src="../inc/Calendar1.inc"></script>

		<script type="text/javascript">
			//显示对应职务的最低和最高工资
			function showSal() {
				//获得职务表单元素对象
				var job_id = document.form1.job_id;
				//显示最低工资和最高工资
				if (job_id.value != "") {
					document.form1.min_salary.value = eval("document.form1.min"+job_id.value+".value");
					document.form1.max_salary.value = eval("document.form1.max"+job_id.value+".value");
				} else {
					document.form1.min_salary.value = "";
					document.form1.max_salary.value = "";
				}
			}
		</script>
	</head>
<body>
		<!-- 页面头部 -->
		<table width="950" border="0" align="center" cellpadding="0"
	cellspacing="0">
          <tr>
            <td height="80" bgcolor="#FFFFFF"><img src="../img/bannal.jpg" width="950"
				height="80"> </td>
          </tr>
          <tr>
            <td height="24" align="right" bgcolor="#FFFFFF"><a href="default.jsp.html">首页</a> <a href="DeptViewServlet.html">部门查询</a> <a href="JobsViewServlet.html">职务查询</a> <a href="EmpViewServlet.html">员工查询</a> <a href="logout.jsp.html">退出登陆</a> </td>
          </tr>
          <tr>
            <td height="24" align="right" bgcolor="#0099CC"> 当前用户：admin 身份：
              
              管理员 </td>
          </tr>
        </table>
		<!-- 页面内容 -->
		<table border="0" width="950" height="350" bgcolor="#ffffff"
			align="center">
			<tr>
				<td align="center" valign="top">
				<%
				AddEmpServlet addEmpServlet = null;
				%>
					<form name="form1" method="post" action="../AddEmpServlet.do">
						<table width="500" border="0" cellpadding="5" cellspacing="1"
							bgcolor="#CCCCCC">
							<tr>
								<td height="24" colspan="2" align="center" bgcolor="#FFCC00">
									请填写以下员工信息
								</td>
							</tr>
							<tr>
								<td width="120" height="24" bgcolor="#FFFFFF">
									员工姓名
								</td>
								<td width="357" height="24" bgcolor="#FFFFFF">
									<input name="empname" type="text" id="empname">
									*
								</td>
							</tr>
							<tr>
								<td height="24" bgcolor="#FFFFFF">
									邮箱地址
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<input name="email" type="text" id="email">
									*
								</td>
							</tr>
							<tr>
								<td height="24" bgcolor="#FFFFFF">
									电话号码
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<input name="phone_number" type="text" id="phone_number">
									例如123.456.789
								</td>
							</tr>
							<tr>
								<td height="24" bgcolor="#FFFFFF">
									入职日期
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<input name="hire_date" type="text" id="hire_date"  onfocus="calendar()">
									yyyy-mm-dd
								</td>
							</tr>
							<tr>
								<td height="24" bgcolor="#FFFFFF">
									职务
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<select name="job_id" id="job_id" onchange="showSal()">
										<option value="">
											请选择职务
										</option>

										<!-- 循环输出所有的职务option -->
										
										<%
											List<Job> jobList = new ArrayList<Job>();
											JobDao jobDao = new JobDaoImpl();
											jobList = jobDao.findJobs();
											
											for(int i = 0;i<jobList.size();i++){
												
										%>
										
											<option value="<%=jobList.get(i).getJobId() %>"><%=jobList.get(i).getJobName() %></option>
										
										<%
											}
										%>

									</select>

									<!-- 隐藏表单元素：存储每种职务的最低和最高工资 -->
										<%
										for(int i = 0; i<jobList.size();i++){
											
										
										%>
										<input type="hidden" name="min_pay" value="<%=jobList.get(i).getLowestPay() %>"/>
										<input type="hidden" name="max_pay" value="<%=jobList.get(i).getHighstPay() %>"/>							
										<%
										}
										%>						
									

									<!--input name="min_salary" type="text" id="min_salary" size="10"
										readonly>
									工资范围
									~
									<input name="max_salary" type="text" id="max_salary" size="10"
										readonly-->
								</td>
							</tr>
							<tr>
								<td height="24" bgcolor="#FFFFFF">
									工资
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<input name="salary" type="text" id="salary">
									*
								</td>
							</tr>
							<tr>
								<td height="24" bgcolor="#FFFFFF">
									部门
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<select name="department_id" id="department_id">
										<option value="">
											请选择部门
										</option>

										<!-- 循环输出所有的部门的option -->
										<%
										List<Department> departmentList = new ArrayList<Department>();
										DepartmentDao departmentDao = new DepartmentDaoImpl();
										departmentList = departmentDao.findDepartments();
										for(int i = 0;i<departmentList.size();i++){
										%>
											<option value="<%=departmentList.get(i).getDepartNo() %>"><%=departmentList.get(i).getDepartName() %></option>										
										<%
										}
										%>								
										
									</select>
								</td>
							</tr>
							<tr>
								<td height="24" colspan="2" align="center" bgcolor="#FFFFFF">
									<input type="submit" name="Submit" value="提交">
									<input type="button" name="Submit2" value="取消"
										onclick="history.back()">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>

		<!-- 页面底部 -->
		
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><hr></td>
  </tr>
  <tr>
    <td align="center">©版权所有</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>