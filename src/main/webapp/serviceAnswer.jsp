<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int a = Integer.parseInt(request.getParameter("service_idx_re"));
String str = "ㄴRe:";

for (int i = 0; i < a; i++) {

	str += "Re:";
}
//service_idx_re의 수만큼  RE를 붙여준다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>고객센터:답변</title>
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
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script>

	$(document).ready(function() {
		$('#btn').click(function() {
			if ($('#tit').val() == '<%=str%>') {		
				alert("제목을 입력해주세요.");
				return false;
			} else if ($('#tit').val() == '') {		
				alert("제목을 입력해주세요.");
				return false;
			} 
			else if ($('#con').val() == '') {//아이디입력안했을 시 text 띄우기				
				alert("내용을 입력해주세요.");
				return false;
			} else {
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
		<div class="row" style="width: 1200px; margin: auto;">
			<div id="center">
				<div class="well">
					<h3>답변하기</h3>
				</div>

				<div id="d1">
					<hr>
					<form action="serviceAnswer">
						<input type="hidden" name="user_id" style="width: 300px;"
							value="${user_id}" readonly="readonly"> <input
							type="hidden" name="service_id_origin" style="width: 300px;"
							value="<%=request.getParameter("service_id_origin")%>"
							readonly="readonly"> <input type="hidden"
							name="service_idx_re" style="width: 300px;"
							value="<%=request.getParameter("service_idx_re")%>"
							readonly="readonly"> <input type="hidden"
							name="one.service_reply_group" style="width: 300px;"
							value="<%=request.getParameter("service_reply_group")%>"
							readonly="readonly">
						<table>
							<tr>

								<td class="left">제목</td>
								<td class="right"><input type="text" name="service_title"
									style="width: 300px;" id="tit" value='<%=str%>'></td>
							</tr>

							<tr>
								<td class="left">내용</td>
								<td class="right"><input type="text"
									name="service_question" id="con"
									style="width: 300px; height: 300px"></td>
							</tr>

						</table>
						<button id="btn">등록</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>