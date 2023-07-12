<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

#btnSearch:hover, #btnSearch:focus {
	border: #26bec9;
	background-color: #09777d;
}

/* 手風琴的樣式 */
.accordion-button, .accordion-button:not(.collapsed) {
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
	<jsp:include page="navbar.jsp" />

	<!-- 這是正文 -->
	<section class="packages py-5">
		<div class="container py-lg-4 py-sm-3">
			<h3 class="heading text-capitalize text-center">探索我們的票券</h3>
			<p class="text mt-2 mb-5 text-center">
				探索多樣性豐富的套裝行程，讓您的旅行更輕鬆愉快。從浪漫之旅到刺激的冒險，我們提供各種各樣的行程，滿足不同旅客的需求。無論是短途旅行還是長途旅行，我們都有適合您的選擇。
			</p>

			<div class="row row-cols-1 row-cols-lg-4 row-cols-sm-2"
				id="ticketsContainer">
				<!-- 內容給JS填 -->
				<c:forEach var="item" items="${descTicketDtos}">
					<div class="col mb-3">
						<div class="image-tour position-relative">
							<a href="tickets_detail.html?id=${item.ticketId}"> <img
								src="${item.image}" class="card-img" />
							</a>
							<p>
								<span class="fa fa-tags"></span><span>${item.promotion!=null ? item.promotion.price : item.price}元</span>
							</p>
						</div>
						<div class="package-info my-card">
							<h6 class="mt-1">
								<span class="fa fa-map-marker mr-2"></span>台灣, <span>${item.city}</span>
							</h6>
							<h5 class="my-2">${item.name}</h5>
							<p class="">${item.description}</p>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>
	</section>


	<!-- destinations -->
	<section class="destinations py-5" id="destinations">
		<div class="container py-xl-5 py-lg-3">
			<h3 class="heading text-capitalize text-center">熱門票券</h3>
			<p class="text mt-2 mb-5 text-center">
				無論您是喜愛自然風光、文化古蹟或是美食之旅，我們都有適合您的票券選擇。</p>


			<!-- 這是正文 -->
			<div class="row row-cols-1 row-cols-lg-4 row-cols-sm-2"
				id="ticketsHotContainer">
				<!-- 內容給JS填 -->
			</div>
			<!-- 正文結束 -->

		</div>
	</section>
	<!-- destinations -->


	<section class="packages py-5">
		<div class="container py-lg-4 py-sm-3">
			<h3 class="heading text-capitalize text-center">搜尋票券</h3>
			<p class="text mt-2 mb-5 text-center">輸入關鍵字及目的地，更快找到您的票券選擇。</p>
		</div>


		<div class="container">
			<div class="row">

				<!-- 左側搜尋列 -->
				<div class="col-12 col-lg-3 mb-3">

					<!-- 第一排 -->
					<div class="mb-3">
						<label class="visually-hidden" for="ticketSearchText"></label>
						<div class="input-group">
							<input type="text" class="form-control" id="ticketSearchText"
								placeholder="關鍵字搜尋">
							<button class="btn btn-lg btn-primary" id="btnSearch">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>


					<!-- 第二排 -->
					<div class="accordion">
						<!-- 區塊1 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingOne">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseOne"
									aria-expanded="false" aria-controls="collapseOne">
									選擇類型</button>
							</h2>
							<!-- 區塊1的選項 -->
							<div id="collapseOne" class="accordion-collapse collapse show"
								aria-labelledby="headingOne">
								<div class="accordion-body p-1 px-5">
									<!-- 內容給JS填 -->
								</div>
							</div>
						</div>

						<!-- 區塊2 -->
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingTwo">
								<button class="accordion-button" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseTwo"
									aria-expanded="true" aria-controls="collapseTwo">選擇縣市
								</button>
							</h2>
							<div id="collapseTwo" class="accordion-collapse collapse show"
								aria-labelledby="headingTwo">
								<!-- 區塊2的選項 -->
								<div class="accordion-body p-1 px-5">
									<!-- 內容給JS填 -->
								</div>
							</div>
						</div>

					</div>
				</div>


				<!-- 右側商品簡介 -->
				<div class="col-12 col-lg-9" id="ticketsSearchContainer">
					<!-- 內容給JS填 -->
				</div>

				<!-- 最下排 -->
				<div class="d-flex justify-content-center align-items-center my-3"
					id="searchPagination">
					<ul class="pagination gap-2">
						<!-- 內容給JS填 -->
					</ul>
				</div>


			</div>
		</div>
	</section>


	<jsp:include page="footer.jsp" />
</body>
</html>