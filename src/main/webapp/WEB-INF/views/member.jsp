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
<!-- member.css파일 -->
<link rel="stylesheet" type="text/css" href="resources/css/member.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#login').click(function() {
			if ($('#id').val() == '') {
				$('#idc').text('아이디를 입력해주세요');
				return false
			} else if ($('#pw').val() == '') {
				$('#pwc').text('비밀번호를 입력해주세요');
				return false
			}
		})
	});
</script>
</head>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="../../top.jsp"></jsp:include>
		</div>
		<div id="center">
		<%
			if (session.getAttribute("user_id") == null) {
		%>
		<br/>
		<h3 class="active" style="margin-left:250px">회원로그인</h3>
		<br>
		<form action="memberCheck1" id="form1">
			<table>
				<tr>
					<td class="left">아이디</td>
					<td class="right"><input class="form-control input-lg" type="text" name="user_id" id="id">
						<div id="idc"></div></td>
				</tr>
				<tr>
					<td class="left">패스워드</td>
					<td class="right"><input class="form-control input-lg" type="password" name="user_pw" id="pw">
						<div id="pwc" class="col-lg-12"></div></td>
				</tr>
				<tr>
					<td>
						<button type="submit" id="login" class="btn btn-info" style="font-size:20px; margin-left:80px">로그인하기</button>
					</td>
					<td>
						<button type="button" class="btn btn-info" style="font-size:20px; margin-right:20px" onclick="location.href='memberCre.jsp';">회원가입하기</button>
					</td>
				</tr>
			</table>
		</form>
		<% 
			} else { 
		%>
		<script>
			alert("환영합니다~ 아이디가 ${user_id}로 로그인되었습니다.")
			location.href = "productList.jsp";
		</script>
		<%
			}
		%>
		</div>
	</div>
</body>
</html>