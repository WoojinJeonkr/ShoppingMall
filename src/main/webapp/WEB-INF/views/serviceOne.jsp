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
<style>
button {
	position: right;
	margin-left: 10px;
	background: rgb(219, 138, 222)
}

#box {
	text-align: center;
	font-size: 20px;
	color: #7a7a7a;
	padding: 20px;
	margin: 10px;
	-webkit-border-radius: 15px;
	height: 150px;
	background-color: #f5ebf3;
}

.left {
	background: #dbdad5;
}
</style>

<meta charset="UTF-8">
<title>${one.service_title}</title>
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
										<h4>${one.service_title}</h4>
										<h6 style="display: inline;">${one.user_id}:</h6>
										<h6 style="display: inline;">${one.service_rgstday}</h6>
									</div>
								</div>
								<div class="col-lg-12" id="box">
									<fieldset>
										<td class="right" colspan="3" height=300px>${one.service_question}
										</td>
										<fieldset>
								</div>

								<div class="col-lg-12">
									<fieldset>
										<td colspan="4">
										<a href="serviceList.jsp"><button style="margin-left: 10px;">목록</button></a> 
											<% if (session.getAttribute("user_id") != null) { %>
											 <a href="serviceAnswer.jsp?service_idx=${one.service_idx}&service_id_origin=${one.service_id_origin}&service_idx_re=${one.service_idx_re}&service_reply_group=${one.service_reply_group}"><button
													id="Answer" style="margin-left: 10px;">답변하기</button></a></td>
													
										<c:if test="${user_id eq one.user_id || user_level == 2}">
											<a href="serviceDelete?service_idx=${one.service_idx}&service_id_origin=${one.service_id_origin}">
												<button style="margin-left: 10px;">삭제</button>
											</a>
											<c:if test="${user_id eq one.user_id}">
												<!--  수정 버튼 활성화. -->
												<a href="serviceUpdate2?service_idx=${one.service_idx}"><button
														style="margin-left: 10px;">수정</button></a>
											</c:if>
										</c:if>
										<% } %>
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