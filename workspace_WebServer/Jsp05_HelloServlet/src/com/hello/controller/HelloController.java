package com.hello.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HelloController")
public class HelloController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public HelloController() {
       System.out.println("servlet 생성자!");
    }

    @Override
    public void init(ServletConfig config) throws ServletException{
       System.out.println("servlet init()!!");
       System.out.println("context param: "+
             config.getServletContext().getInitParameter("url"));
       System.out.println("init param: " + config.getInitParameter("driver"));
       
    }
    
    //get방식으로 요청이 전송되어 올 경우
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("get방식!!!!");
      
      doPost(request, response);
   }

   //post방식으로 요청이 전송되어 올 경우
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("post방식!!!!!!");
      
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      
      String command = request.getParameter("command");
      System.out.println("parameter: "+command);
      
      PrintWriter out = response.getWriter();
      out.print("<h1 style='background-color : skyblue;'>helloServlet</h1> ");
      out.print("<h2>servlet 라이프사이클, url mapping</h2>");
      out.print("<a href='home.html'>돌아가기</a>");
      
   }
   

   @Override
   public void destroy() {
      System.out.println("servlet detroy()!!!");
   }
}