<%@page import="cn.edu.lnu.domain.Job"%>
<%@page import="java.util.List"%>
<%@
page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>职务数据</title>
		<link rel="stylesheet" type="text/css" href="../css/style.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
	</head>
<body>
		<!-- 页面头部 -->
		<table width="950" border="0" align="center" cellpadding="0"
	cellspacing="0">
          <tr>
            <td height="80" bgcolor="#FFFFFF"><img src="img/bannal.jpg" width="950"
				height="80"> </td>
          </tr>
          <tr>
            <td height="24" align="right" bgcolor="#FFFFFF">
            <a href="default.jsp.html">首页</a> 
            <a href="DeptViewServlet.do">部门查询</a> 
            <a href="JobsViewServlet.do">职务查询</a>
             <a href="EmpViewServlet.do?page=1">员工查询</a> 
             <a href="logout.jsp.html">退出登陆</a> </td>
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
							<th width="16%" height="24" align="center" bgcolor="#FFCC00">
								操作
							</th>
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
								<td height="24" bgcolor="#FFFFFF">
									<a href="UpdateJobs.jsp.html">修改</a>
									<a href="javascript:del('<%=job.getJobId() %>')">删除</a>								</td>
							</tr>
						
							<%
							}
							%>
					</table>
					<p>
						<a href="admin/AddJobs.jsp">增加新职务种类</a>					</p>
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