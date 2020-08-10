package com.moon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moon.dao.BoardListDAO;
import com.moon.dto.BoardMemberVO;


@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		RequestDispatcher dispatcher = request.getRequestDispatcher("join.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		String username = request.getParameter("username");
		String userphone = request.getParameter("userphone");
		
		BoardMemberVO mVo = new BoardMemberVO();
		mVo.setId(userid);
		mVo.setPw(userpw);
		mVo.setName(username);
		mVo.setPhonenum(userphone);
		
		System.out.println(userid);
		System.out.println(userpw);
		System.out.println(username);
		System.out.println(userphone);
		
		// id중복확인
		BoardListDAO bDao = BoardListDAO.getInstance();
		int checkDuplId = bDao.checkDupleMember(userid);
		
		if(checkDuplId == 0) {
			bDao.insertMember(mVo);
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp?ms=newMember");
			dispatcher.forward(request, response);
		}
		else {
			// 중복됨
			System.out.println("===================== 중복됨 ======================");
			request.setAttribute("member", mVo);
			RequestDispatcher dispatcher = request.getRequestDispatcher("join.jsp?ms=dupl");
			dispatcher.forward(request, response);
		}
	}

}
