package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.*;

@WebServlet("/save_customer")
public class SaveCustomerController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String bio = "" ;
		//do not type context in info here will be null
		if(req.getParameter("info") == null)
			bio = "";
		
		
		
		Customer customer = new Customer(req.getParameter("firstname"),
				req.getParameter("lastname"), req.getParameter("username"),
				req.getParameter("email"), req.getParameter("password"), bio, "");
		DoDAO.save_customer(customer);
		RequestDispatcher rd = req.getRequestDispatcher("/home");
		rd.forward(req, resp);

	}

}
