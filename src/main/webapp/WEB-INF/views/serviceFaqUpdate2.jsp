<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

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

.left {
	background: #dbdad5;
}
</style>
</head>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="../../top.jsp"></jsp:include>
		</div>
		<div id="top2">
			<jsp:include page="../../top2.jsp"></jsp:include>
		</div>
		<section class="contact-us">
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
						<form id="contact" action="serviceFaqUpdate1" method="post"
							style="width: 800px; margin: auto">
							<input type="hidden" name="service_faq_idx" style="width: 300px;"
								value="${one.service_faq_idx}">
							<div class="row">
								<div class="col-lg-12">
									<div class="section-heading">
										<h6>Contact us</h6>
										<h4>
											글 <em>수정</em>
										</h4>
										<p>IF you need a working contact form by PHP script,
											please visit TemplateMo's contact page for more info.</p>
									</div>
								</div>
								<div class="col-lg-12">
									<fieldset>
										<select name="service_faq_category">
											<option value="주문결제" selected>주문결제</option>
											<option value="배송안내">배송안내</option>
											<option value="교환/환불">교환/환불</option>
											<option value="상품/회원관련">상품/회원관련</option>
										</select>
									</fieldset>
								</div>
								<div class="col-lg-12">
									<fieldset>
										<input type="text" name="service_faq_question"
											style="width: 300px;" value="${one.service_faq_question}"
											autocomplete="on" required>
									</fieldset>
								</div>
								<div class="col-lg-12">
									<fieldset>
										<input type="text" name="service_faq_answer"
											style="width: 300px; height: 300px;"
											value="${one.service_faq_answer}" required="">
									</fieldset>
								</div>
								<div class="col-lg-12">
									<fieldset>
										<button type="submit" id="btn" class="main-gradient-button">등록</button>
									</fieldset>
								</div>
							</div>
						</form>
					</div>
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
</body>
</html>