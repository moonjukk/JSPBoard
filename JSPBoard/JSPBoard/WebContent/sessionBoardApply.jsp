<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginID = (String)session.getAttribute("loginUser");
	
	if(loginID.equals("admin")){
		RequestDispatcher dispatcher = request.getRequestDispatcher("apply_admin.do");
		dispatcher.forward(request, response);
	}else if(loginID.equals("")){
		response.sendRedirect("main.do");
	}else{
		RequestDispatcher dispatcher = request.getRequestDispatcher("apply.jsp");
		dispatcher.forward(request, response);
	}
%>