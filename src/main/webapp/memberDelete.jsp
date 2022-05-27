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
<script type="text/javascript">
	$(document).ready(function() {
		$('#delete').click(function() {
			alert('정말로 회원탈퇴 하시겠습니까?')
		})
	});
</script>
</head>
<body>
	<hr>
	<%
		if (session.getAttribute("user_id") != null) {
	%>
	<form action="memberDelete">
		<!-- 컨트롤러의 memberDelete 로 간다.-->
		<input type="hidden" name="user_id" value="${user_id}"><br>
		<h3>
		정말로 회원을 탈퇴하시겠습니까?
		</h3>
		<br>
		<p style="text-align: center; font-size:20px">
		<button class="btn btn-info" style="font-size:20px; text-align: center;">탈퇴하기</button>
		</p>
	</form>
	<%
		} else {
	%>
	로그인을 먼저 해주세요.
	<%
		}
	%>

</body>
</html>