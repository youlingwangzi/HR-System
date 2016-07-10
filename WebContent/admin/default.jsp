<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String adminName = (String)session.getAttribute("adminName");
int adminAuthority = 0;
if(adminName == null){ response.sendRedirect("../Login.jsp");} 
else{ adminAuthority = Integer.valueOf((String)session.getAttribute("adminAuthority"));}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:include page="header.jsp" />


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

<h1>欢迎来到皇家人事管理系统</h1>
<table align = center>
<tr align = center>
	<td border = 0 style = "width:300px"><a href = '../DepartViewServlet.do'> <img src = "../img/fileIcon.jpg" style = "width:150px"> </a></td>
	<td border = 0 style = "width:300px"><a href = '../JobViewServlet.do'> <img src = "../img/userIcon.jpg" style = "width:150px"> </a></td>
</tr>

<tr align = center>
	<td border = 0><h2>部门查询</h2></td>
	<td border = 0><h2>职务查询</h2></td>
</tr>


<tr align = center>
	<td border = 0 style = "width:300px"><a href = '../EmpViewServlet.do?page=1'> <img src = "../img/staffIcon.gif" style = "width:150px"> </a></td>
</tr>

<tr align = center>
	<td border = 0><h2>员工查询</h2></td>
</tr>

</table>

</td>
</tr>
</table>

<jsp:include page="footer.jsp" />
