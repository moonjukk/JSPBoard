package com.moon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moon.dao.BoardListDAO;
import com.moon.dto.BoardApplyVO;


@WebServlet("/apply.do")
public class BoardApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardApplyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        
        System.out.println("test text");
        
		RequestDispatcher dispatcher = request.getRequestDispatcher("sessionBoardApply.jsp?");
		dispatcher.forward(request, response);
		
		//response.sendRedirect("boardList.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String title = request.getParameter("title");
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String content = request.getParameter("content");
        
        // DB저장 작업, vo만들어야함
        BoardApplyVO aVo = new BoardApplyVO();
        aVo.setTitle(title);
        aVo.setId(id);
        aVo.setEmail(email);
        aVo.setContent(content);
        aVo.setFlag(0); // 0:대기상태 1:처리상태 2:반려상태
        
        BoardListDAO bDao = BoardListDAO.getInstance();
		bDao.insertBoardApply(aVo);
		System.out.println("insertBoardApply 성공");
		
        RequestDispatcher dispatcher = request.getRequestDispatcher("applySuccess.jsp?");
		dispatcher.forward(request, response);
	}

}
