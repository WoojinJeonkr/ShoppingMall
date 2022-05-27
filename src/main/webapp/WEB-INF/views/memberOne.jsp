<!-- 관리자페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<link rel="stylesheet" type="text/css" href="resources/css/project.css">
<!-- member.css파일 -->
<link rel="stylesheet" type="text/css" href="resources/css/member.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#memberUp').click(function() {
			console.log('addMember click!');

			if ($('#pw').val() == '') {
				alert("비밀번호를 입력하세요");
			} else if ($('#id').val() == '') {
				alert("아이디를 입력하세요");
			} else if ($('#name').val() == '') {
				alert("이름을 입력하세요");
			} else {
				$('#form').submit();
			}
		})//#memberUp	
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- <body bgcolor="skyblue"> -->
<body>
	<br>
	<h3>회원상세정보입니다</h3>
	<table border=2>
		<tr>
			<td>아이디</td>
			<td>${one.user_id}</td>
			<!-- one.getId -->
		</tr>
		<tr>
			<td>이름</td>
			<td>${one.user_name}</td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td>${one.user_pw}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${one.user_tel}</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>${one.user_age}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${one.user_addr}</td>
		</tr>
		<tr>
			<td>레벨</td>
			<td>${one.level}</td>
		</tr>
	</table>
	<br>
	<br>
	<h3>회원 수정</h3>
	<form action="memberAdUpdate" id="form">
		<table>
			<tr>
				<td class="left">이름</td>
				<td class="right"><input class="form-control input-lg"
					type="text" name="user_name" id="name" value="${one.user_name}">
				</td>
			</tr>
			<tr>
				<td class="left">패스워드</td>
				<td class="right"><input class="form-control input-lg"
					type="text" name="user_pw" id="pw" value="${one.user_pw}">
				</td>
			</tr>
		</table>
		<button type="button" class="btn btn-info" style="border-radius: 6px 6px 6px 6px; width: 200px; id="memberUp">
			회원수정
		</button>
		</br> 
		<br>
		<br>
		<h3>회원삭제</h3>
		<form action="memberAdDelete">
			<p>해당아이디를 탈퇴시키겠습니까?</p>
			<input type="text" name="user_id" value="${one.user_id}" readonly="readonly">
				<br>
			<button class="btn btn-info" style="font-size:20px;">
				회원삭제
			</button>
		</form>
	</form>
</body>
</html>
