<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
    
    <%@ page import="com.multi.dto.MDBoardDto"%>
    <%@ page import="com.multi.dao.MDBoardDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String[] seq = request.getParameterValues("chk");

	if(seq == null || seq.length == 0) {
%>
	<script type="text/javascript">
		alert("삭제할 글을 1개 이상 선택해주세요 ");
		location.href="boardList.jsp";
	</script>
<%
	} else {
		MDBoardDao dao = new MDBoardDao();
		int res = dao.multiDelete(seq);
		
		if(res > 0) {
%>
	<script type="text/javascript">
		alert("체크 된 글들을 모두 삭제했습니다.");
		location.href="boardList.jsp";
	</script>
<%
		} else {
%>
	<script type="text/javascript">
		alert("삭제 실패");
		location.href="boardList.jsp";	
	</script>
<%
		}
%>
<%
	}
%>
</body>
</html>