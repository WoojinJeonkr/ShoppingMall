<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/project.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
</script>

<style>
td {
	background: white;
	height: 30px;
}
</style>
</head>
<body>
<div id = "total">
	<div id = "top">
		<jsp:include page="../../top.jsp"></jsp:include>
	</div>
	<div id = "center">
	<br>
			<p>성공적으로 완료되었습니다.</p>
			<br><a href="productList.jsp">
				<button class="btn btn-light">상품 목록으로</button>
			</a>
	</div>
</div>
</body>
</html> 