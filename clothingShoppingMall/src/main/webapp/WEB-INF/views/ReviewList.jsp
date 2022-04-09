<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
</style>
<body>
<!-- 후기 작성 -->
<div id="review">
	<!-- 비회원의 경우 -->
	<c:if test="${member == null}">
		<p>후기를  남기시려면 <a href="">로그인</a>해주세요</p>
	</c:if>
	
	<!-- 회원의 경우 -->
	<c:if test="${member != null}"> <!-- 조건 설정 -->
	<section class="reviewForm">
		<form role="form" method="post" autocomplete="off">
			<input type="hidden" name="product_idx" value="${view.product_idx}">
			<div class="input_area">
		    	<textarea name="review_context" id="review_context"></textarea>
			</div>
		</form>
	</section>
	</c:if>
	
	<!-- 후기 목록 -->
	<section class="reviewList">
		<ol>
			<li>후기 목록</li>
		</ol>    
	</section>
</div>
</body>