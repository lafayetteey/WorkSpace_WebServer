<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
    
    <%@ page import="com.mvc.dto.MVCBoardDto" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
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
			if($("#muldelform input:checked").length == 0) {
				alert("삭제할 항목을 한개 이상 선택해주세요");
			}
		})
	})

</script>
</head>
	<%
		List<MVCBoardDto> list = (List<MVCBoardDto>)request.getAttribute("dto");
	%>
<body>
	<!-- boardlist.jsp(삭제 /글쓰기) no write title date -->
	<form action="mycontroller.jsp" method="post"  id="muldelform">
	<input type="hidden" name="command" value="muldel">
	<table border="1">
	<col width="50"><col width="50"><col width="100"><col width="200"><col width="100">
		<tr>
			<th><input type="checkbox" name="all" onclick="allChk(this.checked);"></th>
			<th>NO</th>
			<th>WRITE</th>
			<th>TITLE</th>
			<th>DATE</th>
		</tr>
		<%
			if(list.size() == 0 ){
%>	
	<tr>
		<td colspan="5">-----게시글이 없습니다-----</td>
	</tr>
<% 				
			} else {
				for(MVCBoardDto dto : list) {
%>
	<tr>	
		<td><input type="checkbox" name="chk" value="<%=dto.getSeq() %>"></td>
		<td><%=dto.getSeq() %></td>
		<td><%=dto.getWriter() %></td>
		<td><a href="mycontroller.jsp?command=boarddetail&seq=<%=dto.getSeq()%>"><%=dto.getTitle() %></a></td>
		<td><%=dto.getRegdate() %></td>
	</tr>
<% 				
				}
			}
		%>
		<tr>
			<td colspan="5" align="right">
				<input type="submit" value="삭제" >
				<input type="button" value="글쓰기" onclick="location.href='mycontroller.jsp?command=boardwrite&seq=<%=dto.getSeq()%>' ">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>