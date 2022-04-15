

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
</script>
<meta charset="UTF-8">
<title>공지사항:Notice</title>

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

	<div class="well", style="width:30%; height:150px; float:left;"><h1>Notice</h1>	<p>공지사항</p></div>
	<div class="well", style="width:70%; height:150px; float:left;">
		<div id="faqBtn"><a href="faqList"><h4>FAQ</h4></a></div>
		<div id="qnaBtn"><a href="serviceList"><h4>QnA</h4></a></div>
			<div id="NoticeBtn"><a href="serviceNoticeList"><h4>Notice</h4></a></div>
	</div>

	<hr>
	<table>
		<tr>
			<td class="left">index</td>
			<td class="left">title</td>
			<td class="left">writer</td>
		</tr>
		<c:forEach items="${list}" var="one">
		<tr>
			<td class="right">${one.service_faq_idx}</td>
			<td class="right"><a href="serviceNoticeOne?service_faq_idx=${one.service_faq_idx}">${one.service_faq_question}</a></td>
			<td class="right">관리자</td>
			

		</c:forEach>	
		</table>
		<% if (session.getAttribute("user_id") != null) {%>
		<% if (session.getAttribute("user_id").equals("admin")) { %> 						
			<a href="servicecenterNoticeCreate.jsp"><button>공지사항 쓰기</button></a></td>
		<%
		}
		%>
		<%
		}
		%>
</body>
</html>