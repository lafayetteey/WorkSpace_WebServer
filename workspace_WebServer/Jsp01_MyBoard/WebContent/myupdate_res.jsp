<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
	<%@ page import="com.my.dao.MyBoardDao" %>
	<%@ page import="com.my.dto.MyBoardDto" %>
<html>
<head>
	<%
		int myno = Integer.parseInt(request.getParameter("myno"));
		String mytitle = request.getParameter("mytitle");
		String mycontent = request.getParameter("mycontent");
		
		MyBoardDto dto = new MyBoardDto(myno , mytitle , mycontent);
		MyBoardDao dao = new MyBoardDao();
		int res = dao.update(dto);
		
		if(res > 0) {
	%>
		<script type="text/javascript">
			alert("게시글 수정 완료");
			location.href="selectone.jsp?myno=<%=dto.getMyno()%>";
		</script>
	<%
		} else {
	%>
		<script type="text/javascript">
			alert("게시글 수정 실패");
			location.href="mylist.jsp?myno=<%=dto.getMyno()%>";
		</script>
	<%
		}
	%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>