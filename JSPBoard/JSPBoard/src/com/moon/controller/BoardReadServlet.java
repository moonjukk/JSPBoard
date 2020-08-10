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

@WebServlet("/BoardRead.do")
public class BoardReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardReadServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
		
		String num = request.getParameter("num");
		BoardListDAO bDao = BoardListDAO.getInstance();
		BoardListVO bVo = bDao.selectOneBoardList(Integer.parseInt(num));
		request.setAttribute("board", bVo);
		String tableId = bDao.getTableId(Integer.parseInt(num));
		String whatTable = bDao.getTableTitle(Integer.parseInt(tableId));
		System.out.println(whatTable);
		request.setAttribute("tableTitle", whatTable);
		
		List<BoardCommentVO> commentList = bDao.getCommentByPid(Integer.parseInt(num));
		request.setAttribute("commentList", commentList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("BoardRead.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
