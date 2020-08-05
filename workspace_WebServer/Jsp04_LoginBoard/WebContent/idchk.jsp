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
<script type="text/javascript">
	onload=function() {
		//registform 에서 입력받은 id 를  현재의 input text	의 value로 지정
		var id = opener.document.getElementsByName("myid")[0].value;
		document.getElementsByName("id")[0].value = id;
	}
	function confirm(bool) {
		if(bool == "true") {
			//true : id 중복이 없는경우 idnotuserd 의 값은 true임
			opener.document.getElementsByName("myid")[0].focus();
			opener.document.getElementsByName("myid")[0].title = "y";
		} else {
			opener.document.getElementsByName("myid")[0].focus();
		}
		self.close();
	}
</script>
</head>
	<%
		String idnotused = request.getParameter("idnotused");
	%>
<body>
	<table border="1">
		<tr>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td><%=idnotused.equals("true")? "아이디 생성 가능" : "중복 아이디 존재" %></td>
		</tr>
		<tr>
			<td><input type="button" value="확인" onclick="confirm('<%=idnotused%>');"></td>
		</tr>
	</table>
</body>
</html>