<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

	<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

.left {
	background: #dbdad5;
}
</style>
</head>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="../../top.jsp"></jsp:include>
		</div>
		<div id="top2">
			<jsp:include page="../../top2.jsp"></jsp:include>
		</div>
		<div id="center">
			<div class="well"><h3>FaQ 수정하기</h3></div>
			
				<hr>
				<form action="serviceFaqUpdate1">
					<input type="hidden" name="service_faq_idx" style="width: 300px;" value="${one.service_faq_idx}">
						<select name="service_faq_category">
				            <option value="주문결제" selected >주문결제</option>
							<option value="배송안내">배송안내</option>
						    <option value="교환/환불">교환/환불</option>
							<option value="상품/회원관련">상품/회원관련</option>
			        	</select>
					<table>
						<tr>
							<td class="left">제목</td>
							<td class="right"><input type="text" name="service_faq_question"
								style="width: 300px;" value="${one.service_faq_question}"></td>
						</tr>

						<tr>
							<td class="left">내용</td>
							<td class="right"><input type="text" name="service_faq_answer"
								style="width: 300px; height: 300px;"
								value="${one.service_faq_answer}"></td>
						</tr>

					</table>
					<button>등록</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>