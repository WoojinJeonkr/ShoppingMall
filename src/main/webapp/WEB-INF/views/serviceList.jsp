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
		<div id="NoticeBtn"><a href="serviceNoticeList"><h4>Notice</h4></a></div>
	</div>
</div>
<hr>

<!-- 검색  -->


<form action="serviceList">
	<select name="searchType" style="padding-right:10px; width:100px; float: left">
		<option value="service_title" selected >제목</option>
		<option value="user_id">작성자</option>
	</select>
	<input type="text" class="form-control form-control-sm" name="keyword" id="keyword" style="width:300px; float: left">
	<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch" >검색</button>
</form>
	
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
	if (session.getAttribute("user_id") != null) {
%>
<br>
<a href="serviceWrite.jsp"><button>글쓰기</button></a>
<%
	}
%>