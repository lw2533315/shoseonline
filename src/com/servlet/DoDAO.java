package com.servlet;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import beans.*;
import jdk.nashorn.internal.objects.annotations.Where;

import org.apache.jasper.tagplugins.jstl.core.Catch;
import org.apache.jasper.tagplugins.jstl.core.If;
import org.apache.tomcat.dbcp.dbcp2.PStmtKey;
import org.eclipse.jdt.internal.compiler.apt.dispatch.BatchAnnotationProcessorManager;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.sun.prism.paint.Color;

public class DoDAO {
	public static int checkUsername(String username) {
		Connection conn = ConnMySQL.connectSql();
		if(conn == null) return 1;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int flag = 0;
			try {
				pstmt=conn.prepareStatement("select username from customer");
				rs=pstmt.executeQuery();
				System.out.println(username);
				while(rs.next()) {
					if(rs.getString("username").equals(username)) {
						flag = 1;
					}
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				try {
					rs.close();
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally {
					return flag;
				}
			}
		
	}
	
	public static int checkEmail(String email) {
		Connection conn = ConnMySQL.connectSql();
		if(conn == null) return 1;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
			try {
				pstmt=conn.prepareStatement("select email from customer");
				rs=pstmt.executeQuery();
				while(rs.next()) {
					System.out.println("find info");
					if(rs.getString("email").equals(email)) {
						flag = 1;
					}
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				try {
					rs.close();
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally {
					return flag;
				}
			}
		
	}
	
	public static void deleteDB(String dbname ,  int customer_id) {
		System.out.println(customer_id);
		Connection conn = ConnMySQL.connectSql();
		if(conn == null) return;
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("delete from cart where customer_id = ?  ");
			pstmt.setInt(1, customer_id);
			pstmt.executeUpdate();
			conn.commit();
			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	
	public static int  insertHistory(List<Item> items, List<Product> cart, String date, int customer_id) {
		Connection conn = ConnMySQL.connectSql();
		if(conn == null) return 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmtItem = null;
		ResultSet rs = null;
		int order_id = 0;
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("insert into orders (customer_id, time) values (?,?)");
			pstmt.setInt(1, customer_id);
			pstmt.setString(2, date);
			pstmt.executeUpdate();
			conn.commit();
			
			pstmt = conn.prepareStatement("select order_id from orders where customer_id = ? and time =?");
			pstmt.setInt(1, customer_id);
			pstmt.setString(2, date);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				order_id = rs.getInt("order_id");
			}
			
			
			conn.commit();
			
			
			
			
			pstmt =conn.prepareStatement("insert into history (item_id, price, quantity, purchasing_day, customer_id) values(?,?,?,?,?)");
			pstmtItem = conn.prepareStatement("update item set capacity = ? where item_id = ?");
			
			for(Product p: cart) {
				if(p.getCustomer_id() == customer_id) {  //find the customer's all recorder in cart table
					int quantity = p.getQuantity();
					String item_id = p.getItem_id();
					for(Item it: items) {
						if(it.getItem_id().equals(item_id)) {
							
							double price = it.getPrice();
							pstmt.setString(1, item_id);
							pstmt.setDouble(2, price);
							pstmt.setInt(3, quantity);
							pstmt.setString(4, date);
							pstmt.setInt(5, customer_id);
							pstmt.addBatch();
							
							
							
//							
							pstmtItem.setInt(1, it.getCapacity() - quantity);
							pstmtItem.setString(2, item_id);
							pstmtItem.addBatch();
							break;
							
						}
					}
				}
			}
			
			pstmt.executeBatch();
			pstmtItem.executeBatch();
			conn.commit();
			
			conn.commit();
		}catch(SQLException e) {
			
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally {
			try {
				conn.setAutoCommit(true);
				pstmt.close();
			
				pstmtItem.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				return order_id ;
			}
		}
	}
	public static List<Product> getCart(int customer_id) {
		Connection conn = ConnMySQL.connectSql();
		if(conn == null) return null;
		List<Product> cart = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from cart where customer_id =? ");
			pstmt.setInt(1, customer_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cart.add(new Product(customer_id, rs.getString("item_id"), rs.getInt("quantity")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				return cart;
			}
		}
	}
	
	public static void insert_cart(int customer_id, String item_id, int quantity) {
		Connection conn = ConnMySQL.connectSql();
		if (conn == null) return;
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("insert into cart values(?,?,?)");
			pstmt.setInt(1, customer_id);
			pstmt.setString(2, item_id);
			pstmt.setInt(3, quantity);
			pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}
	
	
	public static void update_cart(int quantity, String item_id, int customer_id) {
		Connection conn = ConnMySQL.connectSql();
		if (conn == null) return;
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false);
			if(quantity == 0) {
				pstmt= conn.prepareStatement("delete from cart where item_id = ? and customer_id=?");
				pstmt.setString(1, item_id);
				pstmt.setInt(2, customer_id);
			
			}else {
			
			
				
				pstmt = conn.prepareStatement("update cart set quantity = ? where item_id = ? and customer_id=?");
				pstmt.setInt(1, quantity);
				pstmt.setString(2, item_id);
				pstmt.setInt(3, customer_id);
				
			}
			pstmt.executeUpdate();
			conn.commit();
			
		} catch (SQLException e) {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}
	
	public static void save_customer(Customer c) {
		Connection conn = ConnMySQL.connectSql();
		if (conn == null) return;
		PreparedStatement pstmt = null;
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("insert into customer(firstname, lastname, username, email, password) values(?, ?, ?, ?, ?);");
			
			pstmt.setString(1, c.getFirstname());
			pstmt.setString(2, c.getLastname());
			pstmt.setString(3, c.getUsername());
			pstmt.setString(4, c.getEmail());
			pstmt.setString(5, c.getPassword());
			pstmt.executeUpdate();
			conn.commit();
			
		}catch(SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			System.out.println(e);
		}finally {
			try {
				conn.setAutoCommit(true);
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	public static int testCustomerValidate(String username, String password) {
		Connection conn = ConnMySQL.connectSql();
		if (conn == null) return 0;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			pstmt = conn.prepareStatement("select password, customer_id from customer where username = ?");
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getString("password").equals(password)) {
					flag = rs.getInt("customer_id");
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				return flag;
			}
			
			
		}
		
		
		
	}
	
	public static  List<Item> getItemInfo(){
		List<Item>items = new ArrayList<Item>(); 
		Connection conn = ConnMySQL.connectSql();
		if(conn == null) return items;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from item");
			rs = pstmt.executeQuery();
			String item_id = "";
			String item_name = "";
			String brand = "";
			int gender = 0;  //0 for both, 1 for man, 2 for women
			String size = "";
			double price = 0;
			int capacity = 0;
			String category = "";
			String color = "";
			String pic_location = "";
			
			while(rs.next()) {
				item_id = rs.getString("item_id");
				item_name = rs.getString("item_name");
				brand = rs.getString("brand");
				gender = rs.getInt("gender");
				size = rs.getString("size");
				price = rs.getDouble("price");
				capacity = rs.getInt("capacity");
				category = rs.getString("category") == null? "":rs.getString("category");
				color = rs.getString("color");
				pic_location = rs.getString("pic_location");
				
				Item item = new Item(item_id, brand, item_name, gender, size, price, capacity, category, color , pic_location);
				items.add(item);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				
				rs.close();
				pstmt.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				return items;
			}
			
		}
		
		
		
	}


	
	
	
	
}
