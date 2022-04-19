<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderHistory</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="resources/js/basket.js"></script>

<link rel = "stylesheet" type = "text/css" href = "resources/css/project.css">
<link rel = "stylesheet" type = "text/css" href = "resources/css/basket.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

</head>
	
	
		

		<!-- product_idx, payment_idx, user_id, payment_total, recipient_info, recipient_addr, 
		purchase_product, purchase_quantity -->

<script type="text/javascript">
$.ajax({
	url: 'orderInsert',
	type:'post', 
	data : {
		product_idx: ${param.product_idx}, 
		payment_method:'${param.payment_method}', 
		user_id: '${param.user_id}', 
		payment_total : ${param.payment_total},
		recipient_info: '${param.recipient_info}',
		recipient_addr: '${param.recipient_addr}', 
		purchase_product: '${param.purchase_product}', 
		purchase_quantity : ${param.purchase_quantity}
	},
	success: function(result){
		console.log('orderPayment 성공')
		
	},
	error: function(){
		console.log('orderPayment 실패')
	}//error
})

//select ajax restapi 하나 더 추가. 














</script> 

<body>
<div id = "total">
	<div id = "top">
		<jsp:include page="../../top.jsp"></jsp:include>
	</div>
	<div id = "center">
		<h3>구매 이력 조회</h3>
		<hr>
		 <table border="1">
		 
			   <tr>
			   	  <td>수신자</td>
			      <td>수신자 주소</td>
			      <td>상품 이름</td>
			      <td>상품 수량</td>
			      <td>구매 가격</td>
			      <td>구매 일자</td>
			   </tr>
			   
    
    
    <!-- user_id와 일치하는 정보들만 가져와서 보여주기. -->
    
    <tr>
	      <td class="text_over"></td> 
	      <td class="text_over"></td>
	      <td class="text_over"></td>
	      <td class="text_over"></td>
	      <td class="text_over"></td>
      	  <td class="text_over"></td>
   </tr> 
   
   
   
  <%--  <tr>
      <td class="text_over">${param.recipient_info}</td> <!-- one.getId() -->
      <td class="text_over">${param.recipient_addr}</td>
      <td class="text_over">${param.purchase_product}</td>
      <td class="text_over">${param.purchase_quantity}</td>
      <td class="text_over">${param.payment_total}</td>
      <td></td>
   </tr> --%>
   
   
   
   
   </table>
	
	
	
	</div>
</div> 








</body>
</html>