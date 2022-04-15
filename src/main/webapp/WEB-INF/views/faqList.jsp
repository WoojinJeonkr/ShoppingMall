
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
	
	
	function deleteValue(){
		var url = "serviceFaqDelete" //Controller로 보내고자 하는 url
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i<list.length; i++){
			if(list[i].checked){
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0){
			alert("선택된 글이 없습니다.")
		}
		else{
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url: url, 
				type : 'POST',
				traditional: true,
				data : {
					service_faq_idx:valueArr
				}, 
				success: function(jdata){
					console.log(valueArr)
					if(jdata=1){
						alert("삭제 성공");
						location.replace("faqList")
					}
					else{
						alert("삭제실패");
					}
				}
			});
		}
	}
	
	var a=0;
	function showCheck(){
		console.log("체크박스클릭됨")
		a=a+1
		console.log(a)
		$(function(){
			if (a%2==1){
				$("input[name='chk']").val('체크박스 숨기기');
				$("input[name='RowCheck']").css("display","inline");
				$("input[name='modi']").css("display","inline");
				$("input[name='del']").css("display","inline");
				
			}
			else{
				$("input[name='chk']").val('체크박스 활성화');
				$("input[name='RowCheck']").css("display","none");
				$("input[name='modi']").css("display","none");
				$("input[name='del']").css("display","none");
			}
		});
		
	}
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
				<td id="title"><input name="RowCheck" type="checkbox" value="${one.service_faq_idx}" style="display:none"/></td><!-- 자주 묻는 질문 -->
				<td id="title">${one.service_faq_question}</td><!-- 자주 묻는 질문 -->
			</tr>
				<td id="answer" class="sub" colspan="2">${one.service_faq_answer}</td><!-- 그에대한 답변 -->
			</div> 
		</c:forEach>
		
	</table>
	<% if (session.getAttribute("user_id") != null) {%>
		<% if (session.getAttribute("user_id").equals("admin")) { %> 						
			<a href="serviceFaqCreate.jsp"><button>추가</button></a>
			<input type="button", name="chk", value="체크박스 활성화", onclick="showCheck()">
			<input type="button", name="del", style="display:none", value="삭제", onclick="deleteValue()">
			<input type="button", name="modi" , style="display:none", value="수정", onclick="modifyValue()">
		<%
		}
		%>
	<%
		}
		%>
</body>
</html>