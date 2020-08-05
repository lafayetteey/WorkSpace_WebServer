<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
    
   <%@ page import="com.mvc.dao.MVCBoardDao" %>
   <%@ page import="com.mvc.dto.MVCBoardDto" %>
   <%@ page import="java.util.List" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	//index - >mycontroller -> selectAll -> dao - > boardlist.jsp(삭제 /글쓰기) no write title date ->
	//boarddetail(no , writer , date , title , content ) 수정,삭제,목록  selectOne - > 글쓰기버튼 boardinsertform -> (response)boardinsert (form) 등록 , 취소writer , title , content)
	// --> boarddetail 에서 수정버튼 boardupdateform -> seq 받고request로 boardupdate.jsp 로 넘기기 --> boarddetail 에서 delete
	
			String command = request.getParameter("command");
			System.out.println("[command : " + command + "]");
	
			MVCBoardDao dao = new MVCBoardDao();
		
			if(command.equals("boardList") ){
				List<MVCBoardDto> list = dao.selectAll();
				
				request.setAttribute("dto", list);
				pageContext.forward("boardlist.jsp");
				
		} else if(command.equals("boarddetail") ){
			int seq = Integer.parseInt(request.getParameter("seq") );
			
			MVCBoardDto dto = dao.selectOne(seq);
			
			request.setAttribute("dto", dto);
			pageContext.forward("boarddetail.jsp");
			
		} else if(command.equals("boardwrite") ){
		
			response.sendRedirect("boardwrite.jsp");
			
		} else if(command.equals("insertuser") ) {
			String writer = request.getParameter("writer");
			String title =  request.getParameter("title");
			String content = request.getParameter("content");
			
			MVCBoardDto dto = new MVCBoardDto(writer , title , content);
			int res = dao.insertUser(dto);
			
			if(res > 0) {
%>
	<script type="text/javascript">
		alert("게시글 작성이 완료 되었습니다");
		location.href="mycontroller.jsp?command=boardList";
	
	</script>
<%				
			} else {
%>
	<script type="text/javascript">
		alert("게시글 작성 실패");
		location.href="mycontroller.jsp?command=boardwrite";
	
	</script>
<%		
			}
		} else if(command.equals("boardupdateform") ) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			MVCBoardDto dto = dao.selectOne(seq);
			
			request.setAttribute("dto", dto);
			pageContext.forward("boardupdate.jsp");	
			
		} else if (command.equals("boardupdate") ){
			int seq = Integer.parseInt(request.getParameter("seq"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			MVCBoardDto dto = new MVCBoardDto(seq , title , content);
			int res = dao.update(dto);
			
			if(res > 0) {
%>
	<script type="text/javascript">
		alert("게시글 수정 완료");
		location.href="mycontroller.jsp?command=boardList";
	</script>
<%				
			} else {
%>
	<script type="text/javascript">
		alert("게시글 수정 실패");
		location.href="mycontroller.jsp?command=boardupdate&seq="+seq;
	</script>
<% 				
			}
		} else if(command.equals("boarddelete") ) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			
			int res = dao.delete(seq);
			
			if(res > 0) {
%>
	<script type="text/javascript">
		alert("게시글 삭제 성공");
		location.href="mycontroller.jsp?command=boardList";
	</script>
<% 			
			} else {
%>
	<script type="text/javascript">
		alert("게시글 삭제 실패");
		location.href="mycontroller.jsp?boarddetail.jsp?command=boarddetail&seq="+seq;
	</script>
<%			
			}
			
		} else if(command.equals("muldel") ){
			String[] seq = request.getParameterValues("chk");
			
			if( seq == null || seq.length == 0) {
%>
	<script type="text/javascript">
		alert("한개 이상 선택 해 주세요");
		location.href="mycontroller.jsp?command=boardList";
	</script>
<% 
			} else {
				int res = dao.multiDelete(seq); 
				
					if(res > 0) {
%>
	<script type="text/javascript">
		alert("체크하신 항목이 모두 삭제 되었습니다.");
		location.href="mycontroller.jsp?command=boardList";
	</script>
<% 					
				} else {
%>
	<script type="text/javascript">
		alert("체크하신 항목 삭제 실패.");
		location.href="mycontroller.jsp?command=boardList";
	</script>
<%				
				}
			}
		}
			
		
%>
	

</body>
</html>