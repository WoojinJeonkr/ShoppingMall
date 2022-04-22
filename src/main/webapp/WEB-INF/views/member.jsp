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

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<link rel="stylesheet" type="text/css" href="resources/css/project.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#login').click(function(){
		if($('#id').val() == ''){				
			$('#idc').text('아이디를 입력해주세요');
			return false
		} else if ($('#pw').val() == ''){		
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
		<% if(session.getAttribute("user_id") == null) { %><h3 class="active">회원 로그인</h3>
			
			<form action="memberCheck1" id="form1">
					<table>
					<tr>
						<td class="left">아이디</td>
						<td class="right"><input  class="form-control input-lg"  
						type="text" name="user_id" id="id"
						>
						<div id="idc"></div>
						</td>
					</tr>
					<tr>
						<td class="left">패스워드</td>
						<td class="right"><input  class="form-control input-lg"  
						type="password" name="user_pw" 
						id="pw">
						<div id="pwc"></div>
						</td>
					</tr>
					<tr>
						<td>
						<button  style="width:200px; height:50px;" class="btn btn-danger" type="submit" id="login">로그인하기</button>
						</td>
					</tr>
				</table>
			</form>
						<a href="memberCre.jsp"><button  style="width:200px; height:50px;" class="btn btn-danger">회원가입하기</button></a>
			
			
			<% } else {%>
			<script>
			alert("환영합니다~ 아이디가 ${user_id}로 로그인되었습니다.")
			location.href="productList.jsp";
			</script>

			<% } %>
		</div>
	</div>
</body>
</html>