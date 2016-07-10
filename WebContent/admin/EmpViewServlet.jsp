<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.lnu.domain.Page"%>
<%@page import="cn.edu.lnu.domain.Staff"%>
<%@page import="cn.edu.lnu.util.Constants"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>员工数据</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
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
            <td height="24" align="right" bgcolor="#FFFFFF"><a href="admin/default.jsp">首页</a> <a href="DeptViewServlet.html">部门查询</a> <a href="JobsViewServlet.html">职务查询</a> <a href="EmpViewServlet.do?page=1">员工查询</a> <a href="logout.jsp.html">退出登陆</a> </td>
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
							<td width="16%" height="24" bgcolor="#FFCC00">
								电话
							</td>
							<td width="12%" height="24" bgcolor="#FFCC00">
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
							<td width="13%" height="24" bgcolor="#FFCC00">
								操作
							</td>
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
								<td height="24" bgcolor="#FFFFFF">
									<%=e.getStaffEmail() %>
								</td>
								<td height="24" bgcolor="#FFFFFF">
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
								<td height="24" bgcolor="#FFFFFF">
									<a href="admin/UpdateEmp.jsp?staff_id=<%=e.getStaffId() %>">修改</a>
									<a href="javascript:del(<%=e.getStaffId()%>)">删除</a>
									<a href="PhotoViewServlet.html" target="_blank">照片</a>								</td>
							</tr>
							<%
								}
							%>
						
					</table>

					<!-- 分页显示用界面 -->
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
								<a href="EmpViewServlet.do?page=<%=p.getCurrentPage()-1 %>">上页</a>
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
					<p>
						<a href="admin/AddEmp.jsp">增加新员工</a>					</p>
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
