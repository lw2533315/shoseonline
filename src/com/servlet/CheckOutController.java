package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Item;
import beans.Product;

@WebServlet("/checkout")
public class CheckOutController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		LocalDate ld = LocalDate.now();
		LocalTime lt = LocalTime.now();
		String time = ld +" "+ lt.toString().substring(0,lt.toString().length() - 4);
		System.out.println("lt is " +ld +" "+ lt.toString().substring(0,lt.toString().length() - 4));
		HttpSession session = req.getSession(false);
		List<Item> items = new ArrayList<>();
		if(session.getAttribute("id") == null) {
			out.println("you haven't login plz login first");
			RequestDispatcher rd = req.getRequestDispatcher("/login");
			rd.include(req, resp);
		}
		int id = (Integer)session.getAttribute("id");
		if(session.getAttribute("items") == null) {
			items = DoDAO.getItemInfo();
		}else {
			items = (List<Item>)session.getAttribute("items");
		}
		List<Product> cart = new ArrayList<>();
		cart = DoDAO.getCart(id);
		
		//check the submit from cart is out of the stock quantiti
		for(Product pd : cart) {
			for(Item it: items) {
				if(pd.getItem_id().equals(it.getItem_id())) {
					if(pd.getQuantity()>it.getCapacity()) {
						RequestDispatcher rd = req.getRequestDispatcher("cart.jsp");
						req.setAttribute("outstockname", it.getItem_name());
						rd.forward(req, resp);
					}
				}
			}
		}
		
		
		
		
		req.setAttribute("date", time);
		String subtotal = req.getParameter("subtotal");
		String mailfee = req.getParameter("mailfee");
		int fee = Integer.parseInt(mailfee);
		double totalfee = Double.parseDouble(subtotal);
		System.out.println(subtotal);
		System.out.println(mailfee);
		req.setAttribute("cart", cart);
		req.setAttribute("subtotal", totalfee);
		req.setAttribute("mailfee", fee);
		System.out.println("time: "+time + " id: "+id);
		int order_id = DoDAO.insertHistory(items, cart, time, id);
		System.out.println("order is " + order_id);
		req.setAttribute("order_id", order_id);
		RequestDispatcher rd = req.getRequestDispatcher("/confirmation.jsp");
		rd.include(req, resp);   //include will do the followed code
		
		DoDAO.deleteDB("cart", id);
		
	}
	
}
