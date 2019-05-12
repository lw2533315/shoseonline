package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Item;
@WebServlet("/findcolor")
public class FindSizeController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String color = req.getParameter("color").trim();
		
		System.out.println("color is ~~~~~~~~~~~" + color);
		HttpSession session = req.getSession(false);
		List<Item> items = (List<Item>)session.getAttribute("detail");
		String colorstr = "";
		int index = 0;
		for(Item it: items) {
			System.out.println("color is "+it.getColor());
			if(it.getColor().trim().equals(color) ){
				colorstr += it.getSize();
				colorstr += " ";
//				System.out.println("find the same size @@@@@@@@@@@@2"); 
				
			}
		}
		resp.getWriter().write(colorstr);;  //return value to jquery ajax
		
		
	}
}
