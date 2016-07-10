<%@page import="cn.edu.lnu.util.Constants"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String error = request.getParameter("error");
String adminName = (String)session.getAttribute("adminName");
int adminAuthority = 0;
if(adminName != null){ response.sendRedirect("admin/default.jsp");} 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title><%=Constants.SYSTEM_NAME %></title>
<link rel = "stylesheet" href = "css/stylesheet.css" type = "text/css" />
<link rel="stylesheet" href="jQuery.isc/jQuery.isc.css" type="text/css" media="screen" charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script language = "javascript" src="jquery-1.11.3.min.js">
</script>
</head>

  <!-- body>
		<form name="form1" method="post" action="LoginServlet.do">
			<table width="300" border="0" align="center" cellpadding="4"
				cellspacing="1" bgcolor="#FF9900">
				<tr>
					<td height="24" colspan="2" align="center" bgcolor="#FFCC66">
						管理员登陆
					</td>
				</tr>
				<tr>
					<td width="77" height="24" align="center" bgcolor="#FFFFFF">
						管理账号
					</td>
					<td width="204" height="24" bgcolor="#FFFFFF">
						<input name="adminname" type="text" id="adminname" class="input1" 
						value="<%if(error!=null){if(error.equals("wrongPassword")){%>用户名密码错误<%}else{ %>用户不存在<%} %><%} %>"
						>
					</td>
				</tr>
				<tr>
					<td height="24" align="center" bgcolor="#FFFFFF">
						管理密码
					</td>
					<td height="24" bgcolor="#FFFFFF">
						<input name="adminpwd" type="password" id="adminpwd"
							class="input1">
					</td>
				</tr>
				<tr>
					<td height="24" align="center" bgcolor="#FFFFFF">
						管理级别
					</td>
					<td height="24" bgcolor="#FFFFFF">
						<input name="adminlevel" type="radio" value="1" checked>
						管理员
						<input name="adminlevel" type="radio" value="2">
						操作员
					</td>
				</tr>
				<tr>
					<td height="24" colspan="2" align="center" bgcolor="#FFFFFF">
						<input type="submit" name="Submit" value="进入系统">
						&nbsp;&nbsp;
						<input type="hidden" name="targetURL" value="">
					</td>
				</tr>
			</table>
		</form>
	</body -->
<body>
<script src="jQuery.isc/jquery-image-scale-carousel.js" type="text/javascript" charset="utf-8"></script>
<script>
var carousel_images = [
	"aboutUsPhoto/0.jpg",
	"aboutUsPhoto/2.jpg",
	"aboutUsPhoto/7.jpg",
	"aboutUsPhoto/6e.jpg"
];
$(window).load(function(){
	$("#photo_container_home").isc({
		imgArray:carousel_images,
		autoplay:true,
	    autoplayTimer:5000
	});
});
</script>
<div id = "container_main_page">
<div id="photo_container_home">
<div id = "login_home_body">

<div id = "header_main_page">
<table align = "center">
	<tr><td align = "center" width = 60><img src = "img/专业徽标3.png"></td><td><h1><%=Constants.SYSTEM_NAME %></h1></td></tr>
</table>
</div>

<div id = "header_main_page2">
<table align = "center">
	<tr><td><h1><%=Constants.SYSTEM_NAME %></h1></td></tr>
</table>
</div>

<div class = "login_home">
<table align = "center">
<tr>
<td align = "center">
	<h3>你还没有登录</h3>
	<form name="form1" method="post" action="LoginServlet.do">
	<table>
	<tr><td class = "no2" style="width:80px">用户名：</td><td class = "no2"colspan="2">
	<input type = "text" name = "adminname" style="width:169px" value="<%if(error!=null){if(error.equals("wrongPassword")){%>用户名密码错误<%}else{ %>用户不存在<%} %><%} %>">
	</td></tr>
	<tr><td class = "no2" style="width:80px">密码：</td><td class = "no2"colspan="2"><input type = "password" name = "adminpwd" style="width:169px" ></td></tr>
	<tr>
	<td></td><td class = "no2"><input type = "submit" name = "submit" value = "登录"></td>
	</tr>
	</table>
	</form>
</td>
</tr>
</table>
</div>
</div>
</div>

</div>
</body>

</html>
