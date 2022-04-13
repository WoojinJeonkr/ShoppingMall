
<!-- 
FAQ를 보여주는 jsp
(READ)
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>고객센터:FAQ</title>

<style>
	#title{background:blue; color:white; font-size:20px;}
	#ansewer{background:white; color:gray; font-size:10px; text-style:bold;}
	
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
</head>
<body>

	<div class="well", style="width:30%; height:150px; float:left;"><h1>FAQ</h1>	<p>자주 묻는 질문사항</p></div>
	<div class="well", style="width:70%; height:150px; float:left;">
		<div id="faqBtn"><a href="faqList"><h4>FAQ</h4></a></div>
		<div id="qnaBtn"><a href="serviceList"><h4>QnA</h4></a></div>
		<div id="qnaBtn"><h4>공지사항</h4></div>
	</div>

	<hr>
<table>			
	<c:forEach items="${list}" var="one">
		<tr>
			<td id="title">${one.service_faq_question}</td><!-- 자주 묻는 질문 -->
		</tr>
			<td id="answer">${one.service_faq_answer}</td><!-- 그에대한 답변 -->
	</c:forEach>
	
</table>
</body>
</html>