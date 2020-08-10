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
import com.moon.dto.BoardApplyVO;
import com.moon.dto.BoardCommentVO;


@WebServlet("/apply_admin.do")
public class BoardApplyAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardApplyAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");

        BoardListDAO bDao = BoardListDAO.getInstance();
        
        if(request.getParameter("message")!=null) {
        	int message = Integer.parseInt(request.getParameter("message"));
        	int num = Integer.parseInt(request.getParameter("num"));
        	BoardApplyVO aVo = new BoardApplyVO();
        	bDao.updateApplyByNum(message, num);
        }
        
        List<BoardApplyVO> applyList0 = bDao.getApplyByFlag(0);
        List<BoardApplyVO> applyList1 = bDao.getApplyByFlag(1);
        List<BoardApplyVO> applyList2 = bDao.getApplyByFlag(2);

        request.setAttribute("applyList0", applyList0);
        request.setAttribute("applyList1", applyList1);
        request.setAttribute("applyList2", applyList2);

		RequestDispatcher dispatcher = request.getRequestDispatcher("applyList.jsp");
		dispatcher.forward(request, response);
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
