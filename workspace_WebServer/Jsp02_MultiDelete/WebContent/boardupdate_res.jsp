<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
	<%@ page import="com.multi.dao.MDBoardDao" %>
	<%@ page import="com.multi.dto.MDBoardDto" %>
<html>
<head>
	<%
		int seq = Integer.parseInt(request.getParameter("seq"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		MDBoardDto dto = new MDBoardDto(seq , title , content);
		MDBoardDao dao = new MDBoardDao();
		int res = dao.update(dto);
	
		if(res > 0) {
	%>
		<script type="text/javascript">
			alert("게시글 수정 완료");
			location.href="boardList.jsp";
		</script>
	<%
		} else {
	%>
		<script type="text/javascript">
			alert("게시글 수정 실패");
			location.href="boarddetail.jsp";
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