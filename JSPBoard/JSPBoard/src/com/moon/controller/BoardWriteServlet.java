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

@WebServlet("/BoardWrite.do")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardWriteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
		
		String title = request.getParameter("title");
		String id = request.getParameter("id");
		RequestDispatcher dispatcher = request.getRequestDispatcher("BoardWrite.jsp?title="+title+"&id="+id);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String boardID = request.getParameter("id");
		String title = request.getParameter("writeTitle");
		String id = request.getParameter("writerId");
		String password = request.getParameter("password");
		String content = request.getParameter("content");
		
		System.out.println(boardID);
		System.out.println(title);
		System.out.println(id);
		System.out.println(password);
		System.out.println(content);
		
		BoardListVO bVo = new BoardListVO();
		bVo.setTableid(Integer.parseInt(boardID));
		bVo.setTitle(title);
		bVo.setId(id);
		bVo.setPassword(password);
		bVo.setContent(content);
		
		BoardListDAO bDao = BoardListDAO.getInstance();
		bDao.insertBoardList(bVo);

		
		RequestDispatcher dispatcher = request.getRequestDispatcher("list.do?id="+boardID);
		dispatcher.forward(request, response);	
		/*
		GoodsVO mVo = new GoodsVO();
		mVo.setName(name);
		mVo.setPrice(Integer.parseInt(price));
		mVo.setDescription(description);
					
		GoodsDAO mDao = GoodsDAO.getInstance();
		int result = mDao.inputGoods(mVo);
		
		if (result == 1) {
			request.setAttribute("message", "정보저장 성공했습니다.");
		} else {
			request.setAttribute("message", "정보저장 실패했습니다.");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("result.do");
		dispatcher.forward(request, response);	
		*/
	}

}
