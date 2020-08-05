<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
    
    <%@ page import="com.login.dto.MyMemberDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%
		MyMemberDto dto = (MyMemberDto)session.getAttribute("dto");
	
		if(dto == null ) {
			pageContext.forward("index.jsp");
		}
	%>
<body>
	<div>
		<span><%=dto.getMyid() %> 님 환영합니다.(등급 : <%=dto.getMyrole() %>)</span><br>
		<a href="logincontroller.jsp?command=logout">로그아웃</a>
	</div>
	<br>
	<hr>
	<div>
			<div>
				<a href="logincontroller.jsp?command=userlistall">회원 정보 조회(all)</a>
			</div>
	</div>
	<div>
		<div>
			<a href="logincontroller.jsp?command=userlistenabled">회원 정보 조회(enabled="Y")</a>
		</div>
	</div>
	
</body>
</html>