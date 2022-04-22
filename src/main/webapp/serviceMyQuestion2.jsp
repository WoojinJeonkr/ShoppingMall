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
	/* 	$(document).on('click', '#btnSearch', function(e){
	 e.preventDefault();
	 var url = "${pageContext.request.contextPath}/serviceSearch";
	 url = url + "?searchType=" + $("select[name='searchType']").val();
	 alert($("select[name='searchType']").val())
	 url = url + "&keyword=" + $('#keyword').val();
	 location.href = url;
	 console.log(url);

	 });	
	 */
	$(function() {
		$.ajax({
			url : "serviceSearch",
			data : {
				'searchType' : 'user_id',
				'keyword' : '${user_id}'
			},
			success : function(result) {
				$("#result").html(result);
			},
			error : function() {
				alert('실패');
			}
		});
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
<div id="top">
	<jsp:include page="/WEB-INF/views/myPage.jsp"></jsp:include>
</div>

<div id="result"></div>
