<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>고객센터:글쓰기</title>
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

.left {
	background: #dbdad5;
}
</style>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$('#btn').click(function() {
		if ($('#tit').val() == '') {//아이디입력안했을 시 text 띄우기				
			alert("제목을 입력해주세요.");
			return false;
		}else if ($('#con').val() == '') {//아이디입력안했을 시 text 띄우기				
			alert("내용을 입력해주세요.");
			return false;
		}else {
			$('#form').submit();
		}
	
	});
});
</script>
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
			<div class="well">
				<h3>글쓰기</h3>
			</div>

			<div id="d1">
				<hr>
				<form action="serviceWrite">
					<input type="hidden" name="user_id" style="width: 300px;"
						value="${user_id}" readonly="readonly">
					<table>
						<tr>
							<td class="left">제목</td>
							<td class="right"><input type="text" name="service_title"
								style="width: 300px;" id="tit"></td>
						</tr>

						<tr>
							<td class="left">내용</td>
							<td class="right"><input type="text" name="service_question"
								style="width: 300px; height: 300px" id="con"></td>
						</tr>

					</table>
					<button id="btn">등록</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>