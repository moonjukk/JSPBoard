package com.moon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moon.dao.BoardListDAO;
import com.moon.dto.BoardListVO;

@WebServlet("/BoardUpdate.do")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String num = request.getParameter("num");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println(num+"/"+title+"/"+content);
		
		BoardListVO bVo = new BoardListVO();
		bVo.setNum(Integer.parseInt(num));
		bVo.setTitle(title);
		bVo.setContent(content);
		
		BoardListDAO bDao = BoardListDAO.getInstance();
		bDao.updateBoardList(bVo);
		
		String pid = request.getParameter("hiddenId");
		
		response.sendRedirect("BoardRead.do?id="+pid+"&num="+num);
	}

}
