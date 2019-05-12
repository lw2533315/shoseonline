package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.NonWritableChannelException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Param;

import beans.Item;

@WebServlet("/cartamend")
public class CartAmend  extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("html/text");
		PrintWriter out = resp.getWriter();
		String item_id = req.getParameter("id");
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		int customer_id=Integer.parseInt(req.getParameter("customer_id"));
		HttpSession session = req.getSession(false);
		List<Item> items = new ArrayList<Item>();
		if(session.getAttribute("items") == null) {
			items = DoDAO.getItemInfo();
		}else {
			items = (List<Item>)session.getAttribute("items");
		}
		int stock_quantity = 0;
		
		for(Item it: items) {
			if (it.getItem_id().equals(item_id)) {
				stock_quantity = it.getCapacity();
				break;
			}
		}
		String back = stock_quantity+"";
		if (quantity <= stock_quantity) {
			System.out.println("call dadao");
			DoDAO.update_cart(quantity, item_id, customer_id);
			back += "-";
			back+=1;       //has updata db, the number of cart is valid
		}else {
			back += "-";
			back+=0;    
		}
	
		
		resp.getWriter().write(back);
		
	}
}
