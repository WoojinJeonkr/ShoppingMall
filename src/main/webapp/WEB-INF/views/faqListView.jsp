
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
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
</script>


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
	<table>			
		<c:forEach items="${list}" var="one">
		<div class="menu">
			
			<tr>
				<td id="title"><input name="RowCheck" type="checkbox" value="${one.service_faq_idx}" style="display:none"/></td><!-- 자주 묻는 질문 -->
				<td id="title">${one.service_faq_question}</td><!-- 자주 묻는 질문 -->
			</tr>
				<td id="answer" class="sub" colspan="2">${one.service_faq_answer}</td><!-- 그에대한 답변 -->
			</div> 
		</c:forEach>
		
		
		<p> 나오고있는거임<p>
	</table>
</body>
</html>