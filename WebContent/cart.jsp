<%@page import="java.time.LocalDate"%>
<%@page import="beans.Product"%>
<%@page import="beans.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.*, java.beans.*, java.time.*" %>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="CodePixar">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title>Karma Shop</title>

    <!--
            CSS
            ============================================= -->
    <link rel="stylesheet" href="css/linearicons.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/nouislider.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">
</head>

<body>

 <%! String username;
 List<Item> items = null;
 List<Product> cart = null;
 int size = 0;
 int quantity = 0;
 String outStockName = "";
 %>
<%username = (String)session.getAttribute("username");
 items = (List<Item>)session.getAttribute("items");
 cart = (List<Product>)session.getAttribute("cart");
 size = cart.size();   //it possible is zero, the shooping is empty
 
 if(request.getAttribute("outstockname") != null){
	 outStockName = (String)request.getAttribute("outstockname");
 }
 
%>
	<input type = "hidden" value = <%=size%> id = "inputSize">
	<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
					 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item active"><a class="nav-link" href="home">Home</a></li>
							<li class="nav-item submenu dropdown">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Shop</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="category">Shop Category</a></li>
									
								</ul>
							</li>
							
                            
                            <!-- before login display login , after login dispalay account or logout -->
							<li class="nav-item submenu dropdown">
						
							<%if (username == null ){ %>
							
									<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
                                    <li class="nav-item"><a class="nav-link" href="register">Register</a></li>
                                  
								
								<%}else{ %>
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false"><%=username %> Welcome!</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="cart">Shopping Cart</a></li>
								
								</ul>
									<li class="nav-item"><a class="nav-link" href="signout">Signout</a></li>
									
								
								
								
								<%} %>
							</li>
							<!-- <li class="nav-item"><a class="nav-link" href="contact.html">Signout</a></li> -->
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="nav-item"><a href="#" class="cart"><span class="ti-bag"></span></a></li>
							<li class="nav-item">
								<button class="search"><span class="lnr lnr-magnifier" id="search"></span></button>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	
	</header>
	<!-- End Header Area -->

    <!-- Start Banner Area -->
    <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>Shopping Cart</h1>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

    <!--================Cart Area =================-->
    <section class="cart_area">
        <div class="container">
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Product</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total</th>
                                <th scopt="col">Delete</th>
                            </tr>
                        </thead>
                        <!-- was sent back from checkout servlet since out of stock -->
                        <%if(outStockName.length() != 0){
                        	String m = "The "+outStockName +" has not enough stock!!!";
                        	%>
                        	<span class="error" >J<%=m %></span>
                        	<%
                        }
                        	%>
                        
                        <span  class= "error" id="alerterror"></span>
                        <tbody>
                        
                        <%   for(int i = 0; i< size; i++){
                        		String item_id = cart.get(i).getItem_id();
                        		String name = "";
                        		int quantity = cart.get(i).getQuantity();
                        		double price = 0;
                        		int customer_id = 0;
                        		int stock_quantity = 0;
                        		for(Item it: items){
                        			if(it.getItem_id().equals(item_id)){
                        				name = it.getItem_name();
                        				price = it.getPrice();
                        				stock_quantity = it.getCapacity();
                        				customer_id = cart.get(i).getCustomer_id();
                        				break;
                        			}
                        		}
                        
                        %>
                            <tr id=<%=item_id%> name=<%=customer_id%> >
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="img/cart.jpg" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p id = "nameid"><%=name %></p>
                                            <!--  <input type = "hidden" value = <%=item_id%> id = "inputid">-->
                                        </div>
                                    </div>
                                </td>
                                <td >
                                    <h5 id = "priceid">$<%=price%></h5>
                                </td>
                                <td>
                                
                                    <div id="insertchoose" class="product_count"  style="display:inline">
                                    
                                    <input type="number" maxlength="10" value=<%=quantity%> title="Quantity:"
                                            class="input-text"  min=0  max=<%=stock_quantity %> >
                               
                                         
                                        
                                         
                                    </div> 
                                 
                                 	
                                </td>
                                <td>
                                    <h5 id = "hid" >$<%=price * quantity%></h5>
                                </td>
                                <td>
                                	<p><input id=<%=customer_id%> type="checkbox" name=<%=item_id %> class="deleteclass" />
                                </td>
                            </tr>
                            <%} %>
                   
                            <tr class="bottom_button">
                                <td>
                                   
                                </td>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                   
                                </td>
                            </tr>
                            <tr>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <h5>Subtotal</h5>
                                </td>
                                <td>
                                    <h5 id = "subtotal"></h5>
                                </td>
                            </tr>
                            <tr class="shipping_area">
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <h5>Shipping</h5>
                                </td>
                                <td>
                                    <div class="shipping_box">
                                       
                                        <ul class="list">
                                            <li> <select id = "mailid" class = "list">
                                                    <option value = 0 select:selected>Free Shipping</option>
                                                    <option value = 10>Express Way: $10.00</option>
                                                    <option value = 20>Two Day Delevery: $20.00</option>
        
                                                </select></li>
                                          
                                           
                                        </ul>
                                    <div class = "total">
                                        <h5 id="total_h5">Total </h5><span  id = "spantotal"></span>

                                    </div>
                                     
                                    </div>
                                </td>
                            </tr>
                            <tr class="out_button_area">
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <div class="checkout_btn_inner d-flex align-items-center">
                                        <a class="primary-btn" href="category">Continue Shopping</a>
                                         
                                        <a id = "proceed" class="primary-btn" href= "">Proceed to checkout</a> 
                                     
                                    
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
   
	<script
  src="https://code.jquery.com/jquery-3.4.0.min.js"
  integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg="
  crossorigin="anonymous"></script>
	<script src= "./js/cart.js"></script>
</body>

</html>