package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;


import beans.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

@WebServlet("/itemfilter")
public class ItemsFilterController extends HttpServlet {

	@Override
	protected synchronized void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

					
			resp.setContentType("text/html");
			String brand = "";
			String gender = "";
			String color = "";
			
			
			
			
			 brand = req.getParameter("brand");
			 gender = req.getParameter("gender");
			 color = req.getParameter("color");
			System.out.println(brand + gender + color + "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			System.out.println("brand: " + brand + "-gender: "+ gender +"-color: " + color);
			
			
	    HttpSession session = req.getSession(false);
	    List<Item> items = null;
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
	    
	    

	    
	    
	   
	    Set<String> nameSet = new HashSet<String>();  //the para cannot be Item, otherwise same name maybe appear two times
	   
	    for(Item it : items) {
	    	if(!gender.equals("none")) {//y
	    		if(!color.equals("none")) {//y,y
	    			if(!brand.equals("none")) { //y,y,y
	    				if(it.getColor().equals(color) && it.getBrand().equals(brand) && it.getGender() == Integer.parseInt(gender)) {
	    					nameSet.add(it.getItem_name());
	    	    			filter.put(it.getItem_name(), it);
	    				}
	    			}
	    			else {//y,y,n
	    					if(it.getColor().equals(color) &&  it.getGender() == Integer.parseInt(gender)) {
	    						nameSet.add(it.getItem_name());
		    	    			filter.put(it.getItem_name(), it);
	    				}
	    			}
	    		}else {//y,n,?
    				if(!brand.equals("none")) { //y,n,y
    					if( it.getBrand().equals(brand) && it.getGender() == Integer.parseInt(gender)) {
	    					nameSet.add(it.getItem_name());
	    	    			filter.put(it.getItem_name(), it);
	    				}
	    			}else {//y,n,n
	    				if(it.getGender() == Integer.parseInt(gender)) {
	    					nameSet.add(it.getItem_name());
	    	    			filter.put(it.getItem_name(), it);
	    				}
	    				
	    				
	    			}
	    		}
	    	}else {//n,?,?
	    		if(!color.equals("none")) {//n,y
	    			if(!brand.equals("none")) {//n,y,y
	    				if(it.getColor().equals(color) && it.getBrand().equals(brand) ) {
	    					nameSet.add(it.getItem_name());
	    	    			filter.put(it.getItem_name(), it);
	    				
	    				}
	    			}else {//n,y,n
	    				if(it.getColor().equals(color)) {
	    					nameSet.add(it.getItem_name());
	    	    			filter.put(it.getItem_name(), it);
	    				}
	    			}
	    				
	    			
	    		}else {//n,n,
	    			if(!brand.equals("none")) {//nny
	    				if(it.getBrand().equals(brand)) {//n,n,y
			    			nameSet.add(it.getItem_name());
			    			filter.put(it.getItem_name(), it);
	    				}
	    			}else {//n,n,n
		    			nameSet.add(it.getItem_name());
		    			filter.put(it.getItem_name(), it);
		    		}
	    		}
		    		
		    		
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
	    
	    

	    System.out.println(sb.toString());
	    resp.getWriter().write(sb.toString());
	    System.out.println("after back");
			
			
	}

}
