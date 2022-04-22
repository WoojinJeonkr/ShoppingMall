<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:300,300,400,500,700,900"
	rel="stylesheet">

<!-- Additional CSS Files -->
<header id="header">
	<div class="container-fluid">
		<div class="navbar">
			<div class="navigation-row">
				<nav id="navigation">
					<button type="button" class="navbar-toggle">
						<i class="fa fa-bars"></i>
					</button>
					<div class="nav-box navbar-collapse">
						<!-- 메뉴 구성(수정 부분) : 로그인, 마이페이지, 장바구니, 상품 목록, 고객센터 -->
						<ul class="navigation-menu nav navbar-nav navbars" id="nav">

							<!-- 비로그인시 '로그인'이 보이도록, 로그인이 된 상태이면 '로그아웃'이 보이도록 구현 -->
							<li style = "font-size:medium;">
							<% if(session.getAttribute("user_id") == null) { %><a href="member?user_id=${user_id}">로그인</a>
							<% } else { %>
								<a href="logout">로그아웃</a><!-- 컨트롤러의RequestMapping이 logout인 곳으로 감. -->
							<% } %></li>
							<!-- 유저level이2이면 '관리자페이지'가 뜨도록, 유저level이 그 외 이면 '마이페이지'가 뜨도록 구현 -->
							<li style = "font-size:medium;">
							<% if((session.getAttribute("user_level")) == null) { %><a href="myPage?user_id=${user_id}">마이페이지</a>
							<% } else if((int)(session.getAttribute("user_level")) == 2) { %>
								<a href="myPage?user_id=${user_id}">회원관리</a><!-- 컨트롤러의RequestMapping이 myPage인 곳으로 감. -->
							<% } else {%>
								<a href="myPage?user_id=${user_id}">마이페이지</a>
							<% } %></li>
							<li style = "font-size:medium;"><a href="">공공데이터</a></li>
							<li style = "font-size:medium;"><a href="productList.jsp?user_id=${user_id}">상품정보</a></li>
							<li style = "font-size:medium;"><a href="myLike.jsp?user_id=${user_id}">좋아요</a></li>
							<li style = "font-size:medium;"><a href="basket.jsp?user_id=${user_id}">장바구니</a></li>
							<li style = "font-size:medium;"><a href="serviceMain.jsp">고객센터</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
