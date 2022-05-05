<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<script type="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="resources/assets/css/fontawesome.css">
<link rel="stylesheet" href="resources/assets/css/templatemo-eduwell-style.css">
<link rel="stylesheet" href="resources/assets/css/owl.css">
<link rel="stylesheet" href="resources/assets/css/lightbox.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!--

TemplateMo 573 EduWell

https://templatemo.com/tm-573-eduwell

-->
</head>

<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav class="main-nav">
					<!-- ***** Logo Start ***** -->
					<!--<a href="index.html" class="logo"> <img
						src="assets/images/templatemo-eduwell.png" alt="EduWell Template">
					</a> -->
					<!-- ***** Logo End ***** -->
					<!-- ***** Menu Start ***** -->
					<ul class="nav">
						<li style="font-size: medium;">
							<%
								if (session.getAttribute("user_id") == null) {
							%><a href="member?user_id=${user_id}">로그인</a> <%
 	} else {
 %> <a href="logout">로그아웃</a> <%
 	}
 %>
						</li>
						<li style="font-size: medium;">
							<%
								if ((session.getAttribute("user_level")) == null) {
							%><a href="myPage?user_id=${user_id}">마이페이지</a> <%
 	} else if ((int) (session.getAttribute("user_level")) == 2) {
 %><a href="myPage?user_id=${user_id}">회원관리</a> <%
 	} else {
 %><a href="myPage?user_id=${user_id}">마이페이지</a> <%
 	}
 %>
						</li>
						<li style="font-size: medium;"><a
							href="productList.jsp?user_id=${user_id}">상품정보</a></li>
						<li style="font-size: medium;"><a
							href="myLikeList.jsp?user_id=${user_id}">좋아요</a></li>
						<li style="font-size: medium;"><a
							href="basket.jsp?user_id=${user_id}">장바구니</a></li>
						<li style="font-size: medium;"><a href="serviceMain.jsp">고객센터</a></li>
						<li style="font-size: medium;"><a href="statistics.jsp">통계</a></li>
					</ul>
					<a class='menu-trigger'> <span>Menu</span>
					</a>
					<!-- ***** Menu End ***** -->
				</nav>
			</div>
		</div>
	</div>
</header>
<section class="page-heading" style="margin-top: 130px;">
    <div class="container">
      <div class="row">
        <div class="col-lg-12" >
        </div>
      </div>
    </div>
  </section>
