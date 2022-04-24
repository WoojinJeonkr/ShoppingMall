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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/project.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<link rel = "stylesheet" type = "text/css" href = "resources/css/project.css">
<link rel = "stylesheet" type = "text/css" href = "resources/css/basket.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

</head>
<script type = "text/javascript">

//form내부에 버튼이 있으면 바로 제출 되므로 form 외부로 버튼을 빼 준다. 

$(document).ready(function(){
	$('#addButton').click(function(){
		console.log('button click!');
		if($('#user_name').val() == ''){				
			alert('이름을 입력하세요.');
			$('#user_name').focus();
		} else if($('#user_tel').val() == ''){		
			alert('전화번호를 입력하세요.');
			$('#user_tel').focus();
		} else if($('#recipient_info').val() == ''){		
			alert('수신인을 입력하세요.');
			$('#recipient_info').focus();
		} else if($('#recipient_addr').val() == ''){		
			alert('주소를 입력하세요.');
			$('#recipient_addr').focus();
		} else if($('#payment_method').val() == ''){		
			alert('결제 방법을 입력하세요.');
			$('#payment_method').focus(); 
		}else{
			$('#Form').submit();
		}
	})	
});

</script>
<body>

	<div id = "top">
			<jsp:include page="../../top.jsp"></jsp:include>
		   <!-- <a href="productList.jsp">리스트 목록으로 </a> -->
	</div> 
	
	<form id = "Form" action = "ProductpurchaseList">
		<div>
			<div>
				<h1>주문 정보</h1>
			</div>
		</div>
	<div>
		<div>
			<input type = "hidden" name = "user_id" value = "${user_id}" >
			이름: <br>
				<input type = "text" id = "user_name" class="form-control" name = "user_name" value = "이름 입력" ><br/>
			휴대전화:  <br>
				<input type = "text" id = "user_tel" class="form-control" name = "user_tel" value = "전화번호 입력"><br/>
		</div>
		<div>
			받는 사람: <br>
			<input type = "text" id = "recipient_info" class="form-control" name = "recipient_info" value = "받는 사람 입력"><br/>
			주소: <br>
			<input type = "text" id = "recipient_addr" class="form-control" name = "recipient_addr" value = "주소 입력"><br/>
		</div>
		<div>
			<div>
			<!-- disabled를 해버리면 값이 아예 안넘어가버린다. -->
				상품 이름: <input type="text" name="purchase_product" class="form-control" value = "${param.product_title}" readonly="readonly"><br>
				 상품 가격:<input type="text" name="payment_total" class="form-control" value = "${param.payment_total}" readonly="readonly"><br>
			 	 <img src="resources/img/${param.product_img}" style = width:12%; ><br>
			 	 상품 수량:	<input type="text" name="purchase_quantity"  class="form-control" value = "${param.p_num1}" readonly="readonly"><br>
			 	 상품 번호: <input type="text" name="product_idx"  class="form-control" value = "${param.product_idx}" readonly="readonly">
			</div>
			
		</div>
		<div>
			<div>상품 결제</div>
			<select id = "payment_method" name = "payment_method">
				<option value=''>선택</option>
				<option value="신용카드">신용카드</option>
    			<option value="무통장입금">무통장입금</option> <!-- ajax로 확인 -->
			</select>
		</div>
	</div>
	</form>
	<br>
	
	<button id = "addButton" class="btn btn-light">완료</button>
</body>
</html>