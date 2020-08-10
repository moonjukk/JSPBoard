<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)request.getAttribute("loginID");
	String pw = (String)request.getAttribute("loginPW");

	session.setAttribute("loginUser",id);
	session.setAttribute("loginUserPW",pw);
	
	session.setMaxInactiveInterval(60*60);
	
	response.sendRedirect("main.do");
%>