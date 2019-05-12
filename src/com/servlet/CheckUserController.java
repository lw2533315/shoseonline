package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/user_check")

//check the user and passwor  match to home, else to lgoin
public class CheckUserController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			resp.setContentType("text/html");
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			int id = DoDAO.testCustomerValidate(username, password);
//			System.err.println(flag);
			if (id != 0) {
				HttpSession session = req.getSession();
				session.setAttribute("username", username);
				session.setAttribute("id", id);
				resp.getWriter().write("1");
			}else {
				resp.getWriter().write("0");
			}
			
	}
	
}
