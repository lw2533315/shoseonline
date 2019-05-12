package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;

import beans.Item;
@WebServlet("/addtocart")
public class CartAdd extends HttpServlet{
	//if has login just add item to cart, otherwise to login 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	     //receive value from product.js
		 String color = req.getParameter("color");
		 String size = req.getParameter("size");
		 int quantity = Integer.parseInt(req.getParameter("quantity"));
		 String go = req.getParameter("go");
		 resp.setContentType("text/html");
		 PrintWriter out=resp.getWriter();
		int  id = 0;
		 HttpSession session = req.getSession(false);
		 if(session == null) {
			 System.out.println("session is null");
			 session = req.getSession();
		 }
		 
		 
		 
		 if (session.getAttribute("id") == null) {
			 out.println("please login first");
			 RequestDispatcher rd = req.getRequestDispatcher("/login");
			 rd.include(req, resp);
		 }
		 id = (Integer)session.getAttribute("id");
		 List<Item>items = new ArrayList<>(); 
		 items = (List<Item>)session.getAttribute("detail");
		 for(Item it: items) {
//			 out.println("-" +color + "-" +size +"-" + quantity);
//			 out.println("+"+it.getColor()+"+"+it.getSize()+"+"+it.getCapacity());
			 if(it.getColor().equals(color) && it.getSize().equals(size) ){
				 out.println("id-"+ id + "-" + it.getItem_id()+"-"+quantity);
				 DoDAO.insert_cart(id, it.getItem_id(), quantity);
				 break;
			 }
		 }
		 if(go.equals("go")) {
			 RequestDispatcher rd = req.getRequestDispatcher("/cart");
			 rd.forward(req, resp);
		 }else {
			 RequestDispatcher rd = req.getRequestDispatcher("/category");
			 rd.forward(req, resp);
		 }
		 
	}
	
}
