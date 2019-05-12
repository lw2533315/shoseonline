<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<title>Home</title>

<link rel="stylesheet" href="css/bootstrap.css">

<link rel="stylesheet" href="css/main2.css">




<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>
<body>
	<%!String username;%>
	<%
		username = (String) session.getAttribute("username");
	%>

	<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item active"><a class="nav-link" href="home">Home</a></li>
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">Shop</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="category">Shop
											Category</a></li>

								</ul></li>
						

							<!-- before login display login , after login dispalay account or logout -->
							<li class="nav-item submenu dropdown">
								<%
									if (username == null) {
								%> 
							
							<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
							<li class="nav-item"><a class="nav-link" href="register">Register</a></li>
						

							<%
								} else {
							%>
							<a href="#" class="nav-link dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><%=username%> Welcome!</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="cart">Shopping
										Cart</a></li>
							
							</ul>
							<li class="nav-item"><a class="nav-link" href="signout">Signout</a></li>




							<%
								}
							%>
							</li>
							<!-- <li class="nav-item"><a class="nav-link" href="contact.html">Signout</a></li> -->
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="nav-item"><a href="#" class="cart"><span
									class="ti-bag"></span></a></li>
							<li class="nav-item">
								<button class="search">
									<span class="lnr lnr-magnifier" id="search"></span>
								</button>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		
		<!-- search bar -->
		<!--  <div class="search_input" id="search_input_box">  for search bar in home page-->
			
		<!--  </div>-->
	</header>
	<!-- End Header Area -->

	<!-- start banner Area -->
	<section class="banner-area">
		<div class="container">
			<!-- <div class="row fullscreen align-items-center justify-content-start"> -->
			<div class="col-lg-12">
				<div class="active-banner-slider owl-carousel">


					<div class="row single-slide">
						<div class="col-lg-5">
							<div class="banner-content">
								<h1>
									Nike New <br>Collection!
								</h1>
								<p>Retro design, lightweight and comfortable. Enjoying
									romance with lover!</p>
								<!-- <div class="add-bag d-flex align-items-center">
										<a class="add-btn" href=""><span class="lnr lnr-cross"></span></a>
										<span class="add-text text-uppercase">Add to Bag</span>
									</div> -->
							</div>
						</div>
						<!-- <div class="col-lg-7"> -->
						<br>
						<div class="banner-img">
							<img class="img-fluid" style="visibility: hidden"
								src="img/c1.jpg" alt="">
						</div>
						<div class="banner-img">
							<img class="img-fluid" src="img/c1.jpg" alt="">
						</div>
						<!-- </div> -->
					</div>
				</div>
			</div>
			<!-- </div> -->
		</div>
	</section>
	<!-- End banner Area -->



	<script src= "./js/home.js"></script>
	
	


</body>

</html>