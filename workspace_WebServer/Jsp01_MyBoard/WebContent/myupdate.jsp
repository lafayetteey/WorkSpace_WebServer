<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
	<%@ page import="com.my.dto.MyBoardDto" %>
	<%@ page import="com.my.dao.MyBoardDao" %>
<html>
	<%
		int myno = Integer.parseInt(request.getParameter("myno"));
		
		MyBoardDao dao = new MyBoardDao();
		MyBoardDto dto = dao.selectOne(myno);
	%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="myupdate_res.jsp" method="post">
		<input type="hidden"  name="myname" value="<%=dto.getMyno() %>">
		<table>
			<tr>	
				<th>NAME : </th>
				<td><%=dto.getMyname() %></td>
			</tr>
			<tr>
				<th>TITLE : </th>
				<td><input type="text" name="myname"  value="<%=dto.getMytitle()%>"></td>
			</tr>
			<tr>
				<th>CONTENT : </th>
				<td><textarea rows="10" cols="40" name="mytitle"><%=dto.getMycontent() %></textarea>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="location.href='selectone.jsp' ">
				</td>
			</tr>
		</table>		
	</form>
</body>
</html>