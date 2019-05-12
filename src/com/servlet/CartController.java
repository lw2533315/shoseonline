package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.beans.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.xml.internal.bind.v2.model.core.ID;

import beans.Item;
import beans.Product;
@WebServlet("/cart")
//jump to cart.jsp
public class CartController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
		List<Product> cart = new ArrayList<>();
		HttpSession session = req.getSession(false);
		if(session == null) {
			System.out.println("~~~~~~~~~~~~");
			
		}
		List<Item>items = DoDAO.getItemInfo(); 
		if(session.getAttribute("items") == null) {
			session.setAttribute("items", items);
		}
		int customer_id = 0; 
		if (session.getAttribute("id") != null) {     //if has login set cart to session
			customer_id = (Integer)session.getAttribute("id");
			cart = DoDAO.getCart(customer_id);
			session.setAttribute("cart", cart);
			RequestDispatcher rd = req.getRequestDispatcher("/cart.jsp");
			rd.forward(req,	resp);

		}
		
		else  {
			RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
			rd.forward(req,	resp);
		}
		
					
	}
	
}
