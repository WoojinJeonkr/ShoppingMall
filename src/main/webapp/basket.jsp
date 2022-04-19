<%@page import="com.hi.clothingStore.vo.ProductListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basket</title>
<link rel = "stylesheet" type = "text/css" href = "resources/css/project.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<style>
	.text_over{
	overflow: hidden;
	text-overflow:ellipsis;
	white-space: nowrap; /* 텍스트 칸 일정하게 유지 */
	}
</style>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="resources/js/basket.js"></script>
<script type="text/javascript">
/* $('#del').click(function() {
			if(confirm("정말로 삭제하시겠습니까?")){
				//controller의 bbsDel요청 후,
				//삭제가 성공하면, 
				//bbs.jsp로 화면을 넘기면 됨
				$.ajax({
					url: "basketDel",
					data: {
						id: ${one.p_idx}	
					},
					success : function(result) {
						
						if(result == '1'){
							location.href = "basket.jsp"
						}
					}
				})
			}
		}) */
	</script>	
</head>
<body>
<div id = "total">
	<div id = "top">
		<jsp:include page="top.jsp"></jsp:include>
	</div>
	<div id = "center">
		<h3>장바구니 목록</h3>
		<hr>
		<%
			ArrayList<ProductListVO> list = (ArrayList<ProductListVO>) session.getAttribute("basket");
			if(list != null){
		%>
		
		<span><%=list.size()%></span>개의 물건이 장바구니에 들어있습니다.
		 <table border="1">
		 
		 <%int i=0; %>
			   <tr>
			   	  <td>순서</td>
			      <td>상품 이름</td>
			      <td>상품 번호</td>
			      <td>상품 가격</td>
			   </tr>
			   
   <%
   		for(ProductListVO one: list) {
  		i++;
   %>
   
   <tr>
   	  <td><%=i%></td>
      <td class="text_over"><%=one.getProduct_title()%></td> <!-- one.getId() -->
      <td class="text_over"><%=one.getProduct_idx()%></td>
      <td class="text_over"><%=one.getProduct_price()%></td>
   </tr>
   
   <%
   } 
   %>
   
   
   </table>
   <%}else { %>
   	<span>0개의 물건이 장바구니에 들어 있습니다.</span>
   <%} %>
	</div>
</div>
</body>
</html>