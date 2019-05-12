package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import beans.*;

@WebServlet("/category")
public class CategoryController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
	
		List<Item> items = DoDAO.getItemInfo();
		
		HttpSession session = req.getSession(false);
	    
	    if(session == null) {
	    	System.out.println("sessin is null");
	    	 session = req.getSession(); 
	    }
	   
	    items = DoDAO.getItemInfo();
	    Set<String> nameSet = new HashSet<String>();  //the para cannot be Item, otherwise same name maybe appear two times
	    for(Item it: items) {
	    	nameSet.add(it.getItem_name());
	    	
	    }
	    List<String> items_name = new ArrayList<String>(nameSet);  //just save all name of items in the list
	    
	    
		//find page number and size of total items by name eg same name was consider as same item here
		int size = items_name.size();

		
		
		List<Item>firstPage = new ArrayList<Item>();  //find the names first appear in items class
		for(String name:items_name) {
			for(Item it: items) {
				if (it.getItem_name().equals(name)) {
					firstPage.add(it);
					break;    //same name maby different id
				}
			}
		}
		req.setAttribute("firstPage", firstPage);
		
		int page_num = size/6;
		int temp = size%6 == 0? 0: 1;
		page_num += temp;
		session.setAttribute("page_num", page_num);
		session.setAttribute("items", items);  //all items by id
//		session.setAttribute("page_num", page_num);
		session.setAttribute("name_size", size);
		session.setAttribute("items_name", items_name );  //part of item just by name, same name means same price and same picture
		RequestDispatcher rd = req.getRequestDispatcher("/category.jsp");
		rd.forward(req, resp);
	}

}
