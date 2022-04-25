<!-- 회원정보 수정하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
						//return false;<-버튼이 submit일때만 return false가 작동. 필요없어서 막아놓음.
						//ajax의 data값이 0일때만(비밀번호 중복확인 완료) 아래	조건 실행.
						if ($('#pw').val() == '') {
							$('#pwc1').text('비밀번호를 입력해주세요');
						} else if ($('#pw2').val() == '') {
							$('#pwc2').text('비밀번호 중복확인을 해주세요');
						} else if ($('#pw').val() != $('#pw2').val()) {
							$('#pwc2').text('password가 일치하지 않습니다.');
						} else if ($('#name').val() == '') {
							$('#nac').text('이름을 입력하세요.');
						} else {
						//비밀번호 변경 시-> 기존 비밀번호와 다른 비밀번호만 입력 가능.
						$.ajax({
							url : "memberModyPw",//ajax 실행시 views아래에 있는 해당 url에 있는 result를 data에 넣음.
							data : {
								'user_id' : $('#id').val(),
								'user_pw' : $('#pw').val()
							//$('#pw').val()는 input에 있는 id="pw"와 이름이 같아야한다.
							//"user_id", "user_pw"는 컨트롤러의 memberModyPw멥핑에 값이 들어가기때문에 modyPw부분이랑 이름 맞춰주어야한다.
							},
							success : function(data) { //views아래에 있는 memberModyPw.jsp의 실행결과result가 data에 담김.
								if (data == '1') {//data=result(컨트롤러의 model의 result를 의미)
									$('#pwc1').text('사용할 수 없는 비밀번호 입니다');
								} else {
									$('#form').submit();
						}
					}//success
				})//ajax
			}//else
			
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
			//값을 지워주지 않았을 경우 수정하기 버튼을 누르면 회원수정이 완료되기 때문에 지워주어야 한다.
			return false;
		}//if
	}//function checkPassword(pw)
	
	//취소버튼 눌렀을 때 productList.jsp호출
	$(document).ready(function() {
		$('#cancel').click(function() {
			alert("회원수정 취소 하시겠습니까?");
			location.href = "productList.jsp";
		})
	});
</script>
</head>
<body>

<div id="top">
	<jsp:include page="/WEB-INF/views/myPage.jsp"></jsp:include>
</div>	

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
					type="text" name="user_name" id="name" value="${user_name}">
					<div id="nac"></div></td>
			</tr>

<%-- 		</table>
			<table border=2>
		<tr>
			<td class="left">아이디</td>
			<td class="left">이름</td>
			<td class="left">패스워드</td>
			<td class="left">전화번호</td>
			<td class="left">나이</td>
			<td class="left">주소</td>
			<td class="left">레벨</td>
			<td class="left">가입일</td>
		</tr>
		<c:forEach items="${list}" var="one">
		<!-- var="one"는  items="${list}"를 지칭해주는 말이다. ${list}를 one이라고 쓰겠다는 의미.-->
			<tr>
				<td class="right">${one.user_id}</td>
				<td class="right"><a href= "memberOne?user_id=${one.user_id}">${one.user_name}</a></td>
				<!-- 이름을 클릭하면 해당 아이디의 상세정보를 확인할 수 있도록 구현
				 href="views아래에 있는 상세정보jsp이름"?"유저아이디 객체 이름"-->
				<td class="right">${one.user_pw}</td>
				<td class="right">${one.user_tel}</td>
				<td class="right">${one.user_age}</td>
				<td class="right">${one.user_addr}</td>
				<td class="right">${one.level}</td>
				<td class="right">${one.user_date}</td>
			</tr>
		</c:forEach>
	</table> --%>
	<button type="button" id="memberUp">회원수정</button>
	<button type="button" id="cancel">회원수정취소</button>
	</form>
</body>
</html>