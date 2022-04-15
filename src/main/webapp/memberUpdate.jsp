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
	$('#memberUp').click(function(){
		console.log('addMember click!');
		 if($('#pw').val() == ''){		
			$('#pwc1').text('비밀번호를 입력해주세요');
		} else if($('#pw2').val() == ''){		
			$('#pwc2').text('비밀번호 중복확인을 해주세요');
		} else if($('#pw').val() != $('#pw2').val()){					
			$('#pwc2').text('password가 일치하지 않습니다.');
		} else if($('#name').val() == ''){			
			$('#nac').text('이름을 입력하세요.');
		} else{
			$('#form').submit();
		}
		 
	})	
	///* 다시 한 번 누르면 text 내용을 없애주도록 구현.  */
	$('#pw2').click(function() {
	$('#pwc2').text('')
	})
	$('#pw').click(function() {
		$('#pwc1').text('')
	})
	$('#name').click(function() {
		$('#nac').text('')
});
	
//비밀번호가 이전 비번이랑 같은지 아닌지 확인.
//비밀번호 변경 안할 시-> 그대로 변경 완료.
//비밀번호 변경 시-> 기존 비밀번호와 다른 비밀번호만 입력 가능.
$('#memberPwUp').click(function() {
	if ($('#pw').val().length == 0) {
		$('#pwc').text('비밀번호를 입력해주세요')
	} else {
	/* 	alert($('#pw').val()) */
	$.ajax({
		url:"memberModyPw",
		data:{'user_pw':$('#pw').val()},
		success: function(data) { //views아래에 있는 memberModyPw.jsp의 실행결과가 data에 담김.
			if(data == 1) {//이부분 수정해야함!!! 기존의 비번과 같은지 아닌지로 수정.
				alert("기존과 다른 비밀번호를 입력해주세요.")
			} else {
				alert("사용가능한 비밀번호 입니다.")
			}
		}
	})
	}
})
});
</script>
</head>
<body>
<h3 class="active">회원수정</h3>
			<form action="memberUpdate" id="form">
				<table>
			
				<tr>
						<td class="left">아이디</td> 
						<td class="right"><input  class="form-control input-lg"  type="text" name="user_id" id="id" value="${user_id}" readonly="readonly">
						<div id="idc" ></div>
						</td>
					</tr>
					<tr>
						<td class="left">패스워드</td>
						<td class="right"><input  class="form-control input-lg"  type="password" name="user_pw" id="pw" placeholder="영문,숫자합 8글자이상 써주세요">
						<div id="pwc1" ></div>
						</td>
					</tr>
					<tr>
						<td class="left">패스워드확인</td>
						<td class="right"><input  class="form-control input-lg"  type="password" name="pw2" id="pw2" placeholder="비밀번호를 재입력해주세요">
						<div id="pwc2" ></div>
						</td>
					</tr>
					<tr>
						<td class="left">이름</td>
						<td class="right"><input  class="form-control input-lg"  type="text" name="user_name" id="name" value="${user_name}" readonly="readonly">
						<div id="nac" ></div>
						</td>
					</tr>
				<%-- 	<tr>//세션을 잡지않기 위해(용량차지많이하니까) 사용안함!!
						<td class="left">전화번호</td>
						<td class="right"><input  class="form-control input-lg"  type="text" name="user_tel" id="tel" value="${userTel}" readonly="readonly">
						<div id="tec" ></div>
						</td>
					</tr>
					<tr>
						<td class="left">나이</td>
						<td class="right"><input  class="form-control input-lg"  type="text" name="user_age" id="age" value="${userAge}" readonly="readonly">
						<div id="agec" ></div>
						</td>
					</tr>
					<tr>
						<td class="left">주소</td>
						<td class="right"><input  class="form-control input-lg"  type="text" name="user_addr" id="addr" value="${userAddr}" readonly="readonly">
						<div id="addrc" ></div>
						</td>
					</tr> --%>
					<tr>
						<td colspan="2">
						<button type="button" id="memberPwUp">비밀번호중복체크</button>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<button type="button" id="memberUp">회원수정</button>
						</td>
					</tr>
				</table>
			</form>
				<button  type="button" id="cancel">회원수정취소</button>
			<hr>
			<div id="result"></div>
			
			
</body>
</html>