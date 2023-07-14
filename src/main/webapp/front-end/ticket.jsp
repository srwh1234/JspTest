<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>
		<head>
			<meta charset="UTF-8">


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
						<c:forEach var="item" items="${rndDescTicketDtos}">
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

						<c:forEach var="item" items="${hotDescTicketDtos}">
							<div class="col destinations-grids mb-3">
								<h4 class="destination text-center mb-3">${item.city}</h4>
								<div class="image-tour-hot position-relative">
									<a href="tickets_detail.html?id=${item.ticketId}">
										<img src="${item.image}" class="card-img" />
									</a>
									<div class="my-destinations-info">
										<div class="caption mb-lg-3">
											<h4>${item.name}</h4>
											<a href="tickets_detail.html?id=${item.ticketId}">立即購買</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
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
											<c:forEach var="item" varStatus="status" items="${locationTypes}">
												<div class="form-check d-flex gap-3">
													<input class="form-check-input" type="checkbox" value="${item}" id="ticketType${status.index}" checked>
													<label class="form-check-label align-self-center" for="ticketType${status.index}">${item}</label>
												</div>
											</c:forEach>
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
											<div class="form-check d-flex gap-3">
												<input class="form-check-input" type="checkbox" value="" id="allTicketZone" checked>
												<label class="form-check-label align-self-center" for="allTicketZone">選擇全部</label>
											</div>
											<c:forEach var="item" varStatus="status" items="${taiwanCities}">
												<div class="form-check d-flex gap-3">
													<input class="form-check-input" type="checkbox" value="${item}" id="ticketZone${status}" checked>
													<label class="form-check-label align-self-center" for="ticketZone${status}">${item}</label>
												</div>
											</c:forEach>
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

			<script>
				//假資料-搜尋
				let resultSearch =
				{
					curPage: 0,
					totalPage: 10,
					tickets: [],
				};
				$(function () {
					//搜尋按鈕的事件
					$('#btnSearch').on('click', function () {
						doSearch(0);
					});

					//票券類型的按鈕
					$(document).on('click', '[id^="ticketType"]', function () {
						doSearch(0);
					});
					// 全選按鈕的事件
					$(document).on('click', '#allTicketZone', function () {
						const checked = $(this).prop('checked');
						$('[id^="ticketZone"]').prop('checked', checked);
						doSearch(0);
					});
					// 縣市按鈕的事件
					$(document).on('click', '[id^="ticketZone"]', function () {
						const allChecked = ($('[id^="ticketZone"]:checked').length == taiwanCities.length);
						$('#allTicketZone').prop('checked', allChecked);
						doSearch(0);
					})
					//分頁的按鈕事件
					$(document).on('click', '#searchPagination a', function (e) {
						e.preventDefault();

						const page = $(this).attr('aria-label');

						if (page === "Previous") {
							doSearch(Math.max(resultSearch.curPage - 1, 0));
						} else if (page === "Next") {
							doSearch(Math.min(resultSearch.curPage + 1, resultSearch.totalPage - 1));
						} else if (!isNaN(page)) {
							doSearch(page);
						}

						//跳回容器頂端
						$("html, body").animate({
							scrollTop: $('#ticketSearchText').offset().top,
						}, 100);
					});
				});

				function doSearch(curPage) {
					const post = {
						keyword: $('#ticketSearchText').val(),
						types: [],
						cities: [],
						page: curPage,
						size: 5,
					};

					$('[id^="ticketType"]:checked').each((i, v) => {
						post.types.push(v.value);
					});
					$('[id^="ticketZone"]:checked').each((i, v) => {
						post.cities.push(v.value);
					});

					fetch(`search/tickets`, {
						method: 'POST',
						headers: {
							'Content-Type': 'application/json'
						},
						body: JSON.stringify(post),
					})
						.then(response => response.json())
						.then(data => resultSearch = data)
						.catch(error => console.log(error))
						.finally(() => {
							render_search();
						});
				}
				/**
				 * 搜尋的結果
				 */
				function render_search() {
					//沒有東西時
					if (!resultSearch.tickets.length) {
						$('#ticketsSearchContainer').html(`
			          <div class="card mb-3 my-search-item ">
			            <div class="text-center m-5">沒有相關的搜尋結果。</div>            
			          </div>
			          <div class="text-center m-5">
			            <img class="image-tour-hot" src="/img/0">
			          </div>
			        `);
						$('#searchPagination ul').html('');
						return;
					}

					$('#ticketsSearchContainer').html('');

					for (let ticket of resultSearch.tickets) {
						//促銷的判斷
						let priceHtml = `<div class="my-ticket-price h4 fw-bold text-dark ms-auto">${ticket.price} 元</div>`;
						if (ticket.promotion) {
							priceHtml = `            
			              <div class="my-mark ms-auto">${ticket.promotion.startDate}~${ticket.promotion.endDate}</div>
			              <div class="my-ticket-price h4 fw-bold text-danger ms-auto">${ticket.promotion.price} 元</div>            
			          `;
						}


						$('#ticketsSearchContainer').append(`
			            <div class="card mb-3 my-search-item">
			              <a href="tickets_detail.html?id=${ticket.ticketId}">
			                <div class="row g-0 h-100">
			                  <div class="col-lg-4 h-100">
			                    <img src="${ticket.image}" class="img-fluid rounded-start">
			                  </div>
			                  <div class="card-body col-lg-8 d-flex flex-column">
			                    <div class="col">
			                      <h5 class="card-title">${ticket.name}</h5>
			                      <div class="my-mark">即買即用</div>
			                      <p class="card-text">${ticket.description}</p>
			                      <small class="my-text-lightgray">
			                        <span class="fa fa-map-marker mr-3 mt-1"></span>
			                        <span>台灣, ${ticket.city}</span>
			                      </small>
			                    </div>
			                   
			                    <div class="mt-auto d-flex">                      
			                      <div class="my-ratings my-text-lightgray mx-3">
			                        <i class="fa fa-star ${ticket.rating >= 1 ? 'on' : ''}"></i>
			                        <i class="fa fa-star ${ticket.rating >= 2 ? 'on' : ''}"></i>
			                        <i class="fa fa-star ${ticket.rating >= 3 ? 'on' : ''}"></i>
			                        <i class="fa fa-star ${ticket.rating >= 4 ? 'on' : ''}"></i>
			                        <i class="fa fa-star ${ticket.rating >= 5 ? 'on' : ''}"></i>
			                      </div>
			                      <div class="my-text-lightgray">(${ticket.ratingPerson})</div>
			                      ${priceHtml}
			                    </div>
			                   
			                  </div>
			                </div>
			              </a>
			            </div>          
			        `);

						// 最底下的分頁
						$('#searchPagination ul').html('');

						if (resultSearch.totalPage > 1) {
							$('#searchPagination ul').append(`
			              <li class="page-item">
			                <a class="page-link" href="#" aria-label="Previous">
			                  <span>&laquo;</span>
			                </a>
			              </li>
			          `);
							for (let i = 0; i < resultSearch.totalPage; i++) {
								$('#searchPagination ul').append(`         
			              <li class="page-item">
			                <a class="page-link ${i == resultSearch.curPage ? 'active' : ''}" href="#" aria-label="${i}">${i + 1}</a>
			              </li>
			            `);
							}
							$('#searchPagination ul').append(`                    
			              <li class="page-item">
			                <a class="page-link" href="#" aria-label="Next">
			                  <span>&raquo;</span>
			                </a>
			              </li>
			          `);
						}
					}
				}

			</script>
		</body>
		</html>