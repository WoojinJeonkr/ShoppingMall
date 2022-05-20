<!-- 마이페이지구현할 부분 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<!-- member.css파일 -->
<link rel="stylesheet" type="text/css" href="resources/css/member.css">

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
<!-- member.css파일 -->
<link rel="stylesheet" type="text/css" href="resources/css/member.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
</head>
<body>
	<div id="top"><jsp:include page="../../top.jsp"></jsp:include></div>

	<a href="orderHistory.jsp"><button class="btn btn-default"
			style="border-radius: 6px 6px 6px 6px; width: 200px; margin-left: 400px; height: 60px;">주문내역조회</button></a>
	<a href="memberUpdate.jsp"><button class="btn btn-default"
			style="border-radius: 6px 6px 6px 6px; width: 200px; height: 60px;">회원수정</button></a>
	<a href="memberDelete.jsp"><button class="btn btn-default"
			style="border-radius: 6px 6px 6px 6px; width: 200px; height: 60px;">회원탈퇴</button></a>
	<a href="serviceMyQuestion2.jsp"><button class="btn btn-default"
			style="border-radius: 6px 6px 6px 6px; width: 200px; height: 60px;">내
			문의 내역</button></a>

	<!-- 상품추천구현 코사인유사도,SVD로 구한 유사유저들이 구매한 상품 중 구매비율이 높은 상품 추천. -->
	<p></p>
	<h3 style="margin-left: 630px;">${user_id}님 이상품은 어떠신가요?</h3>
	<p></p>
	<!-- 상품이미지, 상품이름, 상품가격 띄우기.-->
	<table border="1" style="margin-left: 350px;">
		<tr>
			<td><img onclick="javascript:newin=window.open('about:blank'); newin.location.href='http://localhost:8080/clothingStore/productOne?product_idx=244&product_img=mantoman.jpg&likecheck=0'" style="cursor: pointer; width: 100px;" src="resources/img/mantoman.jpg"></td>
			<td>[추천1위] 빅 트위치 루즈핏 크루넥 네이비</td>
		</tr>
		<tr>
			<td style="text-align:center";><img onclick="javascript:newin=window.open('about:blank'); newin.location.href='http://localhost:8080/clothingStore/productOne?product_idx=246&product_img=mantoman.jpg&likecheck=0'" style="cursor: pointer; width: 100px;" src="resources/img/blouse.jpg"></td>
			<td>[추천2위] [정호연 착용]여 J218885 YAF화이트 스트레이트핏 모노그램 로고 반팔 티셔츠</td>
		</tr>
		<tr>
			<td><img onclick="javascript:newin=window.open('about:blank'); newin.location.href='http://localhost:8080/clothingStore/productOne?product_idx=246&product_img=mantoman.jpg&likecheck=0'" style="cursor: pointer; width: 100px;" src="resources/img/blouse.jpg"></td>
			<td>[추천3위] 헤비웨이트 오버사이즈 스웨트셔츠 [블랙]</td>
		</tr>
	</table>
<!-- 	<div class="product_left">
		<span style="margin-left: 600px;">[추천1위] 빅 트위치 루즈핏 크루넥 네이비</span>
		<p></p>
		<img onclick="javascript:newin=window.open('about:blank'); newin.location.href='http://localhost:8080/clothingStore/productOne?product_idx=244&product_img=mantoman.jpg&likecheck=0'" style="cursor: pointer; width: 100px; margin-left: 600px;" src="resources/img/mantoman.jpg">
	</div>
	
	<div class="product_left">
		<span style="margin-left: 600px;">[추천2위] [정호연 착용]여 J218885 YAF
			화이트 스트레이트핏 모노그램 로고 반팔 티셔츠</span>
		<p></p>
		<img onclick="javascript:newin=window.open('about:blank'); newin.location.href='http://localhost:8080/clothingStore/productOne?product_idx=299&product_img=tshirts.jpg&likecheck=0'" style="cursor: pointer; width: 100px; margin-left: 600px;" src="resources/img/tshirts.jpg">
	</div>
	
	<div class="product_left">
		<span style="margin-left: 600px;">[추천3위] 헤비웨이트 오버사이즈 스웨트셔츠 [블랙]</span>
		<p></p>
		<img onclick="javascript:newin=window.open('about:blank'); newin.location.href='http://localhost:8080/clothingStore/productOne?product_idx=246&product_img=mantoman.jpg&likecheck=0'" style="cursor: pointer; width: 100px; margin-left: 600px;" src="resources/img/blouse.jpg">
	</div> -->

</body>
</html>