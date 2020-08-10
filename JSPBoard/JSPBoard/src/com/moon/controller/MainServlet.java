package com.moon.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moon.dao.BoardListDAO;
import com.moon.dto.BoardListVO;
import com.moon.dto.BoardMemberVO;


@WebServlet("/main.do")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		BoardListDAO bDao = BoardListDAO.getInstance();
		String tableStr = bDao.getBoardList();
		System.out.println("str test : "+tableStr);
		request.setAttribute("tableList", tableStr);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("login");
		System.out.println(id);
		if( id == null || id.equals("") || id.equals("null") ){
		    id="";
			request.setAttribute("login", id);
		}else {
			request.setAttribute("login", id);
		}
		
		BoardListDAO bDao = BoardListDAO.getInstance();
		String tableStr = bDao.getBoardList();
		System.out.println("str test : "+tableStr);
		request.setAttribute("tableList", tableStr);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
		dispatcher.forward(request, response);
	}

}
