<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.lnu.domain.Job"%>
<%@page import="java.util.List"%>
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

<script type="text/javascript">
			//****************-删除确认***************
			function del(job_id) {
				//弹出确认框
				var flag = window.confirm("你确定要删除" + job_id + "号职务吗?");
								
				//如果单击确定，则执行DelJobsServlet，并且传入职务编号
				if (flag) {
					location.href = "DeleteJobServlet.do?job_id=" + job_id + "";
					alert("删除成功");
					location.href = "JobViewServlet.do";
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

<h1>职务查询</h1>
		<table border="0" width="700" height="350" bgcolor="#ffffff"
			align="center">
			<tr>
				<td align="center" valign="top">
					<table width="90%" border="0" cellpadding="5" cellspacing="1"
						bgcolor="#CCCCCC">
						<tr>
							<th width="16%" height="24" align="center" bgcolor="#FFCC00">
								职务编号
							</th>
							<th width="21%" height="24" align="center" bgcolor="#FFCC00">
								职务名称
							</th>
							<th width="23%" height="24" align="center" bgcolor="#FFCC00">
								最低工资
							</th>
							<th width="24%" height="24" align="center" bgcolor="#FFCC00">
								最高工资
							</th>
							<%if(adminAuthority == 1){ %>
							<th width="16%" height="24" align="center" bgcolor="#FFCC00">
								操作
							</th>
							<%} %>
						</tr>

						<!-- 显示职务数据 -->
						<%
							List list = (List)request.getAttribute("j");
							for(int i = 0;i<list.size();i++){
							Job job = (Job)list.get(i);
						%>
						
							<tr>
								<td height="24" bgcolor="#FFFFFF">
									<%=job.getJobId() %>
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<%=job.getJobName() %>
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<%=job.getLowestPay() %>
								</td>
								<td height="24" bgcolor="#FFFFFF">
									<%=job.getHighstPay() %>
								</td>
								
							<%if(adminAuthority == 1){ %>
								<td height="24" bgcolor="#FFFFFF">
									<a href="admin/UpdateJobs.jsp?job_id=<%=job.getJobId() %>">修改</a>
									<a href="javascript:del('<%=job.getJobId() %>')">删除</a>								</td>
							<%} %>
							</tr>
						
							<%
							}
							%>
					</table>
					
							<%if(adminAuthority == 1){ %>
					<p>
						<a href="admin/AddJobs.jsp">增加新职务种类</a>					</p>
						<%} %>
				</td>
			</tr>
		</table>

</td>
</tr>
</table>

<jsp:include page="footer.jsp" />
