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

 				<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
				<!--會員登入-->
				<link href="${myPath}/css/login.css" rel="stylesheet" />

				<!-- login顯示 -->
				<script src="${myPath}/js/Login.js"></script>

				<!-- sweetalert2 -->
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
				
					<style>
				/* 設定預設高度 保持圖片比例並填滿容器*/
				.image-tour img {
					width: 100%;
					height: 18rem;
					object-fit: cover;
				}

				.image-tour-hot img {
					width: 100%;
					height: 24rem;
					object-fit: cover;
				}

				/* 熱門票券照片內的彈窗 */
				.my-destinations-info {
					width: 100%;
					position: absolute;
					bottom: -227px;
					margin: 0;
					background: rgba(0, 0, 0, 0.8);
					padding: 30px 0px 10px;
					transition: 0.5s all;
					-webkit-transition: 0.5s all;
					-moz-transition: 0.5s all;
					-o-transition: 0.5s all;
					-ms-transition: 0.5s all;
					text-align: center;
				}

				.destinations-grids:hover .my-destinations-info {
					bottom: 0;
				}

				.my-card {
					height: 11rem;
				}

				.my-search-item .card {
					height: 200px;
				}

				.my-search-item img {
					width: 100%;
					height: 16rem;
					object-fit: cover;
				}

				.my-search-item .card-body p {
					display: -webkit-box;
					/* 顯示幾行文字 */
					-webkit-line-clamp: 3;
					-webkit-box-orient: vertical;
					overflow: hidden;
					text-overflow: ellipsis;
				}

				/* 顯示幾行文字 */
				.package-info p {
					display: -webkit-box;
					-webkit-line-clamp: 3;
					-webkit-box-orient: vertical;
					overflow: hidden;
					text-overflow: ellipsis;
				}

				.package-info h5 {
					display: -webkit-box;
					-webkit-line-clamp: 1;
					-webkit-box-orient: vertical;
					overflow: hidden;
					text-overflow: ellipsis;
				}

				/* 搜尋的按鈕 */
				#btnSearch {
					border: #26bec9;
					color: white;
					background-color: #26bec9;
				}

				#btnSearch:hover,
				#btnSearch:focus {
					border: #26bec9;
					background-color: #09777d;
				}

				/* 手風琴的樣式 */
				.accordion-button,
				.accordion-button:not(.collapsed) {
					color: white;
					background-color: rgba(38, 190, 201, 1);
				}

				.accordion-button:focus {
					z-index: 3;
					border: 0;
					outline: 0;
					box-shadow: 0 0 0 0.25rem transparent;
					/* border-color: #86b7fe; */
					/* box-shadow: 0 0 0 0.25rem #26bec9; */
				}

				/* 箭頭的圖案 */
				.accordion-button:not(.collapsed)::after {
					background-image:
						url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23212529'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
					transform: rotate(-180deg);
				}

				/* 篩選的勾勾 */
				.form-check-input:checked {
					background-color: #26bec9;
					border-color: #26bec9;
				}

				/* 票券名稱下方的標記 */
				.my-mark {
					margin: 0 6px 6px 0;
					padding: 3px 8px;
					color: #64b3f4;
					background-color: rgba(100, 179, 244, .1);
					display: inline-block;
					line-height: 1;
					text-align: center;
					white-space: nowrap;
					vertical-align: baseline;
					border-radius: 0.25em;
				}

				/* 評價的星星 */
				.my-ratings .on {
					color: #26bec9;
				}

				/* 票券價格 */
				.my-ticket-price {
					letter-spacing: 1px;
					color: #333;
				}

				.page-item .active {
					border: 1px solid #26bec9;
					color: white;
					background-color: #26bec9;
				}

				.page-item a {
					color: #999;
				}

				/* 文字灰色 */
				.my-text-lightgray {
					color: #ccc;
				}

				/* 分頁選單定位*/
				#ticketsSearchContainer {
					min-height: 140vh;
				}
			</style>
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
								<li class="active"><a href="index">首頁</a></li>
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