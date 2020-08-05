<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<%@ page import="com.my.dao.MyBoardDao" %>
	<%@ page import="com.my.dto.MyBoardDto" %>
	<%@ page import="java.util.List" %>
<meta charset="UTF-8">
<title>자유 게시판</title>
	<%
		MyBoardDao dao = new MyBoardDao();
		List<MyBoardDto> list = dao.selectAll();
	%>
</head>
<body>
	<h1>자유 게시판 </h1>
	<h4>Whats On Your Mind?</h4>
	<table border="1">
			<col width="100px">
			<col width="100px">
			<col width="200px">
			<col width="100px">
			<col width="50px">
			<col width="50px">
		<tr>
			<th>NO</th>
			<th>NAME</th>
			<th>TITLE</th>
			<th>DATE</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
			for(int i=0; i<list.size(); i++) {
		%>
			<tr>
				<td><%=list.get(i).getMyno() %></td>
				<td><%=list.get(i).getMyname() %></td>
				<td><a href="selectone.jsp?myno=<%=list.get(i).getMyno()%>"><%=list.get(i).getMytitle() %></a></td>
				<td><%=list.get(i).getMydate() %></td>
				<td><a href="myupdate.jsp?myno=<%=list.get(i).getMyno()%>">수정</a></td>
				<td><a href="mydelete.jsp?myno=<%=list.get(i).getMyno()%>">삭제</a></td>
			</tr>
		<%
			}
		%>
		<tr>
			<td colspan="6"  align="right"> 
				<input type="button" value="글쓰기" onclick="location.href='myinsert.jsp' ">
			</td>
		</tr>
	</table>
</body>
</html>