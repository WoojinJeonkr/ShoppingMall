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
		$('#btnSearch').click(function() {
			$.ajax({
				url : "serviceSearch",
				data : {
					'searchType' : $("select[name='searchType']").val(),
					'keyword' : $('#keyword').val()
				},
				success : function(result) {
					$("#result").html(result);
				},
				error : function() {
					alert('실패');
				}
			});
		})
		$.ajax({
			url : "serviceList",
			success : function(list1) {
				$("#result").html(list1);
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


<div id="total">
	<div id="top">
		<jsp:include page="top.jsp"></jsp:include>
	</div>
	<div id="top2">
		<jsp:include page="top2.jsp"></jsp:include>
	</div>
	<h3>고객센터</h3>
	<div id="center">
		<div class="well" , style="width: 30%; height: 150px; float: left;">
			<h1>QnA</h1>
			<p>1:1 고객상담</p>
		</div>
		<div class="well" , style="width: 70%; height: 150px; float: left;">
			<div id="faqBtn">
				<a href="serviceMain.jsp"><h4>FAQ</h4></a>
			</div>
			<div id="qnaBtn">
				<a href="serviceList.jsp"><h4>QnA</h4></a>
			</div>
			<div id="NoticeBtn">
				<a href="serviceNoticeList"><h4>Notice</h4></a>
			</div>
			<% if( session.getAttribute("user_id") != null) { %>
			<div id="myBtn">
				<a href="serviceMyQuestion.jsp"><h4>내 문의사항</h4></a>
			</div>
			<% } %>
		</div>

	</div>
	<hr>

	<!-- 검색  -->


	<form action="serviceSearch" onsubmit="return false">
		<select name="searchType"
			style="padding-right: 10px; width: 100px; float: left; width:80px;height:30px;">
			<option value="service_title">제목</option>
			<option value="user_id">작성자</option>
		</select> 
		<input type="text" class="form-control form-control-sm"
			name="keyword" id="keyword" style="width: 300px; height:30px;float: left">
		<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch" style="width: 50px; height:30px;">검색</button>
	</form>

	<div id="result"></div>
	<!-- 로그인했을때만 글쓰기가 나타나도록 -->

	<%
		if (session.getAttribute("user_id") != null) {
	%>
	<br> <a href="serviceWrite.jsp"><button>글쓰기</button></a>
	<%
		}
	%>


</div>