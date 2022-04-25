<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
table {
	width: 800px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	padding: 10px;
}

.left {
	background: #dbdad5;
}
</style>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#btn').click(function() {
			if ($('#tit').val() == '') {//아이디입력안했을 시 text 띄우기				
				alert("제목을 입력해주세요.");
				return false;
			} else if ($('#con').val() == '') {//아이디입력안했을 시 text 띄우기				
				alert("내용을 입력해주세요.");
				return false;
			} else {
				$('#form').submit();
			}

		});
	});
</script>
</head>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="top.jsp"></jsp:include>
		</div>
		<div id="top2">
			<jsp:include page="top2.jsp"></jsp:include>
		</div>

		<section class="contact-us">
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
						<form id="contact" action="serviceNoticeCreate" method="post"
							style="width: 800px; margin: auto">
							<input type="hidden" name="service_notice" style="width: 300px;"
								value="1" readonly="readonly">
							<div class="row">
								<div class="col-lg-12">
									<div class="section-heading">
										<h6>Contact us</h6>
										<h4>
											<em>공지사항 </em> 등록
										</h4>
										<p>IF you need a working contact form by PHP script,
											please visit TemplateMo's contact page for more info.</p>
									</div>
								</div>
								<div class="col-lg-12">
									<fieldset>
										<input type="text" name="service_faq_question" id="tit"
											placeholder="title" autocomplete="on" required>
									</fieldset>
								</div>
								<div class="col-lg-12">
									<fieldset>
										<input type="text" name="service_faq_answer"
											style="height: 300px" id="con" placeholder="content"
											required="">
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