<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
			<td class="right">
			
			<% if (session.getAttribute("user_id") != null) {%>
				<% if (session.getAttribute("user_id").equals("admin")) { %> 		
					<a href="memberOne?user_id=${one.user_id}">
			<% }%>
			<% }%>
			${one.user_id}</td>
	</c:forEach>
</table>


</div>