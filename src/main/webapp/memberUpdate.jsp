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
	$(document).ready(function() {
		$('#memberUp').click(function() {
			console.log('addMember click!');
			//비밀번호 변경 시-> 기존 비밀번호와 다른 비밀번호만 입력 가능.
			$.ajax({
				url : "memberModyPw",
				data : {
					'user_id' : $('#pw').val()
				},
				success : function(data) { //views아래에 있는 memberModyPw.jsp의 실행결과가 data에 담김.
					if (data == 0) {//
						$('#pwc1').text('사용할 수 없는 비밀번호 입니다');
						return false;
					}
				}//success
			})//ajax
			if ($('#pw').val() == '') {
				$('#pwc1').text('비밀번호를 입력해주세요');
				return false;
			} else if ($('#pw2').val() == '') {
				$('#pwc2').text('비밀번호 중복확인을 해주세요');
				return false;
			} else if ($('#pw').val() != $('#pw2').val()) {
				$('#pwc2').text('password가 일치하지 않습니다.');
				return false;
			} else {
				$('#pwc1').text('사용가능한 비밀번호 입니다');
			}
			if ($('#name').val() == '') {
				$('#nac').text('이름을 입력하세요.');
			} else {
				$('#form').submit();
			}
		})//#memberUp	

		///* 다시 한 번 누르면 text 내용을 없애주도록 구현.  */
		$('#pw2').click(function() {
			$('#pwc2').text('')
		})
		$('#pw').click(function() {
			$('#pwc1').text('')
		})
		$('#name').click(function() {
			$('#nac').text('')
		})
		// pw의 값이 변하면 아래의 checkPassword함수가 실행되도록 구현
		$("#pw").change(function() {
			checkPassword($('#pw').val());
		});
	});//document

	//비밀번호 유효성 검사 숫자/소문자/특수문자를 모두 포함한 pw만 가능.
	$("#pw").change(function() {//change=> pw의 값이 변경되었을 때 실행.
		checkPassword($('#pw').val());
	});
	function checkPassword(pw) {

		if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw)) {
			alert('비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.');
			//$('#pwc1').text('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.')
			$('#pw').val('').focus();
			//focus=>#pw가 선택되었을 때 실행되어, pw안에 들어있는 값을 지워준다.=> 유효성 검사를 통과한 pw만 쓰기 위한 과정
			//값을 지워주지 않았을 경우 회원가입하기 버튼을 누르면 회원가입이 완료되기 때문에 지워주어야 한다.
			return false;
		}//if
	}//function checkPassword(pw)
</script>
</head>
<body>
	<h3 class="active">회원수정</h3>
	<form action="memberUpdate" id="form">
		<table>

			<tr>
				<td class="left">아이디</td>
				<td class="right"><input class="form-control input-lg"
					type="text" name="user_id" id="id" value="${user_id}"
					readonly="readonly">
					<div id="idc"></div></td>
			</tr>
			<tr>
				<td class="left">패스워드</td>
				<td class="right"><input class="form-control input-lg"
					type="password" name="user_pw" id="pw"
					placeholder="영문,숫자합 8글자이상 써주세요">
					<div id="pwc1"></div></td>
			</tr>
			<tr>
				<td class="left">패스워드확인</td>
				<td class="right"><input class="form-control input-lg"
					type="password" name="pw2" id="pw2" placeholder="비밀번호를 재입력해주세요">
					<div id="pwc2"></div></td>
			</tr>
			<tr>
				<td class="left">이름</td>
				<td class="right"><input class="form-control input-lg"
					type="text" name="user_name" id="name" value="${user_name}"
					readonly="readonly">
					<div id="nac"></div></td>
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
			<!-- 		<tr>
						<td colspan="2">
						<button type="button" id="memberPwUp">비밀번호중복체크</button>
						</td>
					</tr> -->
			<tr>
				<td colspan="2">
					<button type="button" id="memberUp">회원수정</button>
				</td>
			</tr>
		</table>
	</form>
	<button type="button" id="cancel">회원수정취소</button>
	<hr>
	<div id="result"></div>


</body>
</html>