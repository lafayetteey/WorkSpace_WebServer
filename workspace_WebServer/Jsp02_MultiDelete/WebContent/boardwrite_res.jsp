<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
	<%@ page import="com.multi.dto.MDBoardDto" %>
	<%@ page import="com.multi.dao.MDBoardDao" %>

<html>
<head>
	<%
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		MDBoardDto dto = new MDBoardDto(writer , title , content);
		MDBoardDao dao = new MDBoardDao();
		int res = dao.insert(dto);
		
		if(res>0) {
%>
	<script type="text/javascript">
		alert("글 등록 성공 ");
		location.href="boardList.jsp";
	</script>
<%
		} else {
%>	
	<script type="text/javascript">
		alert("글 등록 실패");
		location.href="boardwrite.jsp";
	</script>
<%
		}
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	
	<%@ include file="./form/footer.jsp" %>
</body>
</html>