<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="resources/js/basket.js"></script>

<link rel = "stylesheet" type = "text/css" href = "resources/css/project.css">
<link rel = "stylesheet" type = "text/css" href = "resources/css/basket.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

</head>
<script type = "text/javascript">
$(document).ready(function(){
	$('#addButton').click(function(){
		console.log('button click!');
		if($('#user_name').val() == ''){				
			alert('이름을 입력하세요.');
		} else if($('#user_tel').val() == ''){		
			alert('전화번호를 입력하세요.');
		} else if($('#recipient_info').val() == ''){		
			alert('수신인을 입력하세요.');
		} else if($('#recipient_addr').val() == ''){		
			alert('주소를 입력하세요.');
		} else if($('#payment_method').val() == ''){		
			alert('결제 방법을 입력하세요.');
		}else{
			$('#addButton').submit();
		}
	})	
});














</script>
<body>

	<div id = "top">
			<jsp:include page="../../top.jsp"></jsp:include>
		   <a href="productList.jsp">리스트 목록으로 </a>
	</div> 
	
	<form action = "orderHistory">
		<div>
			<div>
				<h1>주문 정보</h1>
			</div>
		</div>
	<div>
		<div>
			<input type = "hidden" name = "user_id" value = "${user_id}" >
			이름: <br>
				<input type = "text" id = "user_name" name = "user_name" value = "이름 입력" ><br/>
			휴대전화:  <br>
				<input type = "text" id = "user_tel" name = "user_tel" value = "전화번호 입력"><br/>
		</div>
		<div>
			수신인: <br>
			<input type = "text" id = "recipient_info" name = "recipient_info" value = "수신인"><br/>
			주소: <br>
			<input type = "text" id = "recipient_addr" name = "recipient_addr" value = "주소"><br/>
		</div>
		<div>
			<div>
				상품 이름: <input type="text" name="purchase_product" value = "${param.product_title}"><br>
				 상품 가격:<input type="text" name="payment_total" value = "${param.payment_total}"><br>
			 	 <img src="resources/img/${param.product_img}" style = width:12%; ><br>
			 	 상품 수량:	<input type="text" name="purchase_quantity"  value = "${param.p_num1}"><br>
			 	 상품 번호: <input type="text" name="product_idx"  value = "${param.product_idx}">
			</div>
			
		</div>
		<div>
			<div>상품 결제</div>
			<select id = "payment_method" name = "payment_method">
				<option value="신용카드">신용카드</option>
    			<option value="무통장입금">무통장입금</option> <!-- ajax로 확인 -->
			</select>
		</div>
	</div>
		<button id = "addButton">완료</button>
	</form>
</body>
</html>