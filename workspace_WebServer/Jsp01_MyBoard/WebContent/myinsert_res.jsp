<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
	<%@ page import="com.my.dto.MyBoardDto" %>
	<%@ page import="com.my.dao.MyBoardDao" %>
<html>
<head>
	<%
		String myname = request.getParameter("myname");
		String mytitle = request.getParameter("mytitle");
		String mycontent = request.getParameter("mycontent");
		
		MyBoardDto dto = new MyBoardDto(myname , mytitle , mycontent);
		MyBoardDao dao = new MyBoardDao();
		int res = dao.insert(dto);
		
		if(res > 0 ) {
	%>
		<script type="text/javascript">
			alert("게시글 작성 완료")
			location.href="mylist.jsp";
		</script>
	<%
		} else {
	%>
		<script type="text/javascript">
			alert("게시글 작성 실패")
			location.href="myinsert.jsp";
		</script>
	<%
		}
	%>
<meta charset="UTF-8">
<title>게시 글 작성</title>
</head>
<body>
	
</body>
</html>