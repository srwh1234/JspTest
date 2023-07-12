<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<%
		   String myPath=request.getContextPath() + "/front-end" ;
		   request.setAttribute("myPath", myPath);
		%>



			<head>
				<title>TripLight</title>
				<meta name="viewport" content="width=device-width, initial-scale=1" />
				<meta charset="utf-8" />

				<!-- 網頁介紹 -->
				<meta name="description" content="我們提供旅遊行程規劃服務，以及販售套裝行程 票券 等等" />



				<!-- css files -->
				<link href="${myPath}/css/bootstrap.css" rel="stylesheet"
					  type="text/css" />
				<!-- bootstrap css -->
				<link href="${myPath}/css/style.css" rel="stylesheet" type="text/css" />
				<!-- custom css -->
				<link href="${myPath}/css/fontawesome-all.css" rel="stylesheet" />
				<!-- fontawesome css -->
				<!-- //css files -->

				<!-- google fonts -->
				<!-- 載入字體 -->
				<link rel="preconnect" href="https://fonts.googleapis.com" />
				<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
				<link
					  href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
					  rel="stylesheet" />
				<!-- //google fonts -->

				<!-- 載入icon -->
				<link rel="shortcut icon" href="./images/icon.png" />
				<link rel="bookmark" href="./images/icon.png" />
				<!--jQuery-->
				<link
					  href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
					  rel="stylesheet" />

				<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
				<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
				<script
						src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
						integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
						crossorigin="anonymous"></script>

				<!--會員登入-->
				<link href="${myPath}/css/login.css" rel="stylesheet" />

				<!-- login顯示 -->
				<script src="${myPath}/js/Login.js"></script>

				<!-- sweetalert2 -->
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
			</head>

			<body>
				<header>
					<div class="container" style="padding-right: 0px;">
						<!-- nav -->
						<nav class="py-md-4 py-3">
							<div id="logo">
								<h1 class="mt-md-0 mt-2">
									<a href="index.html"><img src="${myPath}/images/icon.png" class="icon_triplight" /> TripLight </a>
								</h1>
							</div>

							<ul class="menu ml-auto mt-1">
								<li class="active"><a href="home">首頁</a></li>
								<li class=""><a href="ticket">票券</a></li>
								
								<li class="booking"><a href="" id="login">登入/註冊</a></li>
								<li class=""><a href="shopping_car.html"><img
											 src="${myPath}/images/shoppingCar.svg" alt="" style="width: 2em" /></a>
								</li>
							</ul>
						</nav>
						<!-- //nav -->

						<div class="member">
							<ul class="member_list">
								<li class="member_li">
									<a href="login.html"><i class="fa-regular fa-user"></i>管理帳戶</a>
								</li>

								<li class="member_li" id="order_li">
									<a href="tickets_order.html"><i class="fa-solid fa-plane"></i>票券訂單</a>
								</li>

								<li class="member_li" id="logout_li">
									<a href=""><i class="fa-solid fa-right-from-bracket"></i>登出</a>
								</li>
							</ul>
						</div>
					</div>
				</header>
				<!-- //header -->
				<!-- 登入 -->

				<div id="login-container">
					<!---container--->

					<div class="main-box login">
						<h3>登入</h3>

						<div class="input-box">
							<i class="fas fa-envelope icon2"></i> <input type="email"
								   name="email" id="email" required /> <label for="">信箱</label>
						</div>
						<div class="input-box">
							<i class="fas fa-lock icon2"></i> <input type="password"
								   name="password" id="password" required /> <label for="">密碼</label>
						</div>
						<div class="check">
							<label><input type="checkbox" />記住我</label> <a href="#"
							   id="forgetPwd">忘記密碼</a>
						</div>
						<button type="submit" class="main-btn">Login</button>
						<div class="register">
							<p>
								如果沒有帳號?<a href="#" class="register-link">點擊註冊</a>
							</p>
						</div>

					</div>

					<div class="main-box register">
						<h3>註冊</h3>

						<div class="input-box">
							<i class="fas fa-user icon2"></i> <input type="text"
								   name="account" id="register_account" required /> <label for="">使用者名稱</label>
						</div>
						<div class="input-box">
							<i class="fas fa-envelope icon2"></i> <input type="email"
								   name="email" id="register_email" required /> <label for="">信箱</label>
						</div>
						<div class="input-box">
							<i class="fas fa-lock icon2"></i> <input type="password"
								   name="password" id="register_password" required /> <label for="">密碼</label>
							<h6 id="pwdHint">密碼設定請超過八碼</h6>
						</div>
						<div class="check">
							<label><input type="checkbox" />我同意所有條款</label>
						</div>
						<button type="submit" class="main-btn">註冊</button>
						<div class="register">
							<p>
								已經有帳號?<a href="#" class="login-link">點擊登入</a>
							</p>
						</div>

					</div>

					<span class="close-icon">
						<div class="fas fa-times"></div>
					</span>
				</div>

				<!-- 登入  -->

				<!-- banner -->
				<section class="banner_inner" id="home">
					<div class="banner_inner_overlay"></div>
				</section>
				<!-- //banner -->




				<script>
// 					$(function () {
// 						console.log($('#home').html())
// 						Swal.fire('Navbar include test')
// 					})
				</script>

			</body>