<!-- 마이페이지구현할 부분 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<link rel="stylesheet" type="text/css" href="resources/css/project.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
</head>
<body>
<div id="top"><jsp:include page="../../top.jsp"></jsp:include></div>
	 
	<a href="orderHistory.jsp"><button style="width: 200px; height: 50px;" class="btn btn-success">주문내역조회</button></a><br>
	<a href="memberUpdate.jsp"><button style="width: 200px; height: 50px;" class="btn btn-success">회원수정</button></a><br>
	<a href="memberDelete.jsp"><button style="width: 200px; height: 50px;" class="btn btn-success">회원탈퇴</button></a><br>
	<a href="serviceMyQuestion2.jsp"><button style="width: 200px; height: 50px;" class="btn btn-success">내 문의 내역</button></a><br>
	<a href="logout"><button style="width:200px; height:50px;" class="btn btn-success" >로그아웃</button></a>
	
	
</body>
</html>