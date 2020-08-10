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


@WebServlet("/list.do")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        
		String id = request.getParameter("id");
		int pageno = 1;
		if(request.getParameter("pageno")!=null){
			pageno=Integer.parseInt(request.getParameter("pageno"));
			System.out.println(pageno);
		}
		
		BoardListDAO bDao = BoardListDAO.getInstance();
		
		List<BoardListVO> boardList = bDao.selectAllList(Integer.parseInt(id), pageno);
		request.setAttribute("boardList", boardList);
		
		int recordCount = bDao.selectCountBoard(Integer.parseInt(id));
		request.setAttribute("recordCount", recordCount);
		System.out.println(recordCount);
		
		String tableTitle = bDao.getTableTitle(Integer.parseInt(id));		
		RequestDispatcher dispatcher = request.getRequestDispatcher("boardList.jsp?title="+tableTitle);
		dispatcher.forward(request, response);
		
		//response.sendRedirect("boardList.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
