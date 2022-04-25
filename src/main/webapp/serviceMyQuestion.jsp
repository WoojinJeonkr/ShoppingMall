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

<div id="total">
	<div id="top">
		<jsp:include page="top.jsp"></jsp:include>
	</div>
	<div id="top2">
		<jsp:include page="top2.jsp"></jsp:include>
	</div>

	<div class="row" style="width: 1200px; margin: auto;">
		<h3>고객센터</h3>
		<div id="center">
			<div class="well" style="width: 30%; height: 150px; float: left;">
				<h1>QnA</h1>
				<p>1:1 고객상담</p>
			</div>
			<div class="well" style="width: 70%; height: 150px; float: left;">
				<div id="faqBtn">
					<h4>
						<a href="serviceMain.jsp">FAQ</a>
					</h4>
				</div>
				<div id="qnaBtn">
					<h4>
						<a href="serviceList.jsp">QnA</a>
					</h4>
				</div>
				<div id="NoticeBtn">
					<h4>
						<a href="serviceNoticeList">Notice</a>
					</h4>
				</div>
				<%
					if (session.getAttribute("user_id") != null) {
				%>
				<div id="myBtn">
					<h4>
						<a href="serviceMyQuestion.jsp">내 문의사항</a>
					</h4>
				</div>
				<%
					}
				%>
			</div>
		</div>
		<hr>

		<!-- 검색  -->

		<div id="result"></div>
	</div>

</div>

	<section class="contact-us">
		<div class="container">
			<div class="row">
				<div class="col-lg-8" style=" height:420px; ">
					<div id="map">
						<!-- You just need to go to Google Maps for your own map point, and copy the embed code from Share -> Embed a map section -->
						
						<div class="row">
							<div class="col-lg-4 offset-lg-1">
								<div class="contact-info" style=" width:200px; ">
									<div class="icon">
										<i class="fa fa-phone"></i>
									</div>
									<h4>Phone</h4>
									<span>010-020-0340</span>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="contact-info" style=" width:200px; ">
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