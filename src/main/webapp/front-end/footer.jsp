<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

  <%
     String myPath=request.getContextPath() + "/front-end" ;
     request.setAttribute("myPath", myPath);
     %>

    <!--footer -->
    <footer>
      <section class="footer footer_w3layouts_section_1its py-5">
        <div class="container py-lg-4 py-3">
          <div class="row footer-top">
            <div class="col-lg-3 col-sm-6 footer-grid_section_1">
              <div class="footer-title">
                <h3>地點資訊</h3>
              </div>
              <div class="row">
                <ul class="col-12 links">
                  <li>
                    <a href="https://www.google.com/maps?q=桃園市中壢區復興路46號9樓" target="_blank">地址:桃園市中壢區復興路46號9樓</a>
                  </li>
                  <li><a href="tel:02-1234-5678">電話:02-1234-5678</a></li>
                  <li>
                    <a href="mailto:triplight0411@gmail.com">信箱:triplight0411@gmail.com</a>
                  </li>
                  <li><a href="tel:02-1234-5678">傳真:02-1234-5678</a></li>
                </ul>
              </div>
            </div>
            <div class="col-lg-3 col-sm-6 footer-grid_section mt-sm-0 mt-4">
              <div class="footer-title">
                <h3>認識TripLight</h3>
              </div>
              <div class="row">
                <ul class="col-10 links">
                  <li><a href="#" class="scroll">關於我們</a></li>
                  <li>
                    <a href="#" class="scroll">使用者條款 </a>
                  </li>
                  <li>
                    <a href="#" class="scroll">隱私權保護政策</a>
                  </li>
                  <li><a href="#" class="scroll"> 常見問題與幫助</a></li>
                </ul>
              </div>
            </div>
            <div class="col-lg-3 col-sm-6 mt-lg-0 mt-4 footer-grid_section_1">
              <div class="footer-title">
                <h3>成為合作夥伴</h3>
              </div>
              <div class="row">
                <ul class="col-10 links">
                  <li>
                    <a href="#" class="scroll">成為供應商</a>
                  </li>
                  <li>
                    <a href="#" class="scroll">部落客/攝影師合作計畫</a>
                  </li>
                  <li>
                    <a href="#" class="scroll">團體客製規劃</a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="col-lg-3 col-sm-6 mt-lg-0 mt-4 footer-grid_section_1">
              <div class="footer-title"> 
                <h3>聯絡我們</h3>
              </div>
              <ul class="social_section_1info">
                <li>
                  <a href="https://www.facebook.com/TibaMe"><img src="${myPath}/images/facebook.svg" alt="facebook" /></a>
                </li>
                <li>
                  <a href="https://www.instagram.com/tibame_wiedu/"><img src="${myPath}/images/instagram.svg"
                         alt="instagram" /></a>
                </li>
                <li>
                  <a href="https://twitter.com/"><img src="${myPath}/images/twitter.svg" alt="twitter" /></a>
                </li>
                <li class="youtube">
                  <a href="https://www.youtube.com/channel/UClhecf7eOGHwbKW5e7l_pTA"><img src="${myPath}/images/youtube.svg"
                         alt="youtube" /></a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>
    </footer>
    <!-- //footer -->

    <!-- copyright -->
    <div class="copyright py-3 text-center">
      <p>COPYRIGHT © 2023 TripLight All rights reserved.</p>
    </div>
    <!-- //copyright -->