<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="resources/assets/css/fontawesome.css">
<link rel="stylesheet"
	href="resources/assets/css/templatemo-eduwell-style.css">
<link rel="stylesheet" href="resources/assets/css/owl.css">
<link rel="stylesheet" href="resources/assets/css/lightbox.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!--

TemplateMo 573 EduWell

https://templatemo.com/tm-573-eduwell

-->

<title>고객센터</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
	$(function() {
		$('#btnSearch').click(function() {
			$.ajax({
				url : "serviceSearch",
				data : {
					'searchType' : $("select[name='searchType']").val(),
					'keyword' : $('#keyword').val()
				},
				success : function(result) {
					$("#result").html(result);
				},
				error : function() {
					alert('실패');
				}
			});
		})
		$.ajax({
			url : "serviceList",
			success : function(list1) {
				$("#result").html(list1);
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

button {
	font-size: 10px;
	color: #fff;
	background: rgb(219, 138, 222);
	background: linear-gradient(-145deg, rgba(219, 138, 222, 1) 0%,
		rgba(246, 191, 159, 1) 100%);
	padding: 12px 10px;
	display: inline-block;
	border-radius: 5px;
	font-weight: 500;
	transition: all .3s;
	vertical-align: middle;
	width: 80px;
	height: 30px;
}
</style>
</head>

<div id="total">
	<div id="top">
		<jsp:include page="top.jsp"></jsp:include>
	</div>
	<div id="top2">
		<jsp:include page="top2.jsp"></jsp:include>
	</div>

	<div class="row" style="width: 1200px; margin: auto;">
		<h3>고객센터</h3>
		<div id="center" class="col-lg-12">
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
		<!-- 검색  -->
		<form action="serviceSearch" onsubmit="return false">
			<select name="searchType"
				style="padding-right: 10px; width: 100px; float: left; width: 80px; height: 30px;">
				<option value="service_title">제목</option>
				<option value="user_id">작성자</option>
			</select> <input type="text" class="form-control form-control-sm"
				name="keyword" id="keyword"
				style="width: 300px; height: 30px; float: left">
			<button type="submit" class="main-gradient-button" name="btnSearch"
				id="btnSearch">검색</button>
		</form>

		<div id="result"></div>
		<!-- 로그인했을때만 글쓰기가 나타나도록 -->

		<%
			if (session.getAttribute("user_id") != null) {
		%>
		<br>
		<div class="main-button-gradient">
			<a style="padding: 8px 20px;" href="serviceWrite.jsp">글쓰기</a>
		</div>
		<%
			}
		%>

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