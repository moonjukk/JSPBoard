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
import com.moon.dto.BoardCommentVO;
import com.moon.dto.BoardListVO;

@WebServlet("/applyTableSave.do")
public class BoardApplyTableSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardApplyTableSaveServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
		
		String title = request.getParameter("query");
		BoardListDAO bDao = BoardListDAO.getInstance();
		bDao.insertManageBoard(title);
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("applySaveSuccess.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
