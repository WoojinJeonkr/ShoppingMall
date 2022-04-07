<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="resources/css/project.css"> -->
</head>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js">
</script>
<style>
    .box01{
       border-width:5px; 
       border-style:solid; 
       border-color:#F6F6F6;
    }
  
	/* tbody{
		height:1200px;
		display:inline-block; 
		width:1800px; 
		overflow: auto; 
	}
	
	#wrapper{
		width:300px;
		margin:auto;
	} */
	
</style>
<body>
 <div id = "top">
		<jsp:include page="../../top.jsp"></jsp:include>
</div>
<table border="1"> 
 <tr>
	<%
	 int i=0; 
	%>   
   <c:forEach items="${list}" var="one">
	<%
		i+=1;
	%>
	<td>
<<<<<<< HEAD
	 <div style = "height: 250px; overflow; hidden;position: relative;">
      <div class="box01">
      	<img src="resources/img/${one.product_img}" width="210px" height="200px" >
      </div>
      <div style="display: none;">${one.product_idx}</div><!-- one.getId() -->
      <div><a href="productOne?p_idx=${one.product_idx}">${one.product_title}</a></div>
      <div>￦${one.product_price}</div>     
	  </div>
=======
      <div><img src="resources/img/${one.product_img}" width="20px" height="20px"></div>
      <div style="display: none;">${one.product_number}</div><!-- one.getId() -->
      <!--  <div>책 카테고리 :${one.p_category}</div> --> <!-- one.getId() -->
      <div>책 제목:<a href="productOne?p_idx=${one.product_number}">${one.product_title}</a></div>
      <div>책 가격: ${one.product_price}원</div>     
>>>>>>> 99f9321ea71421181b3d61f6d28c827c8c6ed2a2
	</td> 
	<%
		if(i%5==0){ //상품 5개마다 다음 행으로 이동 
	%>
		<tr>
		</tr>
		<%
		}
	
		%>
		 </c:forEach>
   </tr>
  
   </table>
   
   <div id="wrapper">
   	<c:if test="${currentPage>1}">
   		<a href="${pageContext.request.contextPath}/productList?currentPage=${currentPage-1}"><button type="button" class="btn btn-outline-primary">이전</button></a>
   	</c:if>
   	<c:if test="${currentPage<lastPage}">
   		<a href="${pageContext.request.contextPath}/productList?currentPage=${currentPage+1}"><button type="button" class="btn btn-outline-primary">다음</button></a>
	</c:if>   	
   </div>
</body>
</html>