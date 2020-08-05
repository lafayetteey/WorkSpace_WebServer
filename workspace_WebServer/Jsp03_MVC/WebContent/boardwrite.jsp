<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
        
    <%@ page import="com.mvc.dto.MVCBoardDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
//(response)boardinsert (form) 등록 , 취소writer , title , conten
%>
<body>
	<form action="mycontroller.jsp" method="post">
		<input type="hidden" name="command" value="insertuser">
		<table border="1">
			 <tr>	
			 	<th>WRITER</th>
			 	<td ><input type="text" name="writer"></td>
			 </tr>
			 <tr>
			 	<th>TITLE</th>
			 	<td><input type="text" name="title"></td>
			 </tr>
			 <tr>
			 <th>CONTENT</th>
			 	<td><textarea rows="10" cols="50" name="content"></textarea></td>
			 </tr>
			 <tr>
			 	<td colspan="2" align="right">
			 		<input type="submit" value="등록">
			 		<input type="button" value="취소" onclick="location.href='mycontroller.jsp?command=boardList' ">
			 	</td>
			 </tr>
		</table>
	</form>
</body>
</html>