<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<script>
	$(document).on('click', '#btnSearch', function(e){

		e.preventDefault();

		var url = "${pageContext.request.contextPath}/serviceList";

		url = url + "?searchType=" + $('#searchType').val();

		url = url + "&keyword=" + $('#keyword').val();

		location.href = url;

		console.log(url);

	});	

</script>


<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
</style>
<div class="well" , style="width: 30%; height: 150px; float: left;">
	<h1>QnA</h1>
	<p>1:1 고객상담</p>
</div>
<div class="well" , style="width: 70%; height: 150px; float: left;">
	<div id="faqBtn">
		<a href="faqList"><h4>FAQ</h4></a>
	</div>
	<div id="qnaBtn">
		<a href="serviceList"><h4>QnA</h4></a>
	</div>
	<div id="noticeBtn">
		<h4>공지사항</h4>
	</div>
</div>
<hr>
<div class="form-group row justify-content-center">
			<div class="w100" style="padding-right:10px; width:100px; float: left">
				<select class="form-control form-control-sm" name="searchType" id="searchType">
					<option value="title">제목</option>
					<option value="reg_id">작성자</option>
				</select>
			</div>

			<div class="w300" style="padding-right:10px; width:300px ; float: left">
			<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
			</div>
			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
			</div>
		</div>


<table>
	<tr>
		<td class="left">index</td>
		<td class="left">title</td>
		<td class="left">writer</td>
	</tr>
	<c:forEach items="${list}" var="one">
		<tr>
			<td class="right">${one.service_idx}</td>
			<td class="right"><a
				href="serviceOne?service_idx=${one.service_idx}">${one.service_title}</a></td>
			<td class="right">${one.user_id}</td>
	</c:forEach>
</table>
<!-- 로그인했을때만 글쓰기가 나타나도록 -->

<%
	if (session.getAttribute("userId") != null) {
%>
<br>
<a href="serviceWrite.jsp"><button>글쓰기</button></a>
<%
	}
%>