<%@page import="beans.Item"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.*, java.beans.Beans" %>
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
	
	
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>
</head>

<body id="category">
	<%!  
		//List<Item> items_by_name = new ArrayList<>();
		
		int size = 0;
		int page_num = 0;
		String username;
		int index = 0;
		
	%>
	<% 
	/*if((items = (ArrayList<Item>)request.getAttribute("item")) == null){
		items = (ArrayList<Item>)session.getAttribute("items");
	}else{
		session.setAttribute("items", items);
	}*/
	size = (Integer)session.getAttribute("name_size");
	page_num = (Integer)session.getAttribute("page_num");
	username = (String)session.getAttribute("username");
	
	%>
	
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
						</ul>
						<ul class="nav navbar-nav navbar-right">
							</li> 
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<!-- <div class="search_input" id="search_input_box">  for search bar in home page-->
			<div class="container">
				<form class="d-flex justify-content-between">
					<input type="text" style="width:0px" placeholder="Search Here">
					<input  type = "text" id="search_input"   class="form-control"  placeholder="Search Here">
					<!--  <button type="submit" class="btn"></button>-->
					<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
				</form>
			</div>
	</header>
	<!-- End Header Area -->



	
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Shop Category page</h1>
					
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
					<div class="head">Brand</div>
					<ul class="main-categories">
						
						     	<li class="filter-list"><input class="pixel-radio" type="radio" id="brand_none" value = "none" name="brand" checked><label for="brand_none">None<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="brand_nike" value = "nike" name="brand"><label for="brand_nike">Nike<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="brand_adidas" value = "adidas" name="brand"><label for="brand_adidas">Adidas<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="brand_reebook" value = "reebook" name="brand"><label for="brand_reebook">Reebook<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="brand_under" value = "under armour"name="brand"><label for="brand_under">Under Armour<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="brand_new_balance" value = "new balance" name="brand"><label for="brand_new_balance">New Balance<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="brand_converse" value = "converse" name="brand"><label for="brand_converse">Converse<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="brand_vans" value = "vans" name="brand"><label for="brand_vans">Vans<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="brand_Puma" value = "puma" name="brand"><label for="brand_Puma">Puma<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="brand_thers" value = "others" name="brand"><label for="brand_thers">Others<span></span></label></li>
					</ul>
				</div>
				<div class="sidebar-filter mt-50">
					<div class="top-filter-head">Product Filters</div>
					<div class="common-filter">
						<div class="head">Gender</div>
						<form action="#">
							<ul>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="gender_none" name="gender" value = "none" checked><label for="gender_none">None<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="male" name="gender" value = "1"><label for="male">Male<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="female" name="gender" value = "2"><label for="female">Female<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="male/female" name="gender" value ="0"><label for="male/female">Male/Female<span></span></label></li>
								
							</ul>
						</form>
					</div>
				 	<div class="common-filter">
						<div class="head">Color</div>
						<form action="#">
							<ul>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="color_none" value = "none" name="color" checked><label for="black">None<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="black" value = "black" name="color"><label for="black">Black<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="white" value = "white" name="color"><label for="white">White<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="red" value = "red" name="color"><label for="red">Red<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="gray" value = "gray" name="color"><label for="gray">Gray<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="color_others"  value = "others" name="color"><label for="color_others">Others<span></span></label></li>
							</ul>
						</form>
					</div> 
			
				</div>
			
			</div>
			
			
			
			
			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
	
				
				
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<span  id ="matchinfo"></span>
					<div class="row">
						<!-- single product   111111111 -->
						<div class="col-lg-4 col-md-6">
							<div class="single-product">
							<a id = "a1" href = ""><img class="img-fluid" id ="img1" src="" alt=""></a>
								
								
								<div class="product-details">
									<h6 id ="name1"></h6>
									<div class="price">
									
										<h6  id = "price1" ></h6>
									</div>
									<div class="prd-bottom">

										<!--<a id = "a1" href="" class="social-info">
											<span class="lnr lnr-move"></span>
											<p id = "view1"class="hover-text">view more</p>  -->
										</a>
									</div>
								</div>
							
							</div>
						</div>
						<!-- single product 2222222222-->
						<div class="col-lg-4 col-md-6">
							<div class="single-product">
								<a id ="a2" href="" ><img  id="img2"  class="img-fluid" src= alt=""></a>
								<div class="product-details">
									<h6 id = "name2"></h6>
									<div class="price">
										
										<h6 id = "price2" ></h6>
									</div>
									<div class="prd-bottom">

										
									</div>
								</div>
							</div>
						
						</div>
						<!-- single product 3333333333333333-->
						<div class="col-lg-4 col-md-6">
							<div class="single-product">
								<a id="a3" href = ""><img  id="img3"  class="img-fluid" src="" alt=""></a>
								<div class="product-details">
									<h6  id = "name3"></h6>
									<div class="price">
										
										<h6 id = "price3" ></h6>
									</div>
									<div class="prd-bottom">

										
									</div>
								</div>
							</div>
						
						</div>
						<!-- single product 44444444444444-->
						<div class="col-lg-4 col-md-6">
							<div class="single-product">
								<a id="a4" href = ""><img class="img-fluid" id = "img4" src="" alt=""></a>
								<div class="product-details">
									<h6 id = "name4"></h6>
									<div class="price">
										
										<h6 id = "price4" ></h6>
									</div>
									<div class="prd-bottom">

										
									</div>
								</div>
							</div>
							
						</div>
						<!-- single product555555555555555 -->
						<div class="col-lg-4 col-md-6">
							<div class="single-product">
							<a id = "a5" href =""><img class="img-fluid" id = "img5" src="" alt=""></a>
								<div class="product-details">
									<h6 id = "name5"></h6>
									<div class="price">
									
										<h6 id = "price5" >h6>
									</div>
									<div class="prd-bottom">

									</div>
								</div>
							</div>
						
						</div>
						<!-- single product 6666666666666666-->
						<div class="col-lg-4 col-md-6">
							<div class="single-product">
								<a href="" id="a6"><img class="img-fluid" id="img6" src="" alt=""></a>
								<div class="product-details">
									<h6 id="name6"></h6>
									<div class="price">
										<h6 id= "price6" ></h6>
									</div>
									<div class="prd-bottom">

									</div>
								</div>
							</div>

						</div>
					</div>
				</section>
				<!-- End Best Seller -->
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					
					<div class="pagination">
						
					 	<a href="#" >Pre</a>
					 	<%  for(index = 1; index <= page_num; index ++) {
						 %>
							  <a class="pagenum" href = "category.jsp?curpage=<%=index%>"><%=index %></a>
						
						<%
						}
						%>
						<a href="#">Next</a>
						
					
						
			
					</div>
				</div>
				<!-- End Filter Bar -->
			</div>
		</div>
	</div>

	


	



	<script src= "./js/category.js"></script>
	
	
</body>

</html>