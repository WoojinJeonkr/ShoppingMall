<!-- 마이페이지구현할 부분 -->
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
			style="border-radius: 6px 6px 6px 6px; width: 200px; margin-left: 330px; height: 60px;">주문내역조회</button></a>
	<a href="memberUpdate.jsp"><button class="btn btn-default"
			style="border-radius: 6px 6px 6px 6px; width: 200px; height: 60px;">회원수정</button></a>
	<a href="memberDelete.jsp"><button class="btn btn-default"
			style="border-radius: 6px 6px 6px 6px; width: 200px; height: 60px;">회원탈퇴</button></a>
	<a href="serviceMyQuestion2.jsp"><button class="btn btn-default"
			style="border-radius: 6px 6px 6px 6px; width: 200px; height: 60px;">내 문의 내역</button></a>

</body>
</html>