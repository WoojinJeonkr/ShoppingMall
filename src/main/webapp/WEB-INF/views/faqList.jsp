
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
	let subToggle=true;
	$(".menu").click(()=>{
	  if(subToggle){
	    $(".sub").slideDown(1000);
	  }else{
	    $(".sub").slideUp(1000);
	  }
	  subToggle=!subToggle;
	});
	
/*
	$(function(){
		var chkObj=document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function()){
			var chk_listArr = $("input[name='RowCheck']");
			for (var i=0; i<che_listArr.length; i++){
				chk_listArr
			}
		}
		
	})
	*/
</script>
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
		<div id="NoticeBtn"><a href="serviceNoticeList"><h4>Notice</h4></a></div>
	</div>

	<hr>
	
  <div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">전체</a>
    </div>
    <div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li><a href="#section1">주문결제</a></li>
          <li><a href="#section2">배송안내</a></li>
          <li><a href="#section3">교환/환불</a></li>
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">상품/회원관련</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
  
	<table>			
	
		<c:forEach items="${list}" var="one">
		<div class="menu">
			
			<tr>
				<td id="title"><input name="RowCheck" type="checkbox" value="${one.service_faq_idx}"/></td><!-- 자주 묻는 질문 -->
				<td id="title">${one.service_faq_question}</td><!-- 자주 묻는 질문 -->
			</tr>
				<td id="answer" class="sub" colspan="2">${one.service_faq_answer}</td><!-- 그에대한 답변 -->
			</div> 
		</c:forEach>
		
	</table>
	<% if (session.getAttribute("user_id") != null) {%>
		<% if (session.getAttribute("user_id").equals("admin")) { %> 						
			<a href="serviceFaqCreate.jsp"><button>추가</button></a>
			<input type="button" value="삭제", onclick="deleteValue()">
		<%
		}
		%>
	<%
		}
		%>
</body>
</html>