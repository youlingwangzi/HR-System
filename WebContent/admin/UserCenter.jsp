<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String adminName = (String)session.getAttribute("adminName");
int adminAuthority = 0;
if(adminName == null){ response.sendRedirect("../Login.jsp");} 
else{ adminAuthority = Integer.valueOf((String)session.getAttribute("adminAuthority"));}
%>
<tr><td id = "userCenter">
<%
	if(adminAuthority == 1){%>
		</br><h3>尊敬的管理员：<br/><%=adminName %>欢迎你！</h3></br>
		<%
	}
	else{%>
		</br><h3><%=adminName %>同学，你好！<br/>欢迎你！</h3></br>
		<%
	}
%>
</td></tr>