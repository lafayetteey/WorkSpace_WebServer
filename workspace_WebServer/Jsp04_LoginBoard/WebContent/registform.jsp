<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8") ;%>
    <%response.setContentType("text/html; charset=UTF-8"); %>
    
    <%@ page import="com.login.dto.MyMemberDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function idChkConfirm() {
		var chk = document.getElementsByName("myid")[0].title;
		
		if(chk == "n" ) {
			alert("ID 중복체크를 해 주세요 ");
			document.getElementsByName("myid")[0].focus();
		}
		
	}
	function idChk() {
		var id = document.getElementsByName("myid")[0];
		
		if(id.value.trim() == "" || id.value == null ){
			 alert("ID를 입력해주세요");
		}else {
			var target = "logincontroller.jsp?command=idchk&id="+id.value.trim();
			open(target , "" , "width=200 , height=200");
		}
	}

</script>
</head>
<body>
	<h1>회 원 가 입</h1>
	<form action="logincontroller.jsp" method="post">
		<input type="hidden" name="common" value="insertuser">
		<table border="1">
			<tr>	
				<th>ID</th>
				<td>
					<input type="text" name="myid" title="n" required="required">
					<input type="button" value="중복체크" onclick="idChk();">	
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="mypw"  required="required" onclick="idChkConfirm();">
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="myname"  required="required" onclick="idChkConfirm();">
			</tr>
			<tr>
				<th>ADDR</th>
				<td><input type="text" name="myaddr"  required="required" onclick="idChkConfirm();">
			</tr>
			<tr>
				<th>PHONE</th>
				<td><input type="text" name="myphone"  required="required" onclick="idChkConfirm();">
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="text" name="myemail"  required="required" onclick="idChkConfirm();">
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="가입">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>