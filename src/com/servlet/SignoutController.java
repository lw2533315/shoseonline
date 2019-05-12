package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

@WebServlet("/signout")
public class SignoutController extends HttpServlet  {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		System.out.println("test");
		session.removeAttribute("id");
		session.removeAttribute("username");
		session.invalidate();  //remove all data from session
		RequestDispatcher rd = req.getRequestDispatcher("/home");
		rd.forward(req, resp);
	}
	
}
