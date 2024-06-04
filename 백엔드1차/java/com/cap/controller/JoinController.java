package com.cap.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cap.mvc.PrivateDTO;
import com.cap.mvc.PrivateDAO;


@WebServlet("/register.do")
public class JoinController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phoneN = request.getParameter("phoneNumber");
		int grade = Integer.parseInt(request.getParameter("grade"));

		PrivateDTO pDto = new PrivateDTO();
		pDto.setId(id);
		pDto.setPw(pw);
		pDto.setStudent_name(name);
		pDto.setStudent_grade(grade);		
		
		PrivateDAO pDao = new PrivateDAO();	
		boolean insertCheck = pDao.privateInsert(pDto);

	    if(insertCheck){
	    	request.setAttribute("joinResult", insertCheck);
			HttpSession session = request.getSession();
			session.setAttribute("idKey", pDto);
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);

		}else{
	    	request.setAttribute("joinResult", 0);
			RequestDispatcher dispatcher = request.getRequestDispatcher("registerFinish.jsp");
			dispatcher.forward(request, response);
		}
	}

}
