<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.lnu.domain.Department"%>
<%@page import="java.util.List"%>
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

		<script type="text/javascript">
			//****************-删除确认***************
			function del(department_id) {
				//弹出确认框
				var flag = window.confirm("你确定要删除" + department_id + "号部门吗?");
								
				//如果单击确定，则执行DelDeptServlet，并且传入部门编号
				if (flag) {
					location.href = "DeleteDeptServlet.do?department_id=" + department_id + "";
					alert("删除成功");
					location.href = "DepartViewServlet.do";
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

<h1>部门查询</h1>
		<table border="0" width="700" height="350" bgcolor="#ffffff"
			align="center">
			<tr>
				<td align="center" valign="top">
					<table width="90%" border="0" cellpadding="5" cellspacing="1"
						bgcolor="#CCCCCC">
						<tr>
							<th width="17%" bgcolor="#FFCC00">
								部门编号
							</th>
							<th width="25%" bgcolor="#FFCC00">
								部门名称
							</th>
							<th width="37%" bgcolor="#FFCC00">
								部门地址
							</th>
							<%if(adminAuthority == 1){ %>
							<th width="21%" bgcolor="#FFCC00">
								操作
							</th>
							<%} %>
						</tr>

						<!-- 循环输出部门记录 -->
						
						<%
							List list = (List)request.getAttribute("d");
							for(int i = 0;i<list.size();i++){
								Department department = (Department)list.get(i);
							
						%>
						
							<tr>
								<td bgcolor="#FFFFFF">
									<%=department.getDepartNo() %>
								</td>
								<td bgcolor="#FFFFFF">
									<%=department.getDepartName() %>
								</td>
								<td bgcolor="#FFFFFF">
									<%=department.getDepartAdrress() %>
								</td>
							<%if(adminAuthority == 1){ %>
								<td bgcolor="#FFFFFF">
									<a href="admin/UpdateDept.jsp?depart_id=<%=department.getDepartNo() %>">修改</a>
									<a href="javascript:del('<%=department.getDepartNo() %>')">删除</a>								</td>
							
							<%} %>
							</tr>
							
						<%
							}
						%>

					</table>
					
							<%if(adminAuthority == 1){ %>
					<p>
						<a href="admin/AddDept.jsp">增加新部门</a>					</p>
						<%} %>
				</td>
			</tr>
	</table>

</td>
</tr>
</table>

<jsp:include page="footer.jsp" />
