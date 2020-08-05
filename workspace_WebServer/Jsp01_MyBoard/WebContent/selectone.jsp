<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<%@ page import="com.my.dao.MyBoardDao" %>
	<%@ page import="com.my.dto.MyBoardDto" %>
<meta charset="UTF-8">
<title>작성글</title>
	<%
		int myno = Integer.parseInt(request.getParameter("myno"));
		
		MyBoardDao dao = new MyBoardDao();
		MyBoardDto dto = dao.selectOne(myno);
	%>
</head>
<body>
	<form>
		<table>
			<tr>
				<th>NAME : </th>
				<td><input type="text" value="<%=dto.getMyname() %>"  name="myname" readonly="readonly"></td>
			</tr>
			<tr>
				<th>TITLE : </th>
				<td>	
					<input type="text" value="<%=dto.getMytitle() %>" name="mytitle" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>CONTENT : </th>	
				<td>
					<textarea rows="10" cols="40" readonly="readonly"><%=dto.getMycontent() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button onclick="location.href='myupdate.jsp?myno=<%=dto.getMyno()%>' ">수정</button>&nbsp;&nbsp;
					<button onclick="location.href='mydelete.jsp?myno=<%=dto.getMyno()%>' ">삭제</button>&nbsp;&nbsp;
					<button onclick="location.href='mylist.jsp'">목록</button>
			</tr>
		</table>
	</form>
</body>
</html>