<!--top.jsp의 마이페이지를 클릭했을시 비회원은 로그인페이지로 가도록 구현 -->
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
<!-- member.css파일 -->	
<link rel = "stylesheet" type = "text/css" href = "resources/css/member.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	//alert("회원만 이용가능합니다!!!")구현
	$(function() {
		alert('회원만 이용가능합니다')
		location.href="productList.jsp";//상품리스트페이지로 이동
	})
	</script>
	</head>
	<body>
		<div id="total">
			<div id="top">
				<jsp:include page="../../top.jsp"></jsp:include>
			</div>

			<div id="center">
				<div id="dialog" title="Basic dialog">
				</div>
			</div>
		</div>
	</body>
	</html>