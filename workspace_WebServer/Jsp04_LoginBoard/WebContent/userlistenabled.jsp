<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
    
    <%@ page import="com.login.dto.MyMemberDto" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function updaterole(myno) {
			location.href="logincontroller.jsp?command=updateroleform&myno="+myno;
		}
	</script>
</head>
	<%
		List<MyMemberDto> list = (List<MyMemberDto>)request.getAttribute("dto");
	%>
<body>
	<h1>회원 정보 조회(enabled)</h1>
	<table border="1">
	<col width="50"><col width="100"><col width="100"><col width="300"><col width="100"><col width="100">
		<tr>
			<th>NO</th>
			<th>ID</th>
			<th>NAME</th>
			<th>EMAIL</th>
			<th>ROLE</th>
			<th>ROLE CHANGE</th>
		</tr>
<%
	for(MyMemberDto dto : list) {
%>
	<tr>
		<td><%=dto.getMyno() %> </td>
		<td><%=dto.getMyid() %></td>
		<td><%=dto.getMyname() %></td>
		<td><%=dto.getMyemail() %></td>
		<td><%=dto.getMyrole() %></td>
		<td><button onclick="updaterole(<%=dto.getMyno()%>);">변경</button>	
				<button onclick="location.href='adminmain.jsp' ">취소</button>
		</td>
	</tr>
<%
	}
%>
		</table>
</body>
</html>