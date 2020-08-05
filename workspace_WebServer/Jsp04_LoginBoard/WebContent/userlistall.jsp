<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.login.dto.MyMemberDto" %>
<%@ page import="java.util.List" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%
		List<MyMemberDto> list = (List<MyMemberDto>) request.getAttribute("dto");
	%>
<body>
	<h1>회원 정보 조회</h1>
	<table border="1">
		<col width="50"><col width="100"><col width="100"><col width="100"><col width="500">
		<col width="150"><col width="300"><col width="100"><col width="80">
		<tr>
			<th>NO</th>
			<th>ID</th>
			<th>PW</th>
			<th>NAME</th>
			<th>ADDR</th>
			<th>PHONE</th>
			<th>EMAIL</th>
			<th>ENABLED</th>
			<th>ROLE</th>
		</tr>
<%
	for(MyMemberDto dto : list) {
%>
	<tr>
		<td><%=dto.getMyno() %></td>
		<td><%=dto.getMyno() %></td>
		<td><%=dto.getMypw() %></td>
		<td><%=dto.getMyname() %></td>
		<td><%=dto.getMyaddr() %></td>
		<td><%=dto.getMyphone() %></td>
		<td><%=dto.getMyemail() %></td>
		<td><%=dto.getMyenabled().equals("Y")? "가입" : "탈퇴"%></td>
		 <td><%=dto.getMyrole() %></td>
	</tr>
<%

	}
%>
	<tr>
		<td colspan="9" align="right">
			<button onclick="location.href='adminmain.jsp' ">메인</button>
		</td>
	</tr>
		</table>
</body>
</html>