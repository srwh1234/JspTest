<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<body>
	<jsp:include page="navbar.jsp" />

	<div class="container">
		<div class="row" style="height: 20vh;">
			<div class="col-12 justify-content-center d-flex">
				<h1>使用Servlet與Jsp做練習</h1>
			</div>
			<div class="col-4">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addTicketModal">新增票券</button>
			</div>

		</div>
	</div>
	<!-- 新增的燈箱 -->
	<div class="modal fade" id="addTicketModal" data-bs-backdrop="static" aria-hidden="true">
		<div class="modal-dialog modal-xl">

			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">新增票券</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<div class="row m-5">
						<div class="col-12">
							<button id="testBtn">一鍵新增資料(測試用)</button>
							<!-- Row-1 -->
							<div class="row">

								<!-- Column-1 -->
								<div class="col-12 col-lg-4 p-3">
									<div class="form-floating mb-3">
										<select class="form-select" id="ticketType">
											<!-- 內容給JS填 -->
										</select> <label class="my-text-lightgray" for="ticketType">票券類型</label>
									</div>
									<div class="form-floating mb-3">
										<input type="date" class="form-control" id="ticketExpiryDate" placeholder="."> <label class="my-text-lightgray" for="ticketExpiryDate">到期日期</label>
									</div>
								</div>
								<!-- Column-2 -->
								<div class="col-12 col-lg-4 p-3">
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="ticketName" placeholder="."> <label class="my-text-lightgray" for="ticketName">票券名稱</label>
									</div>
									<div class="form-floating mb-3">
										<input type="number" class="form-control" id="ticketPrice" min=1 placeholder="."> <label class="my-text-lightgray" for="ticketPrice">票券價格</label>
									</div>
								</div>
								<!-- Column-3 -->
								<div class="col-12 col-lg-4 p-3">
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="ticketSupplier" placeholder="."> <label class="my-text-lightgray" for="ticketSupplier">票券供應商</label>
									</div>
									<div class="form-floating mb-3">
										<input type="number" class="form-control" id="ticketCount" min=1 placeholder="."> <label class="my-text-lightgray" for="ticketCount">票券數量</label>
									</div>
									<div class="form-floating mb-3">
										<input type="number" class="form-control" id="ticketRating" min=1 max=5 placeholder="."> <label class="my-text-lightgray" for="ticketRating">評價分數</label>
									</div>
									<div class="form-floating mb-3">
										<input type="number" class="form-control" id="ticketRatingCount" min=1 placeholder="."> <label class="my-text-lightgray" for="ticketRatingCount">評價人數</label>
									</div>
								</div>
							</div>
							<!-- Row-2 -->
							<div class="row">
								<div class="col-12 col-lg-4 mb-5">
									<div class="form-floating mb-3">
										<select class="form-select" id="ticketCity">
											<!-- 內容給JS填 -->
										</select> <label class="my-text-lightgray" for="ticketCity">使用縣市</label>
									</div>
								</div>
								<div class="col-12 col-lg-8 mb-5">
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="ticketAddress" placeholder="."> <label class="my-text-lightgray" for="ticketAddress">使用地址</label>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- 圖片區 -->
					<div class="row justify-content-center m-3">
						<div class="col-12 col-lg-6">
							<label class="form-label" for="ticketImage">上傳圖片</label> <input type="file" class="form-control" id="ticketImage" multiple>
						</div>
					</div>
					<!-- 一行5個卡片 -->
					<div class="row row-cols-1 row-cols-lg-5 g-2 mb-5" id="imgPreview">
						<!-- 顯示區 -->
					</div>

					<div class="row my-5">
						<div class="col-12 col-lg-12 text-center">
							<button class="btn btn-primary" id="ticketSubmit">新增</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 稱高度用的 -->
	<div style="height: 30vh"></div>

	<jsp:include page="footer.jsp" />

	<script>
	 const locationTypes = [
         '主題樂園', '景點門票', '水族館 & 動物園', '博物館 & 美術館', '歷史景點'
     ];
     const taiwanCities = [
         "基隆市", "台北市", "新北市", "桃園市", "新竹市", "新竹縣", "苗栗縣",
         "台中市", "彰化縣", "南投縣", "雲林縣", "嘉義市", "嘉義縣", "台南市",
         "高雄市", "屏東縣", "台東縣", "花蓮縣", "宜蘭縣", "澎湖縣", "金門縣", "連江縣"
     ];
     
		$(function() {

			 // 新增票券-確認
            $('#ticketSubmit').on('click', fetch_insert);
			 
			// 測試按鈕-新增票券
			$('#testBtn')
					.on(
							'click',
							function() {
								
								
								$('#ticketType').val('主題樂園');
								$('#ticketSupplier').val('T8Me');
								$('#ticketExpiryDate').val('2024-12-21');
								$('#ticketName').val('錢櫃一日遊門票');
								$('#ticketPrice').val(
										Math.trunc(Math.random() * 1000));
								$('#ticketCount').val(10);
								$('#ticketRating').val(4);
								$('#ticketRatingCount').val(10);
								$('#ticketCity').val('桃園市');
								$('#ticketAddress').val('320桃園市中壢區中央東路88號');
								
							});
			
			render_types();
			render_cities();
			
		});
		
		/**
	        * 送出新增票券的請求
	        */
	        function fetch_insert() {
	            const post = {
	                ticketId: 0,
	                ticketType: $('#ticketType').val(),
	                name: $('#ticketName').val(),
	                price: $('#ticketPrice').val(),
	                available: $('#ticketCount').val(),
	                totalSales: 0,
	                expiryDate: $('#ticketExpiryDate').val(),
	               
	                supplierName: $('#ticketSupplier').val(),
	                city: $('#ticketCity').val(),
	                address: $('#ticketAddress').val(),
	                latitude: 0,
	                longitude: 0,
	                rating: $('#ticketRating').val(),
	                ratingPerson: $('#ticketRatingCount').val(),
	                images: [],
	            };

	          

 	            const formData = new FormData();
// 	            formData.append('post', JSON.stringify(post));

// 	            // Add image files to FormData
// 	            const imageFiles = $('#imgPreview .img-upload').map((i, v) => convertToBlob($(v).attr('src'))).get();
// 	            for (let i = 0; i < imageFiles.length; i++) {
// 	                formData.append('images', imageFiles[i]);
// 	            }

// 	            if (imageFiles.length <= 0) {
// 	                Swal.fire({ icon: 'error', title: '票券至少一張圖片' });
// 	                return;
// 	            }

	            //發請求
	            fetch(`bk/addticketform`, {
	                method: 'POST',
	                body: formData,
	            })
	                .then(response => response.json())
	                .then(data => {
	                    if (data) {
	                        Swal.fire({ icon: 'success', title: '新增成功 請至列表選擇上架', });
	                    } else {
	                        Swal.fire({ icon: 'error', title: '新增失敗', });
	                    }
	                })
	                .catch(error =>{ 
	                console.log(error);
	                Swal.fire({ icon: 'error', title: '新增失敗', });
	                })
	                .finally(() => {
	                    $('#addTicketModal').modal('hide');	                  
	                });
	        }
		
		
		 // 票券類型
        function render_types() {
            $('#ticketType').html('<option selected disabled>--</option>');
            $('#editTicketType').html('<option selected disabled>--</option>');

            locationTypes.forEach((v, i) => {
                $('#ticketType').append(`<option value="\${v}">\${v}</option>`);
                $('#editTicketType').append(`<option value="\${v}">\${v}</option>`);
            });
        }

        // 縣市
        function render_cities() {
            $('#ticketCity').html('<option selected disabled>--</option>');
            $('#editTicketCity').html('<option selected disabled>--</option>');
            taiwanCities.forEach((v, i) => {
                $('#ticketCity').append(`<option value="\${v}">\${v}</option>`);
                $('#editTicketCity').append(`<option value="\${v}">\${v}</option>`);
            });
        }
	</script>
</body>
</html>