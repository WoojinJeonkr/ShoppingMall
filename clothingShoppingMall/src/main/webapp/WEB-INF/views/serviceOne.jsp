<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
<style>
button {
	position: right;
}

table {
	width: 800px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	padding: 10px;
}

#navii {
	width: 10%;
	float: left;
	background: gray;
}

#result {
	width: 90%;
	float: right;
}

.left {
	background: #dbdad5;
}
</style>

<meta charset="UTF-8">
<title>${one.serviceTitle}</title>
</head>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="../../top.jsp"></jsp:include>
		</div>
		<div id="top2">
			<jsp:include page="../../top2.jsp"></jsp:include>
		</div>
		<div id="center">

			<h3>글 상세 페이지</h3>
			<hr>
			<div id="navii">
				<a href="serviceMain.jsp"><div>FAQ</div></a> 
				<a href="serviceMain.jsp"><div>QnA</div></a>

			</div>
			<hr>
			<table>
				<tr>
					<td class="left">제목</td>
					<td class="right">${one.serviceTitle}</td>
					<td class="left">글쓴이</td>
					<td class="right">${one.serviceWriter}</td>
				</tr>
				<tr>
					<td class="left">등록일</td>
					<td class="right" colspan="3">${one.serviceRgstday}</td>
				</tr>
				<tr>
					<td class="left">내용</td>
					<td class="right" colspan="3" height=300px>${one.serviceQuestion}</td>
				</tr>
				
				
		
				<tr>
					<td colspan="4">
					
					
					<a href="serviceList"><button>목록</button></a> 
							<!--  자기 글일때만  삭제, 수정 버튼 활성화. -->
					<c:if test="${userName eq one.serviceWriter}">
						<a href="serviceDelete?serviceIdx=${one.serviceIdx}"><button>삭제</button></a> 
						<a href="serviceUpdate2?serviceIdx=${one.serviceIdx}"><button>수정</button></a>
					</c:if>
					<!-- 유저아이디가 admin..즉 관리자인경우 답변하기 버튼 활성화 -->
				 <% if (session.getAttribute("userId").equals("admin")) {    %>
						<a href="serviceAnswer.jsp"><button>답변하기</button></a></td>
					<%} %>
				</tr>
				
		
			</table>



			<hr>
		</div>
	</div>
</body>
</html>