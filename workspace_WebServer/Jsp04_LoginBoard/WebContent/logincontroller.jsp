<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.login.dao.MyMemberDao"%>
<%@ page import="com.login.dto.MyMemberDto"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String command = request.getParameter("command");
		System.out.println("[command :" + command+ " ]");
		
		MyMemberDao dao = new MyMemberDao();
		
		if(command.equals("login") ) {
		
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			MyMemberDto dto = dao.login(id , pw );
			
			
			//DB에 등록된 아이디와 패스워드가 맞을경우 리턴값이 있음
			if(dto.getMyid() != null) {
			
				session.setAttribute("dto", dto);
				session.setMaxInactiveInterval(60*60);
			
					if(dto.getMyrole().equals("ADMIN") ) {
						response.sendRedirect("adminmain.jsp");
				
					} else if(dto.getMyrole().equals("USER" ) ) {
						response.sendRedirect("usermain.jsp");
				}
			} else {
%>
	<script type="text/javascript">
		alert("로그인 실패");
		location.href="index.jsp";
	</script>
<% 			
			}
			
		} else if(command.equals("logout") ) {
			//invalidate() : session 값을 초기화 시킴
 			session.invalidate();
			response.sendRedirect("index.jsp");
		
		} else if(command.equals("userlistall") ){
			List<MyMemberDto> dto = dao.selectAll();
			
			request.setAttribute("dto", dto);
			pageContext.forward("userlistall.jsp");
			
			
		} else if(command.equals("userlistenabled") ) {
			List<MyMemberDto> dto = dao.selectEnabled();
			
			request.setAttribute("dto", dto);
			pageContext.forward("userlistenabled.jsp");
			
		} else if(command.equals("updateroleform") ) {
			
			int myno = Integer.parseInt(request.getParameter("myno"));
			
			MyMemberDto dto = dao.selectOne(myno);
			
			request.setAttribute("dto", dto);
			pageContext.forward("updateroleform.jsp");
			
		} else if(command.equals("updaterole") ) {
			
			int myno = Integer.parseInt(request.getParameter("myno"));
			String myrole = request.getParameter("myrole");
			
			int res = dao.updateRole(myno , myrole);
			
			if(res > 0) {
%>
	<script type="text/javascript">
		alert("회원 등급 업데이트 완료");
		location.href="logincontroller.jsp?command=userlistenabled";
	
	</script>
<%		
			} else {
%>
	<script type="text/javascript">
		alret("회원 등급 업데이트 실패");
		location.href="logincontroller.jsp?command=userupdateform&myno="+myno;
	</script>
<%				
			}
		} else if(command.equals("registform") ){
			response.sendRedirect("registform.jsp");
			
		} else if(command.equals("idchk") ) {
			String myid = request.getParameter("id");
			
			String res = dao.idChk(myid);
			
			boolean idnotused = true;
			
			//ID 가 중복되었다면 res 에 값이 들어있음 //없을 경우 null 리턴
			if(res != null ) {
				idnotused = false;
			}
			response.sendRedirect("idchk.jsp?idnotused="+idnotused);	
			
		} else if(command.equals("insertuser") ) {
			String myid = request.getParameter("myid");
			String mypw = request.getParameter("mypw");
			String myname = request.getParameter("myname");
			String myaddr = request.getParameter("myaddr");
			String myphone = request.getParameter("myphone");
			String myemail = request.getParameter("myemail");
			
			MyMemberDto dto = new MyMemberDto();
			dto.setMyid(myid);
			dto.setMypw(mypw);
			dto.setMyname(myname);
			dto.setMyaddr(myaddr);
			dto.setMyphone(myphone);
			dto.setMyemail(myemail);
			
			int res = dao.insert(dto);
			
			if(res > 0) {
%>
	<script type="text/javascript">
		alert("회원 가입이 완료 되었습니다.");
		location.href="index.jsp";
	</script>
<% 		
			} else {
%>
	<script type="text/javascript">
		alert("회원 가입 실패 ");
		location.href="logincontroller.jsp?command=registform";
	</script>
<% 			
			}
			
		}
		
		
%>
</body>
</html>