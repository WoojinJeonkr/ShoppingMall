<!-- 회원정보 수정하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<link rel="stylesheet" type="text/css" href="resources/css/project.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#addMember').click(function(){
		console.log('addMember click!');
		if($('#pw').val() != $('#pw2').val()){					
			alert('password가 일치하지 않습니다.');
		} 
		  else{
			$('#form').submit();
		}
	})	 
	
//비밀번호가 이전 비번이랑 같은지 아닌지 확인.
//비밀번호 변경 안할 시-> 그대로 변경 완료.
//비밀번호 변경 시-> 기존 비밀번호와 다른 비밀번호만 입력 가능.
$('#upMember').click(function() {
	alert('')
	$.ajax({
		url:"memberModyPw",
		data:{'pw':$('#user_pw').val()},
		success: function(data) { //views아래에 있는 memberModyPw.jsp의 실행결과가 data에 담김.
			alert(data)
			if(data == 1) {//이부분 수정해야함!!! 기존의 비번과 같은지 아닌지로 수정.
				alert("사용할 수 없는 비밀번호 입니다.")
			} else {
				alert("사용가능한 비밀번호 입니다.")
			}
		}
	})
})//upMember

});//$
</script>
</head>
<body>
<h3 class="active">회원수정</h3>
			<form action="memberUpdate" id="form">
				<table>
			
					<tr>
						<td class="left">이름</td>
						<td class="right"><input  class="form-control input-lg"  type="text" name="name" id="name"></td>
					</tr>
					<tr>
						<td class="left">패스워드</td>
						<td class="right"><input  class="form-control input-lg"  type="password" name="pw" id="pw"></td>
					</tr>
					<tr>
						<td class="left">패스워드확인</td>
						<td class="right"><input  class="form-control input-lg"  type="password" name="pw2" id="pw2"></td>
					</tr>
					<tr>
						<td class="left">전화번호</td>
						<td class="right"><input  class="form-control input-lg"  type="text" name="tel" id="tel"></td>
					</tr>
				
					<tr>
						<td class="left">주소</td>
						<td class="right"><input  class="form-control input-lg"  type="text" name="addr" id="addr"></td>
					</tr>
					<tr>
						<td colspan="2">
						<button type="button" id="upMember">회원수정</button>
						</td>
					</tr>
				</table>
			</form>
				<button  type="button" id="cancel">회원수정취소</button>
			<hr>
			<div id="result"></div>
			
			
</body>
</html>