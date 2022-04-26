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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	
</script>
<style>
button {
	position: right;
}

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

<meta charset="UTF-8">
<title>${one.service_faq_question}</title>
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
						<div id="contact" style="width: 800px; margin: auto">
							<div class="row">
								<div class="col-lg-12">
									<div class="section-heading">
										<h4>${one.service_faq_question}</h4>
										<h6>관리자</h6>
									</div>
								</div>
								<div class="col-lg-12" id="box">
									<fieldset>
										<td class="right" colspan="3" height=300px>${one.service_faq_answer}
										</td>
										<fieldset>
								</div>

								<div class="col-lg-12">
									<fieldset>
										<td colspan="4"><a href="serviceNoticeList"><button
													style="margin-left: 10px;">목록</button></a> <!--  자기 글일때만  삭제, 수정 버튼 활성화. -->
											<%
												if (session.getAttribute("user_id") != null) {
											%> <!-- 유저아이디가 admin..즉 관리자인경우 답변하기 버튼 활성화 --> <%
 	if ((int) (session.getAttribute("user_level")) == 2) {
 %> <a href="serviceNoticeDelete?service_faq_idx=${one.service_faq_idx}"><button
													style="margin-left: 10px;">삭제</button></a> <a
											href="serviceNoticeUpdate2?service_faq_idx=${one.service_faq_idx}"><button
													style="margin-left: 10px;">수정</button></a> <%
 	}
 %> <%
 	}
 %>
										</tr>
									</fieldset>
								</div>
								</tr>
							</div>
						</div>
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
	</div>
</body>
</html>