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
			if ($('#tit').val() == '<%=str%>
	') {
				alert("제목을 입력해주세요.");
				return false;
			} else if ($('#tit').val() == '') {
				alert("제목을 입력해주세요.");
				return false;
			} else if ($('#con').val() == '') {//아이디입력안했을 시 text 띄우기				
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
		<section class="contact-us">
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
						<form id="contact" action="serviceAnswer" method="post"
							style="width: 800px; margin: auto">
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
							<div class="row">
								<div class="col-lg-12">
									<div class="section-heading">
										<h6>Answer</h6>
										<h4>
											고객문의 <em>답변</em>
										</h4>
										<p>IF you need a working contact form by PHP script,
											please visit TemplateMo's contact page for more info.</p>
									</div>
								</div>
								<div class="col-lg-12">
									<fieldset>
										<input type="text" name="service_title" style="width: 300px;"
											id="tit" value='<%=str%>' autocomplete="on" required>
									</fieldset>
								</div>
								<div class="col-lg-12">
									<fieldset>
										<input type="text" name="service_question" id="con"
											style="height: 300px" id="con" placeholder="content"
											required="">
									</fieldset>
								</div>
								<div class="col-lg-12">
									<fieldset>
										<button type="submit" id="btn" class="main-gradient-button">등록</button>
									</fieldset>
								</div>
							</div>
						</form>
					</div>
					<div class="col-lg-12">
						<ul class="social-icons">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#"><i class="fa fa-rss"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
						</ul>
					</div>
					<div class="col-lg-12">
						<p class="copyright">
							Copyright © 2022 EduWell Co., Ltd. All Rights Reserved. <br>Design:
							<a rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a>
						</p>
					</div>
				</div>
			</div>
		</section>
	
</body>
</html>