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


@WebServlet("/login.do")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public loginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("inputLoginId");
		String pw = request.getParameter("inputLoginPw");
		
		BoardMemberVO mVo = new BoardMemberVO();
		mVo.setId(id);
		mVo.setPw(pw);
		
		// id가 있는지 체크
		BoardListDAO bDao = BoardListDAO.getInstance();
		int existId = bDao.checkExistId(id);
		
		if(existId==0) {
			// 0이면 존재하지 않음
			System.out.println("존재하지 않는 아이디");
			request.setAttribute("result", "가입하지 않은 아이디입니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.do");
			//dispatcher.forward(request, response);
			doGet(request, response);
		}else {
			// 1이면 id가 존재 -> pw체크
			int result = bDao.checkLogin(id, pw);
			if(result==0) {
				// 로그인 실패
				System.out.println("잘못된 비밀번호");
				request.setAttribute("result", "잘못된 비밀번호입니다.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.do");
				doGet(request, response);
			}else {
				// 로그인 성공
				System.out.println("로그인 성공");
				System.out.println(id);
				request.setAttribute("loginID", id);
				request.setAttribute("loginPW", pw);
				RequestDispatcher dispatcher = request.getRequestDispatcher("session.jsp");
				dispatcher.forward(request, response);
			}
			
		}
		
		
		
		
		
		
		/*
		System.out.println(id+" / "+pw);
		// pw 체크
		
		// pw가 일치하면 1 다르면 0
		int result = bDao.checkLogin(id, pw);
		System.out.println(result);
		*/
		
		
		
		
		
		/*
		if(result == 1) {
			
		}else {
			// result에 fail을 보낸다?
			request.setAttribute("result", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
		}
		*/
	}

}
