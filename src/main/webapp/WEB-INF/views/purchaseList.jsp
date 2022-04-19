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
<body>

	<div id = "top">
			<jsp:include page="../../top.jsp"></jsp:include>
		   <a href="productList.jsp">리스트 목록으로 </a>
	</div> 
	
	<form>
		<div>
			<div>
				<h1>주문 정보</h1>
			</div>
		</div>
	<div>
		<div>
			<input type = "hidden" name = "user_id" value = "${user_id}" >
			이름: <br>
				<input type = "text" name = "user_name" value = "이름 입력" ><br/>
			휴대전화:  <br>
				<input type = "text" name = "user_tel" value = "전화번호 입력"><br/>
		</div>
		<div>
			수신인: <br>
			<input type = "text" name = "recipient_info" value = "수신인"><br/>
			주소: <br>
			<input type = "text" name = "recipient_addr" value = "주소"><br/>
		</div>
		<div>
			<div>
				상품 이름: <input type="text" name="purchase_product" value = "${param.product_title}" disabled/><br>
				 상품 가격:<input type="text" name="payment_total" value = "${param.payment_total}" disabled/><br>
			 	 <img src="resources/img/${param.product_img}" style = width:12%; ><br>
			 	 상품 수량:	<input type="text" name="purchase_quantity"  value = "${param.p_num1}"  disabled/><br>
			 	 상품 번호: <input type="text" name="product_idx"  value = "${param.product_idx}"  disabled/>
			</div>
			
		</div>
		<div>
			<div>상품 결제</div>
			<select name = "payment_idx">
				<option value="1">신용카드 결제</option>
    			<option value="2">무통장 입금</option> <!-- ajax로 확인 -->
			</select>
		</div>
	</div>
		<button type = "submit">완료</button>
	</form>
</body>
</html>