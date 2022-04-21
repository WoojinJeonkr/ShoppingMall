<!-- 관리자페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<link rel="stylesheet" type="text/css" href="resources/css/project.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>

<script type="text/javascript">
	//버튼 눌렀을 때 productList.jsp호출
	$(document).ready(function() {
		$('#mainPage').click(function() {
			location.href = "productList.jsp";
		})
	});
</script>
</head>
<body>
<h3>회원전체 검색</h3>
	<button type="button" id="mainPage">메인페이지로</button>
<a href="memberAdmin">
	<button>회원 전체검색</button>
</a>
	<table border=2>
		<tr>
			<td class="left">아이디</td>
			<td class="left">이름</td>
			<td class="left">패스워드</td>
			<td class="left">전화번호</td>
			<td class="left">나이</td>
			<td class="left">주소</td>
			<td class="left">레벨</td>
		</tr>
		<c:forEach items="${list}" var="one">
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
			</tr>
		</c:forEach>
	</table>
</body>
</html>