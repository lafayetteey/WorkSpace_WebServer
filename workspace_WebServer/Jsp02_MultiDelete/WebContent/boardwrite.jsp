<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
	<%@ page import="com.multi.dto.MDBoardDto" %>
	<%@ page import="com.multi.dao.MDBoardDao" %>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 페이지 </title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("form").submit(function() {
			if($("form input:text").val() == " " || $("textarea").val() == " ") {
				alert("모두 입력해주세요");
				return false;
			}
		});
	});

</script>
</head>
<body>
<%@ include file="./form/header.jsp" %>
	<h1>게시글 작성</h1>
	<form action="boardwrite_res.jsp" method="post">
		<table border="1">
			<col width="100px">
			<col width = "400px">
			<tr>
				<th>WRITER</th>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<th>TITLE</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>CONTENT</th>
				<td>
					<textarea rows="10" cols="60" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록">&nbsp;
					<input type="button" value="취소" onclick="location.href='boardList.jsp' ">
				</td>
			</tr>
		</table>
	</form>
	
<%@ include file="./form/footer.jsp" %>
</body>
</html>