<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 정보</title>
</head>
<body>

	<div id = "top">
			<jsp:include page="../../top.jsp"></jsp:include>
		   <a href="productList.jsp">리스트 목록으로 </a>
	</div> 
	<div>
		<div>
			<h1>주문 정보</h1>
		</div>
	</div>
	
	<div>
		<div>
			user_name: <br>
				<input type = "text" name = "user_name" value = "" ><br/>
			user_tel:  <br>
				<input type = "text" name = "user_tel" value = ""><br/>
		</div>
		<div>
			recipient_info: <br>
			<input type = "text" name = "recipient_info" value = ""><br/>
			recipient_addr: <br>
			<input type = "text" name = "recipient_addr" value = ""><br/>
		</div>
		<div>
			<strong>상품 정보</strong>
			<strong>상품 가격</strong>
			<strong>상품 수량</strong>
		</div>
		<div>
			<strong>상품 결제</strong>
		</div>
	</div>
	
	<button type = "button">완료</button>
	
</body>
</html>