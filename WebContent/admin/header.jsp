<%@page import="cn.edu.lnu.util.Constants"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String adminName = (String)session.getAttribute("adminName");
int adminAuthority = 0;
if(adminName == null){ response.sendRedirect("../Login.jsp");} 
else{ adminAuthority = Integer.valueOf((String)session.getAttribute("adminAuthority"));}
%>
<!DOCTYPE HTML>

<html>

<head>
<title><%=Constants.SYSTEM_NAME %></title>
<link rel = "stylesheet" href = "../css/stylesheet.css" type = "text/css" />
<link rel = "stylesheet" href = "css/stylesheet.css" type = "text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script language = "javascript" src="../jquery-1.11.3.min.js">
<script language = "javascript" src="jquery-1.11.3.min.js">
</script>

</head>
<body>
<div id = "header">
<table align = "center">
	<tr><td align = "center" width = "60px"><img src = "专业徽标3.png"></td><td><h1><%=Constants.SYSTEM_NAME %></h1></td></tr>
</table>
</div>
<div id = "menu">
<table>
<tr>
<td class = "no1">
<p>欢迎使用<?php printf("%s", $config_blogname);?>！</p>
</td>
<td class = "no2">
<div class = "main_menu">
	<a class = "login_button">〓</a>
	<%=adminName %>，欢迎你！
	<div class = "user_bar">
	<a class = "login_button">〓</a>
	<%=adminName %>，欢迎你！
	<br/><br/><a class = "login_button" href = "../LogoutServlet.do">注销●</a>
	</div>
</div>
</td>
</tr>
</table>
</div>
<div id = "container">