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

/* 	$(document).ready(function(){
			$('#btn').click(function(){
					$('#productForm').submit();
			});
	});
 */


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


<!-- 값을 넘겨줘야 하므로 form을 만들자 -->
<form id = "productForm" action="${pageContext.request.contextPath}/productList" method ="get">

product_category: 
	<select name = "categoryName">
		<option value="">카테고리 선택</option>
		<!-- <option value="test">test</option> -->
		<!-- Controller에서 받아온 productCategory 값과 
			 쇼핑몰 이용자가 선택한 productCategory.name이 일치하면 그 값이 옵션에서 선택되고 
			 그렇지 않다면  선택된 것이 아니라 목록만 보여주게 된다.(본인은 값이 안 넘어간다로 이해.)-->
		
		<c:forEach var="c" items = "${categoryList}">
			<c:if test="${c== categoryName}">
				<option value="${c}" selected="selected">${c}</option>
			</c:if>
			<c:if test="${c!=categoryName}">
				<option value="${c}">${c}</option>
			</c:if>
		</c:forEach>
		
	</select>
	<button type="submit"> 검색</button>
</form>


 <!-- 원래는 form 하나에 담았으나.. form 하나에 하나의 변수만 넣어줄 수 있는것으로 보인다. --> 
<form id = "productForm" action="${pageContext.request.contextPath}/productList" method ="get">
	<label for = "searchWord">apperal name</label>
	<input name = "searchWord" type = "text">
	<button type="submit"> 검색</button>
</form>


<table border="1"> 
 <tr>
 
	<%
	 int i=0; 
	%>   
   <c:forEach items="${voListResult}" var="one">
	<%
		i+=1;
	%>
	<td>

	 <div style = "height: 250px; overflow; hidden;position: relative;">
	      <div class="box01">
	      	<img src="resources/img/${one.product_img}" width="210px" height="200px" >
	      </div>
		      <div style="display: none;">${one.product_idx}</div><!-- one.getId() -->
		      <div><a href="productOne?product_idx=${one.product_idx}&product_img=${one.product_img}">${one.product_title}</a></div>
		       <div>￦${one.product_price}❤${one.likecheck}</div>
		        
	  </div>
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
		  <div>
		  
		    <c:if test="${currentPage<=1}">
		    	<button type="button" class="btn btn-outline-primary">이전</button> <!-- 버튼 활성화 안한 장식용 2페이지부터 활성화 -->
		    </c:if>
		   	
		   	<c:if test="${currentPage>1}">
		   		<a href="${pageContext.request.contextPath}/productList?currentPage=${currentPage-1}&categoryName=${categoryName}&searchWord=${searchWord}"><button type="button" class="btn btn-outline-primary">이전</button></a>
		   	</c:if>
	
		     <%-- <c:if test = "${endIdx!=1}"> --%>
			   	<c:forEach begin ="${startIdx}" end ="${endIdx}" var = "pageIdx"> <!-- endPage값 문제가 있는지 확인해야 함. -->
			   			<a href="${pageContext.request.contextPath}/productList?currentPage=${pageIdx}&categoryName=${categoryName}&searchWord=${searchWord}">${pageIdx}</a>
			   	</c:forEach>
			<%--  </c:if> --%>
		   	
		   	<c:if test="${currentPage<lastPage}">
		   		<a href="${pageContext.request.contextPath}/productList?currentPage=${currentPage+1}&categoryName=${categoryName}&searchWord=${searchWord}"><button type="button" class="btn btn-outline-primary">다음</button></a>
			</c:if>   	
		</div>
   </div>
</body>
</html>