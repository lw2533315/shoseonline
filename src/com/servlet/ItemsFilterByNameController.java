package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Item;

@WebServlet("/filtername")
public class ItemsFilterByNameController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("html/text");
		PrintWriter out = resp.getWriter();
		
		String inputName = "";
		List<Item> items = new ArrayList<Item>();
		inputName = req.getParameter("inputName");
	
		HttpSession session = req.getSession(false);
	    if(session == null) {
	    	System.out.println("sessin is null");
	    	 session = req.getSession();  
	    }
	    if(session.getAttribute("items") == null) {
	    	items = DoDAO.getItemInfo();
	    }else {
	    	items = (List<Item>)session.getAttribute("items");
	    }
	    
		  //same name maybe different color(but id will match only one color) so need filter from all item, after that find number of name
	    Map<String, Item> filter = new HashMap<>();  //save all filter item (possible with same id with different color
	    StringBuilder sb = new StringBuilder();
	    
		
		
	   // find name-item pairs by vague string
	    if(inputName.length() != 0) {
	    	for(Item it :  items) {
	    		if(it.getItem_name().indexOf(inputName) != -1) {
	    			filter.put(it.getItem_name(), it);
	    		}
	    	}
		    for(Map.Entry<String, Item> m: filter.entrySet()) {
		    	sb.append("-");
		    	sb.append(m.getValue().getItem_name());
		    	sb.append(",");
		    	sb.append(m.getValue().getPic_location());
		    	sb.append(",");
		    	sb.append(m.getValue().getPrice()+"");
		    }
	    
	    }


	    resp.getWriter().write(sb.toString());
	  
//	    RequestDispatcher rd = req.getRequestDispatcher("")
	    
	}

}
