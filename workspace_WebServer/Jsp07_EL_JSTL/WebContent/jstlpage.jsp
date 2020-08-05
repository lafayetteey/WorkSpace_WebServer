<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
    
    <!-- JSTL 사용하려면 URI 사용 -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Page</h1>
	<table border="1">
		<tr>
			<th>NAME</th>
			<th>KOR</th>
			<th>ENG</th>
			<th>MATH</th>
			<th>SUM</th>
			<th>AVG</th>
			<th>GRADE</th>
		</tr>
		<c:forEach var="score" items="${list }">
			<tr>
				<td>
				<c:if test="${score.name  eq '이름1'}">
						<c:out value="홍길동"></c:out>
				</c:if>
				<c:choose>
				<c:when test="${score.name eq '이름2' }">
					<c:out value="${score.name }님!!"></c:out>
				</c:when>
				<c:otherwise>
					<c:out value="${score.name }"></c:out>
				</c:otherwise>
				</c:choose>
			<td>
				<c:out value="${score.kor }"></c:out>
			</td>
			<td>
				<c:out value="${score.eng }"></c:out>
			</td>
			<td>
				<c:out value="${score.math }"></c:out>
			</td>
			<td>
				<c:out value="${score.sum }"></c:out>
			</td>
			<td>
				<c:out value="${score.avg }"></c:out>
			</td>
			<td>
				<c:out value="${score.grade }"></c:out>
			</td>
			</tr>
		</c:forEach>
	</table>
	<table border="1">
		<tr>
			<th colspan="5">구구단</th>
		</tr>
		<c:forEach var="i" begin="2" end="9" step="1">
			<c:forEach var="j" begin="1" end="9" step="1">
				<tr>
					<td>${i }</td>
					<td> * </td>
					<td>${j }</td>
					<td> = </td>
					<td>${i*j }</td>
				</tr>
			</c:forEach>
		</c:forEach>
	</table>
</body>
</html>