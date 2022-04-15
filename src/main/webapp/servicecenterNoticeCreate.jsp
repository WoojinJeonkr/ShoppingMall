<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

table {
	width: 800px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
  border: 1px solid #444444;
    padding: 10px;
}
.left{background:#dbdad5;}
</style>
</head>
<body>
<div id="total">
		<div id="top">
			<jsp:include page="top.jsp"></jsp:include>
		</div>
		<div id="top2">
			<jsp:include page="top2.jsp"></jsp:include>
		</div>
		<div id="center">
			<div class="well"><h3>Notice 등록</h3></div>

			<div id="d1">
				<hr>
				<form action="serviceNoticeCreate">
					<input type="hidden" name="service_notice" style="width:300px;"
								value="1" readonly="readonly">
					<table>
						<tr>
							<td class="left">제목</td>
							<td class="right"><input type="text" name="service_faq_question" style="width:300px;"></td>
						</tr>
						
						<tr>
							<td class="left">내용</td>
							<td class="right"><input type="text" name="service_faq_answer" style="width:300px; height:300px"></td>
						</tr>

					</table>
					<button>등록</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>