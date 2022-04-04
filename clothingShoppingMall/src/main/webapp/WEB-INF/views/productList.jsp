<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/project.css">
</head>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">


</script>
<style>
	tbody{
		height:1200px;
		display:inline-block; 
		width:1800px; 
		overflow: auto; 
	}
	
	#wrapper{
		width:300px;
		margin:auto;
	}
	
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
      <div><img src="resources/img/${one.p_img}" width="20px" height="20px"></div>
      <div style="display: none;">${one.p_idx}</div><!-- one.getId() -->
      <div>책 카테고리 :${one.p_category}</div> <!-- one.getId() -->
      <div>책 제목:<a href="productOne?p_idx=${one.p_idx}">${one.p_title}</a></div>
      <div>책 가격: ${one.p_price}원</div>     
	</td> 
	<%
		if(i%3==0){
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