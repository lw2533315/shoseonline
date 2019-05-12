package com.servlet;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Item;

@WebServlet("/autocomplete")
public class AutoCompleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Item> items = DoDAO.getItemInfo();
		Set<String> name = new HashSet<String>();
		for(Item it: items) {
			name.add(it.getItem_name());
		}
		StringBuilder sb = new StringBuilder();
		sb.append("-");
		for(String it: name) {
			sb.append(it);
			sb.append("-");
		}
		
		resp.getWriter().write(sb.toString());
	}
	
}
