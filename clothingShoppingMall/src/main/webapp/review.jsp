<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section.reviewForm {padding:30px 0;}
	section.reviewForm div.input_area {margin:10px 0;}
	section.reviewForm textarea {font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px;}
	section.reviewForm button {font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc;}
	 
	section.reviewList {padding:30px 0;}
	section.reviewList ol { padding:0; margin:0;}
	section.reviewList ol li {padding:10px 0; border-bottom:2px solid #eee;}
	section.reviewList div.userInfo {}
	section.reviewList div.userInfo .userId {font-size:24px; font-weight:bold;}
	section.reviewList div.userInfo .date {color:#999; display:inline-block; margin-left:10px;}
	section.reviewList div.reviewContent {padding:10px; margin:20px 0;}
</style>
</head>
<body>
<!-- 후기 시작 -->
<div id = "review">
	<!-- 비회원의 경우 -->
	<c:if test="${member == null}">
		<p> 후기를 남기시려면 <a href="member.jsp">로그인</a>해주세요</p>
	</c:if>
	
	<!-- 회원의 경우 -->
	<c:if test="${member != null}">
	<section class="reviewForm">
		<form role="form" method="post" autocomplete="off">
			<input type="hidden" name="product_idx" value="${view.product_idx}">
			<div class="input_area">
				<textarea name="review_Content" id="review_Content"></textarea>
			</div>
				
			<div class="input_area">
				<button type="submit" id="review_btn">후기 등록</button>
			</div>
		</form>
	</section>
	</c:if>
	
	<!-- 작성한 후기 목록 보여주기 -->
	<section class="reviewList">
		<ol>
			<c:forEach items="${review}" var="review">
			<li>
				<div class="userInfo">
					<span class="userId">${reply.user_id}</span>
       				<span class="date"><fmt:formatDate value="${review.review_rgstdate}" pattern="yyyy-MM-dd" /></span>
      			</div>
      			<div class="reviewContent">${review.review_content}</div>
			</li>
			</c:forEach>
		</ol>
	</section>
</div>
<!-- 후기 끝 -->
</body>
</html>