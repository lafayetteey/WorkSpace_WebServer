<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<%@ page import="com.multi.dao.MDBoardDao" %>
	<%@ page import="com.multi.dto.MDBoardDto" %>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		#updateform{
			display : none;
		}
	</style>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		function updateFormView() {
			$("#detailform").hide();
			$("#updateform").show();
		}
		function detailFormView() {
			$("#updateform").hide();
			$("#detailform").show();
		}
	</script>
	<%
		int seq = Integer.parseInt(request.getParameter("seq"));
	
		MDBoardDao dao = new MDBoardDao();
		MDBoardDto dto = dao.selectOne(seq);
	%>
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	<div id="detailform">
	<h1>게시글 보기</h1>
			<table border="1">
				<tr>
					<th>NO</th>
					<td><%=dto.getSeq()%></td>
				</tr>
				<tr>
					<th>WRITER</th>
					<td><%=dto.getWriter()%></td>
				</tr>
				<tr>
					<th>DATE</th>
					<td><%=dto.getRegdate() %></td>
				</tr>
				<tr>
					<th>TITLE</th>
					<td><%=dto.getTitle() %></td>
				</tr>
				<tr>
					<th>CONTENT</th>
					<td><textarea rows="10" cols="60" readonly="readonly"><%=dto.getContent()%></textarea>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="button" value="수정" onclick="updateFormView();">
						<input type="button" value="삭제" onclick="location.href='boarddelete.jsp?seq=<%=dto.getSeq()%>' ">
						<input type="button" value="목록" onclick="location.href='boardList.jsp' ">
					</td>
				</tr>
			</table>
	</div>
	
	<!-- ------------------------------------------------------------- -->
	<div id="updateform">
	<h1>게시글 수정</h1>
		<form action="boardupdate_res.jsp" method="post">
		<input type="hidden"  name="seq" value="<%=dto.getSeq()%>">
			<table border="1">
				<tr>
					<th>NO</th>
					<td><%=dto.getSeq()%></td>
				</tr>
				<tr>
					<th>WRITER</th>
					<td><%=dto.getWriter()%></td>
				</tr>
				<tr>
					<th>DATE</th>
					<td><%=dto.getRegdate() %></td>
				</tr>
				<tr>
					<th>TITLE</th>
					<td><input type="text" name="title" value="<%=dto.getTitle() %>"></td>
				</tr>
				<tr>
					<th>CONTENT</th>
					<td><textarea rows="10" cols="60" name="content"><%=dto.getContent()%></textarea>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정">
						<input type="button" value="취소" onclick="detailFormView();">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>