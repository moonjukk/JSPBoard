<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
		session.invalidate();
		
		//쿠키관리
		String url = "";
		try{
			Cookie[] cookies = request.getCookies();
	
			if(cookies!=null){
				for(int i=0; i<cookies.length; i++){
					if(cookies[i].getName().equals("url")){            
						url = cookies[i].getValue();
						cookies[i].setMaxAge(0);
						// 경로 쿠키 제거
						response.addCookie(cookies[i]);
						
						//깨진 특수문자를 decode
						int index = url.indexOf("MyBoard%2F");
						String str = url.substring(index+10);
						str = str.replace("%3F", "?");
						str = str.replace("%3D", "=");
						str = str.replace("%26", "&");
						
						response.sendRedirect(str);
					}
				}
				if(url.equals("")){
					response.sendRedirect("main.do");
				}
			}
			else{
				response.sendRedirect("main.do");
			}
		}catch(Exception e){}
%>