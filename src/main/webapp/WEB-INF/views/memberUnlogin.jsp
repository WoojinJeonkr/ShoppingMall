<!--top.jsp의 마이페이지를 클릭했을시 비회원은 로그인페이지로 가도록 구현 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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