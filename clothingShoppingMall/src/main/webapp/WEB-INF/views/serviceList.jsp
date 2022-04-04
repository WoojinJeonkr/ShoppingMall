<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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

<div class="well"><h1>QnA</h1><p>1:1 고객상담</p></div>
<hr>
<table>
	<tr>
		<td class="left">index</td>
		<td class="left">title</td>
		<td class="left">writer</td>
	</tr>
	<c:forEach items="${list}" var="one">
		<tr>
			<td class="right">${one.serviceIdx}</td>
			<td class="right"><a href="serviceOne?serviceIdx=${one.serviceIdx}">${one.serviceTitle}</a></td>
			<td class="right">${one.serviceWriter}</td>
	</c:forEach>
</table>
<!-- 로그인했을때만 글쓰기가 나타나도록 -->
<% if (session.getAttribute("userId") != null) {     %> 

	<br>
	<a href="serviceWrite.jsp"><button>글쓰기</button></a>
<%}%> 