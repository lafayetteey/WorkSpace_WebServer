package com.scope.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ScopeController")
public class ScopeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ScopeController() {
        super();
     
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				
				System.out.println("[ controller ]");
				
				String reqVal = (String) request.getAttribute("reqId");
				HttpSession session = request.getSession();
				
				String sessionVal = (String)session.getAttribute("sessionId");
				
				ServletContext application = getServletContext();
				String appVal = (String)application.getAttribute("appId");
				
				System.out.println("request : " + reqVal);
				System.out.println("session : " + sessionVal);
				System.out.println("application : " + appVal);
				
				
			
				//request.setAttribute("reqId", "reqId in servlet");
				
				//result.jsp 페이지에서dispatch값을 사용하겟다라는 뜻
				//RequestDispatcher dispatch = request.getRequestDispatcher("result.jsp");
				//dispatch.forward(request, response);
				
				PrintWriter out =response.getWriter();
				String resultHtml = "<h1>응답</h1>" + "<table border=1>" +"<tr><th>request</th><td>" + reqVal + "</td></tr>"
						+"<tr><th>session</th><td>" +  sessionVal + "</td></tr>" +"<tr><th>application</th><td>" + appVal + "</td></tr></table>";
				
				out.print(resultHtml);
				
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				doGet(request, response);
	}

}
