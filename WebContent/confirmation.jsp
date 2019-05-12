<%@page import="beans.Product"%>
<%@page import="beans.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" import="java.util.*, java.beans.*"  %>
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
	<link rel="stylesheet" href="css/themify-icons.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="css/nouislider.min.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/main.css">
</head>

<body>
<%! String username;
  List<Item> items  = null;
  List<Product> cart = null;
  String date = "";
  double  subtotal = 0;
  int mailfee = 0;
  int order_id = 0;
  String order_id_str = "";
  %>
  
  
<%
//data from servlet
username = (String)session.getAttribute("username");
items = (List<Item>)session.getAttribute("items");
cart = (List<Product>)request.getAttribute("cart");

date = (String)request.getAttribute("date");


//data from cart jsp
mailfee = (Integer)request.getAttribute("mailfee");
subtotal = (Double)request.getAttribute("subtotal");

//create string to display a digit
order_id = (Integer)request.getAttribute("order_id");
order_id_str = "" + order_id;
int size = order_id_str.length();
String zero = "";
for(int i = 0; i<8-size; i++){
	zero += "0";
}
order_id_str = zero + order_id_str;
%>
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
						
							<li class="nav-item submenu dropdown">
						
							<%if (username == null ){ %>
							
								
									<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
                                    <li class="nav-item"><a class="nav-link" href="register">Register</a></li>
                                  
								
								<%}else{ %>
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false"><%=username %> Welcome!</a>
								<ul class="dropdown-menu">
									
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
					<h1>Confirmation</h1>
					<nav class="d-flex align-items-center">
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Order Details Area =================-->
	<section class="order_details section_gap">
		<div class="container">
			<h3 class="title_confirmation">Thank you. Your order has been received.</h3>
			<div class="row order_d_inner">
				<div class="col-lg-4">
					<div class="details_item">
						<h4>Order Info</h4>
						<ul class="list">
							
							<li><a href="#"><span>Order number</span><%=order_id_str%> </a></li>
							<li><a href="#"><span>Date</span><%=date%></a></li>
							
						
						</ul>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="details_item">
						<ul class="list">
							
						</ul>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="details_item">
						<ul class="list">
						
						</ul>
					</div>
				</div>
			</div>
			<div class="order_details_table">
				<h2>Order Details</h2>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Product</th>
								<th scope="col">Quantity</th>
								<th scope="col">Total</th>
							</tr>
						</thead>
						<tbody>
							<%for(Product pd: cart){
								
								for(Item it: items){
									if(pd.getItem_id().equals(it.getItem_id())){
							%>
								<tr>
								<td>
									<p><%=it.getItem_name() %>
								</td>
								<td>
									<h5>x <%=pd.getQuantity()%></h5>
								</td>
								<td>
									
									<p>$<%= pd.getQuantity()*it.getPrice() %></p>
								</td>
							</tr>
							
							
							
							<% 		break;
									}
								} 
							}%>
							
							
							
							<tr>
								<td>
									<h4>Subtotal</h4>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<p>$<%=subtotal %></p>
								</td>
							</tr>
							<tr>
								<td>
									<h4>Shipping</h4>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<p>$<%=mailfee %></p>
								</td>
							</tr>
							<tr>
								<td>
									<h4>Total</h4>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									
									<p>$<%=mailfee + subtotal%></p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!--================End Order Details Area =================-->

	
	<!-- End footer Area -->



</body>

</html>