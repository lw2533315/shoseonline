package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import beans.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/detail")
public class DetailController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
		String item_name = req.getParameter("name");
		System.out.println("name is " + item_name + "~~~~~~~~~~~~~~~~~~~~~~~~");
		HttpSession session = req.getSession(false);
		List <Item> items = null;
		if(session == null) {
			System.out.println("session is null");
			session = req.getSession();
		}
		if(session.getAttribute("items") == null) {
			items = DoDAO.getItemInfo();
		}else {
			items = (List<Item>)session.getAttribute("items");
		}
		List<Item> items_detail = items.stream().filter(e -> e.getItem_name().equals(item_name)).collect(Collectors.toList());  //only the same name items
		System.out.println("size of the shoose " + items_detail.size());
		session.setAttribute("detail", items_detail);
		RequestDispatcher rd = req.getRequestDispatcher("/product.jsp");
		rd.forward(req, resp);
		
	}

}
