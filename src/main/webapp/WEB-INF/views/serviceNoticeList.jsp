

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
	
</script>
<meta charset="UTF-8">
<title>공지사항:Notice</title>

<style>
table {
	width: 100%;
	border-collapse: collapse;
	border-top: 3px solid #ff75b3;
}

#one {
	color: #ffffff;
	background: linear-gradient(-145deg, rgba(219, 138, 222, 1) 0%,
		rgba(246, 191, 159, 1) 100%) !important;
}

th, td {
	padding: 10px;
	border-bottom: 2px solid #ff75b3;
	padding: 10px;
}

th:first-child, td:first-child {
	border-left: 0;
}

th:last-child, td:last-child {
	border-right: 0;
}

.right>a:link {
	color: pink;
	text-decoration: none;
}

.right>a:visited {
	color: gray;
	text-decoration: none;
}

.right>a:hover {
	color: red;
	text-decoration: underline;
}

.right>a:active {
	color: green;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="row" style="width: 1200px; margin: auto;">
		<div id="total">
			<div id="top">
				<jsp:include page="../../top.jsp"></jsp:include>
			</div>
			<div id="top2">
				<jsp:include page="../../top2.jsp"></jsp:include>
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
														%> <a href="member" style="color: #dc8cdb"> <%
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
										<%
											if (session.getAttribute("user_id") != null) {
										%>
										<c:if test="${user_level == 2}">
											<div class="item" style="width: 200px;">
												<div class="service-item">
													<div class="icon">
														<img src="resources/assets/images/service-icon-03.png"
															alt="">
													</div>
													<h4>

														<a href="serviceStatistics" style="color: #dc8cdb"> Statistics </a>
										</c:if>
										<%
											}
										%>
									</div>
								</div>
							</div>
						</div>
					</section>
					<table>
						<tr id="one">
							<td class="left">index</td>
							<td class="left">title</td>
							<td class="left">writer</td>
						</tr>
						<c:forEach items="${list}" var="one">
							<tr>
								<td class="right">${one.service_faq_idx}</td>
								<td class="right"><a
									href="serviceNoticeOne?service_faq_idx=${one.service_faq_idx}">${one.service_faq_question}</a></td>
								<td class="right">관리자</td>
						</c:forEach>
					</table>
					<%
						if (session.getAttribute("user_id") != null) {
					%>
					<%
						if ((int) (session.getAttribute("user_level")) == 2) {
					%>
					<a href="servicecenterNoticeCreate.jsp"><button>공지사항
							쓰기</button></a>
					<%
						}
					%>
					<%
						}
					%>

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
</body>
</html>