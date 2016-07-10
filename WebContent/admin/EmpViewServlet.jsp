<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.lnu.domain.Page"%>
<%@page import="cn.edu.lnu.domain.Staff"%>
<%@page import="cn.edu.lnu.util.Constants"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String adminName = (String)session.getAttribute("adminName");
int adminAuthority = 0;
if(adminName == null){ response.sendRedirect("../Login.jsp");} 
else{ adminAuthority = Integer.valueOf((String)session.getAttribute("adminAuthority"));}
%>

<!DOCTYPE HTML>
<jsp:include page="header.jsp" />
<style type="text/css"> 
 .AutoNewline 
 { 
   Word-break: break-all;/*必须*/ 
 } 
 </style> 
<script type="text/javascript"> 
 			//****************-删除确认*************** 
 			function del(employee_id) { 
 				//弹出确认框 
 				var flag = window.confirm("你确定要删除" + employee_id + "号员工吗?"); 
 				//如果单击确定，则执行DelEmpServlet，并且传入员工编号 
 				if (flag) { 
 					location.href = "DeleteEmpServlet.do?empid=" + employee_id + ""; 
 					alert("删除成功"); 
 					location.href = "EmpViewServlet.do?page=1"; 
 				} 
 			} 
</script> 

<table>
<tr>
<td id = "bar">
<table>
<jsp:include page="UserCenter.jsp" />
<tr><td><a class = "login_button" href = "LogoutServlet.do">注销●</a></td></tr>
<tr><td class = "bar_line" ></td></tr>
<tr><td>
<dl></br>
	<dt class = cat_list_dt_on><h3>管理系统</h3></dt>
	<dd><p class = articleList><a href = 'admin/default.jsp'>▎主页</a></p></dd></br>
	<dd><p class = articleList><a href = 'DepartViewServlet.do'>▎部门查询</a></p></dd>
	<dd><p class = articleList><a href = 'JobViewServlet.do'>▎职务查询</a></p></dd>
	<dd><p class = articleList><a href = 'EmpViewServlet.do?page=1'>▎员工查询</a></p></dd></dl>
</dl>
</td></tr>
</table>
</td>

<td id = "main_body">

<h1>员工查询</h1>
		<table border="0" width="700" height="350" bgcolor="#ffffff"
			align="center">
			<tr>
				<td align="center" valign="top">
					<table width="98%" border="0" cellpadding="5" cellspacing="1"
						bgcolor="#CCCCCC">
						<tr>
							<td width="7%" height="24" bgcolor="#FFCC00">
								员工编号
							</td>
							<td width="11%" height="24" bgcolor="#FFCC00">
								员工姓名
							</td>
							<td width="16%" height="24" bgcolor="#FFCC00">
								邮箱
							</td>
							<td width="14%" height="24" bgcolor="#FFCC00">
								电话
							</td>
							<td width="14%" height="24" bgcolor="#FFCC00">
								入职时间
							</td>
							<td width="9%" height="24" bgcolor="#FFCC00">
								职务
							</td>
							<td width="9%" height="24" bgcolor="#FFCC00">
								工资
							</td>
							<td width="7%" height="24" bgcolor="#FFCC00">
								部门
							</td>
							<%if(adminAuthority == 1){ %>
							<td width="13%" height="24" bgcolor="#FFCC00">
								操作
							</td>
							<%} %>
						</tr>
						
							<%
								Page p = (Page)request.getAttribute("p");
								List list = p.getList();
								for(int i=0;i<list.size();i++)
								{
									Staff e = (Staff)list.get(i);
							%>
							<tr>
								<td height="24" bgcolor="#FFFFFF">
									<%=e.getStaffId() %>
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<%=e.getStaffName() %>
								</td>
								<td class="AutoNewline" height="24" bgcolor="#FFFFFF">
									<%=e.getStaffEmail() %>
								</td>
								<td class="AutoNewline" height="24" bgcolor="#FFFFFF">
									<%=e.getStaffPhone() %>
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<%=e.getEntryTime() %>
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<%=e.getJobName() %>
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<%=e.getStaffPay() %>
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<%=e.getDeptName() %>
								</td>
							<%if(adminAuthority == 1){ %>
								<td height="24" bgcolor="#FFFFFF">
									<a href="admin/UpdateEmp.jsp?staff_id=<%=e.getStaffId() %>">修改</a>
									<a href="javascript:del(<%=e.getStaffId()%>)">删除</a>
																</td>
							<%} %>
							</tr>
							<%
								}
							%>
						
					</table>

					<table width="95%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td height="24" align="center">
								共<%=p.getTotalNumber() %>条数据，每页显示<%=Constants.ITEM_PER_PAGE %>条，
								共<%=p.getTotalPage() %>页，当前是第<%=p.getCurrentPage() %>页
							</td>
						</tr>
						<tr>
							<td height="24" align="center">
								<a href="EmpViewServlet.do?page=1">首页</a>
								<a class='cur' href="EmpViewServlet.do?page=<%=p.getCurrentPage()-1 %>">上页</a>
								<a href="EmpViewServlet.do?page=<%=p.getCurrentPage()+1 %>">下页</a>
								<a href="EmpViewServlet.do?page=<%=p.getTotalPage() %>">末页</a>
							</td>
						</tr>
						<tr>
							<td height="24" align="center">
								
									
									
										<font color="red"><b>1</b>
										</font>
									
								
							</td>
						</tr>
					</table>
							<%if(adminAuthority == 1){ %>
					<p>
						<a href="admin/AddEmp.jsp">增加新员工</a>					</p>
						<%} %>
				</td>
			</tr>
		</table>

</td>
</tr>
</table>

<jsp:include page="footer.jsp" />
