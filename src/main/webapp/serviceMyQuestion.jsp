<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
	/* 	$(document).on('click', '#btnSearch', function(e){
	 e.preventDefault();
	 var url = "${pageContext.request.contextPath}/serviceSearch";
	 url = url + "?searchType=" + $("select[name='searchType']").val();
	 alert($("select[name='searchType']").val())
	 url = url + "&keyword=" + $('#keyword').val();
	 location.href = url;
	 console.log(url);

	 });	
	 */
	$(function() {
		$.ajax({
			url : "serviceSearch",
			data : {
				'searchType' : 'user_id',
				'keyword' : '${user_id}'
			},
			success : function(result) {
				$("#result").html(result);
			},
			error : function() {
				alert('실패');
			}
		});
	});
</script>


<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
</style>
<div class="row" style="width: 1200px; margin: auto;">
	<div id="total">
		<div id="top">
			<jsp:include page="top.jsp"></jsp:include>
		</div>
		<div id="top2">
			<jsp:include page="top2.jsp"></jsp:include>
		</div>
		<div class="row" style="width: 1200px; margin: auto;">
			<div id="center">
				<section class="page-heading">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="header-text">
									<h4>What We Do</h4>
									<h1>Our Services</h1>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section class="services">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="section-heading">
									<h6>공지 사항</h6>
									<h4>
										<em>N</em>otice
									</h4>
								</div>
							</div>
							<div class="col-lg-12"
								style="overflow: visible; width: 800px; margin: auto; text-align: center;">
								<div class="owl-service-item owl-carousel"
									style="display: inline-block; width: 800px; margin: auto; text-align: center;">
									<div class="item" style="width: 200px; float: left;">
										<div class="service-item">
											<div class="icon">
												<img src="resources/assets/images/service-icon-01.png"
													alt="">
											</div>
											<h4>
												<a href="serviceMain.jsp" style="color: #dc8cdb">FAQ</a>
											</h4>

										</div>
									</div>
									<div class="item" style="width: 200px; float: left">
										<div class="service-item">
											<div class="icon">
												<img src="resources/assets/images/service-icon-02.png"
													alt="">
											</div>
											<h4>
												<a href="serviceList.jsp" style="color: #dc8cdb">QnA</a>
											</h4>

										</div>
									</div>
									<div class="item" style="width: 200px; float: left">
										<div class="service-item">
											<div class="icon">
												<img src="resources/assets/images/service-icon-03.png"
													alt="">
											</div>
											<h4>
												<a href="serviceNoticeList" style="color: #dc8cdb">Notice</a>
											</h4>
										</div>
									</div>

									<div class="item" style="width: 200px;">
										<div class="service-item">
											<div class="icon">
												<img src="resources/assets/images/service-icon-04.png"
													alt="">
											</div>
											<h4>
												<%
													if (session.getAttribute("user_id") != null) {
												%>
												<a href="serviceMyQuestion.jsp" style="color: #dc8cdb">
													<%
														} else {
													%> <a href="member"> <%
 	}
 %> MyQuestion
												</a>
											</h4>
											<%
												if (session.getAttribute("user_id") == null) {
											%>
											<p>로그인후 사용가능</p>
											<%
												}
											%>

										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- 검색  -->

				<div id="result"></div>
			</div>
		</div>
	</div>
</div>

<section class="contact-us">
	<div class="container">
		<div class="row">
			<div class="col-lg-8" style="height: 420px;">
				<div id="map">
					<!-- You just need to go to Google Maps for your own map point, and copy the embed code from Share -> Embed a map section -->

					<div class="row">
						<div class="col-lg-4 offset-lg-1">
							<div class="contact-info" style="width: 200px;">
								<div class="icon">
									<i class="fa fa-phone"></i>
								</div>
								<h4>Phone</h4>
								<span>010-020-0340</span>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="contact-info" style="width: 200px;">
								<div class="icon">
									<i class="fa fa-phone"></i>
								</div>
								<h4>Mobile</h4>
								<span>090-080-0760</span>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4"></div>
			<div class="col-lg-12">
				<ul class="social-icons">
					<li><a href="#"><i class="fa fa-facebook"></i></a></li>
					<li><a href="#"><i class="fa fa-twitter"></i></a></li>
					<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
					<li><a href="#"><i class="fa fa-rss"></i></a></li>
					<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
				</ul>
			</div>
			<div class="col-lg-12">
				<p class="copyright">
					Copyright © 2022 EduWell Co., Ltd. All Rights Reserved. <br>Design:
					<a rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a>
				</p>
			</div>
		</div>
	</div>
</section>
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="resources/assets/js/isotope.min.js"></script>
<script src="resources/assets/js/owl-carousel.js"></script>
<script src="resources/assets/js/lightbox.js"></script>
<script src="resources/assets/js/tabs.js"></script>
<script src="resources/assets/js/video.js"></script>
<script src="resources/assets/js/slick-slider.js"></script>
<script src="resources/assets/js/custom.js"></script>
<script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
          e.preventDefault();
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>