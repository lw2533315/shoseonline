package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/checkname")
public class CheckUsernameController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username = req.getParameter("username");
		if(username != null) {
			int flag = DoDAO.checkUsername(username);//find duplicate return true
			if(flag == 1) {
				System.out.println(flag);
				resp.getWriter().write("1");
			}else {
				System.out.println(flag);
				resp.getWriter().write("0");
			}
			
		}
		
	}

}
