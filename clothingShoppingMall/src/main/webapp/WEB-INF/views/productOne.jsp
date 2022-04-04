<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel = "stylesheet" type = "text/css" href = "resources/css/project.css">
<script type="text/javascript">
$(function () {
	$('#add').click(function(){
	$.ajax({
		url: 'productAdd',
		data : {
			//ISDN, 이름, 가격, 
			p_isbn: '${one.p_isbn}',
			p_title:'${one.p_title}',
			p_price: ${one.p_price}
		},
		success: function(result){
			alert(result)
			if(confirm("장바구니를 확인하시겠습니까?")){
				location.href ="basket.jsp"
			}
		},
		error: function(){
			alert("ajax 에러 발생.")
			}//error
		})//ajax
	})//click


$('#deleteBtn').click(function() {
	if(confirm("정말로 삭제하시겠습니까?")){
		$.ajax({
			url: "productDel",
			data: {
				p_idx: ${one.p_idx}	
			},
			success : function(result) {
				if(result == '1'){
					location.href = "productList.jsp"
					}
				},
			error:function(){
				alert('삭제 실패')
				}
			})
		}
	})
	
})//$

</script>
</head>
<body>

<span style="color: blue; float: right;">${userId}님 로그인되었습니다. 좋은 하루 되세요.</span><br>
	<div id = "top">
		<jsp:include page="../../top.jsp"></jsp:include>
	</div>
	<a href="productList.jsp">
			리스트 목록으로 
	</a>
<table border="1">
	<tr>
   		<td colspan = "2">
   			<button id="add">
   				<img src="resources/img/defaultbook2.jpg" width="100" height = "80"><p>그림 클릭 시 장바구니 담기</p>
   			</button>
   		</td>
   	</tr>
   <tr>
      <td></td>
      <td style="display: none;">${one.p_idx}</td> <!-- one.getId() -->
   </tr>
   <tr>
      <td>카테고리</td>
      <td>${one.p_category}</td> 
   </tr>
   <tr>
      <td>ISBN</td>
      <td>${one.p_isbn}</td>
   </tr>
   <tr>
      <td>책 저자</td>
      <td>${one.p_author}</td>
   </tr>
   <tr>
      <td>제품회사</td>
      <td>${one.p_company}</td> <!-- 이미지가 보이게 -->
   </tr>
   <tr>
      <td>책 페이지</td>
      <td>${one.p_page}</td> <!-- 이미지가 보이게 -->
   </tr>
   <tr>
      <td>책 무게</td>
      <td>${one.p_weight}</td> <!-- 이미지가 보이게 -->
   </tr>
   <tr>
      <td>책 가격</td>
      <td>${one.p_price}</td> <!-- 이미지가 보이게 -->
   </tr>
   <tr>
      <td>책 제목</td>
      <td>${one.p_title}</td> <!-- 이미지가 보이게 -->
   </tr>
   <tr>
      <td>책 내용</td>
      <td>${one.p_content}</td> <!-- 이미지가 보이게 -->
   </tr>
   <tr>
      <td>수정일</td>
      <td>${one.p_mdfydate}</td> <!-- 이미지가 보이게 -->
   </tr>
   <tr>
      <td>등록일</td>
      <td>${one.p_rgstdate.substring(0,10)}</td> <!-- 이미지가 보이게 -->
   </tr>
   	<!-- 유저아이디가 admin 관리자인경우 S버튼 활성화 -->
   
</table>
<div id = "total">
	<% if (session.getAttribute("userId").equals("admin")) {    %>
		<a href="productInsert"><button>생성</button></a>
		<a href="productUp?p_idx=${one.p_idx}"><button id="updateBtn" style="width: 50px;">수정</button></a>
		<button id="deleteBtn" style="width: 50px;">삭제</button>
	<%}else { %>
		<a href="productInsert"><button style="display:none;">생성</button></a>
		<a href="productUp?p_idx=${one.p_idx}"><button style="display:none;">수정</button></a>
		<button id="deleteBtn" style="display:none;">삭제</button>
	<%}%>
</div>
</body>
</html>