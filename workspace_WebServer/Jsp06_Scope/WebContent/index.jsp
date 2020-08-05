<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		//page , request , session , application
		pageContext.setAttribute("pageId", "myPageIdVal");
		request.setAttribute("reqId", "myRequestIdVal");		
		session.setAttribute("sessionId", "mySessionIdVal");
		application.setAttribute("appId", "myApplicationIdVal");
	
	%>
	
	<h1>INDEX</h1>
	pagaId = <%=pageContext.getAttribute("pageId") %><br>
	reqId = <%=request.getAttribute("reqId") %><br>
	sessionId = <%=session.getAttribute("sessionId") %><br>
	appId = <%=application.getAttribute("appId") %><br>
	
	<a href="result.jsp">이동(result.jsp)</a><br>
	<a href="myservlet.do">이동(controller)</a>
</body>
</html>