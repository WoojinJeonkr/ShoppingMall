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
/* $.ajax({
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
}) */

//select ajax restapi 하나 더 추가. 


 $(function(){
	//alert('test..')
	$.ajax({
		url : "orderHistory",
		type: "get", 
		data:{
			user_id: '${user_id}'
		},
		success: function(result){
			
			console.log('result:'+result)
			$('#d1').html(result)
			
		},
		error: function() {
			console.log('orderHistory error')
		}
	
	})
})  











</script> 

<body>
<div id = "total">
	<%-- <div id = "top">
		<jsp:include page="top.jsp"></jsp:include>
	</div> --%>
	<div>
		<div id="d1"></div>
	</div>






</body>
</html>