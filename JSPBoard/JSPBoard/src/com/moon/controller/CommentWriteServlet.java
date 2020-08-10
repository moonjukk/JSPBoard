package com.moon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moon.dao.BoardListDAO;
import com.moon.dto.BoardCommentVO;

@WebServlet("/CommentWrite.do")
public class CommentWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CommentWriteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String pNum = request.getParameter("pNum");
		String cID = request.getParameter("inputCommentId");
		String cPW = request.getParameter("inputCommentPw");
		String cContent = request.getParameter("inputCommentContent");
		
		BoardCommentVO cVo = new BoardCommentVO();
		cVo.setPboard(Integer.parseInt(pNum));
		cVo.setCid(cID);
		cVo.setCpw(cPW);
		cVo.setComments(cContent);
		
		BoardListDAO bDao = BoardListDAO.getInstance();
		bDao.insertComment(cVo);
		
		String pid = request.getParameter("hiddenId");
		
		response.sendRedirect("BoardRead.do?id="+pid+"&num="+pNum);
	}

}
