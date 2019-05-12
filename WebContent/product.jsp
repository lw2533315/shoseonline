<%@page import="beans.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.*, java.beans.*" %>
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
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/themify-icons.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="css/nouislider.min.css">
	<link rel="stylesheet" href="css/ion.rangeSlider.css" />
	<link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css" />
	<link rel="stylesheet" href="css/main.css">
</head>

<body>
<%! List<Item> items = new ArrayList<>(); 
	
	Map<String, Set>  color_sizes = new HashMap();
	
	//List<String>sortedSize = null;
	double price = 0;
	int capacity = 0;
	String location = "";
	String name = "";
	String color = "";
	String category = "";
	String username;%>
	 
<%
	items = (List<Item>)session.getAttribute("detail");
	username = (String)session.getAttribute("username");
	if (items != null &&items.size() > 0){
		price = items.get(0).getPrice();
		name = items.get(0).getItem_name();
		category = items.get(0).getCategory();
		location = items.get(0).getPic_location();
		for(Item it: items){
			if(color_sizes.containsKey(it.getColor())){
				color_sizes.get(it.getColor()).add(it.getSize());
			}else{
				Set<String> size = new HashSet<>();
				size.add(it.getSize());
				color_sizes.put(it.getColor(), size);
			}
			
		}
//		sortedSize = new ArrayList<>(size);
//		Collections.sort(sortedSize);
	}
%>
	<input type = "hidden" value = <%=name%> id = "name">   <!-- pass name to jquery -->
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
								<!-- 	<li class="nav-item"><a class="nav-link" href="single-product.html">Product Details</a></li>
									<li class="nav-item"><a class="nav-link" href="checkout">Product Checkout</a></li> -->
								
								</ul>
							</li>
							
							
							<!-- before login display login , after login dispalay account or logout -->
							<li class="nav-item submenu dropdown">
								<%if (username == null ){ %>
							
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Login</a>
							<!--  <ul class="dropdown-menu">-->	
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
						</ul>
						
					</div>
				</div>
			</nav>
		</div>
		
	</header>
	<!-- End Header Area -->

	

	<!--================Single Product Area =================-->
	<div class="product_image_area">
	
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid" src=<%=location %> alt="">
						</div>
						
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
					<span class="error" id="spanerror"></span>
						<h3><%=name %></h3>
						<h2>$<%=price %></h2>
						<ul class="list">
							<li><a class="active" href="#"><span>Category</span> : <%=category %></a></li>
						</ul>
						
						<div class="product_count">
							<label for="qty">Color:</label>
							<select id = "color"   class="selectary" >
							<option></option>
							<%for(Map.Entry<String, Set> s: color_sizes.entrySet()){
							%>
								<option value = <%=s.getKey()%>><%=s.getKey() %></option>
							<%}
							color_sizes.clear(); //need clear prious recorder
							%>
							<input type="hidden" name="qty" id="sst" maxlength="12" value="1" title="Quantity:" class="input-text qty">
						</div>
						<br>
						
						
						<div class="product_count">
							<label for="qty">Size:</label>
							<select id = "size"  class="selectary" >
							
							
							<input type="hidden" name="qty" id="sst" maxlength="12" value="1" title="Quantity:" class="input-text qty">
						</div>
						<br>
						
						
						<div class="product_count">
							<label for="qty">Quantity:</label>
							<select id = "quantity"  class="selectary">
								
							</select>
							<input type="hidden" name="qty" id="sst" maxlength="12" value="1" title="Quantity:" class="input-text qty">
						</div>
					
						<div class="card_area d-flex align-items-center">
							<button class="primary-btn" href="#"  id = "submitcart">Add to Cart </button>
							
						</div>
						<div class="card_area d-flex align-items-center">
							<button class="primary-btn" href="#"  id = "submitcartandgo">Add and Go to Cart</button>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	
	<!--================End Product Description Area =================-->

	<!-- End related-product Area -->

	<!-- start footer Area -->

	<!-- End footer Area -->
<script
  src="https://code.jquery.com/jquery-3.4.0.min.js"
  integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg="
  crossorigin="anonymous"></script>
	<script src= "./js/product.js"></script>


</body>

</html>