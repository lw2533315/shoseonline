package com.servlet;

import java.io.IOException;
import java.util.List;
import java.beans.*;
import org.apache.naming.java.javaURLContextFactory;

import beans.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/findcapacity")
public class FindQuantityController extends HttpServlet {
	//implement ajax update quantity for the item' s size
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String size = req.getParameter("size").trim();
		String color = req.getParameter("color").trim(); 
		System.out.println("color is ~~~~~~~~~~~" + color);
		System.out.println("size is ~~~~~~~~~~~" + size);
		HttpSession session = req.getSession(false);
		List<Item> items = (List<Item>)session.getAttribute("detail");
		
		for(Item it: items) {
			System.out.println("-size is "+it.getSize());
			if(it.getSize().trim().equals(size) && it.getColor().equals(color) ){
				System.out.println("find the same size @@@@@@@@@@@@2"); 
				resp.getWriter().write((it.getCapacity()));  //return value to jquery ajax
				break;
			}
		}
		
	}

}
