<%@page import="apple.laf.JRSUIConstants.Size"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
	<%@ page import="com.multi.dto.MDBoardDto" %>
	<%@ page import="com.multi.dao.MDBoardDao" %>
	<%@ page import="java.util.List" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function allChk(bool) {
		var chks = document.getElementsByName("chk");
		for(var i=0; i<chks.length; i++) {
			chks[i].checked = bool;
		}
	};
	$(function() {
		$("#muldelform").submit(function() {
			if ($("#muldelform input:checked").length == 0 ) {
				alert("삭제할 항목을 하나 이상 체크해주세요");
				return false;
			}
		});
	});
</script>
</head>
<body>
	<%
		MDBoardDao dao = new MDBoardDao();
		List<MDBoardDto> list = dao.selectAll();
	%>
	<%@ include file="./form/header.jsp" %>
	<form action="muldel.jsp" method="post" id="muldelform">
		<table border="1">
				<col width="30px">
				<col width="50px">
				<col width="100px">
				<col width="300px">
				<col width="100px">
				<tr>
					<th><input type="checkbox" name="chk" onclick="allChk(this.checked);"></th>
					<th>NO</th>
					<th>NAME</th>
					<th>TITLE</th>
					<th>DATE</th>
				</tr>
				<%
				
				if(list.size() == 0) {

				%>
					<tr>
						<td colspan="5">---게시글이 존재 하지 않습니다.---</td>
					</tr>
				<%
				} else {
					for(MDBoardDto dto : list) {
				%>
					<tr>
						<td><input type="checkbox" name="chk" value="<%=dto.getSeq()%>"></td>
						<td><%=dto.getSeq() %></td>
						<td><%=dto.getWriter() %>
						<td><a href="boarddetail.jsp?seq=<%=dto.getSeq()%>"><%=dto.getTitle() %></a></td>
						<td><%=dto.getRegdate() %></td>
					</tr>
				<%
					}
				}
				%>
				<tr>
					<td colspan="5" align="right">
						<input type="button" value="글쓰기"  onclick="location.href='boardwrite.jsp' ">
						<input type="submit" value="삭제">
					</td>
				</tr>
		</table>
		<%@ include file="./form/footer.jsp" %>
	</form>
</body>
</html>