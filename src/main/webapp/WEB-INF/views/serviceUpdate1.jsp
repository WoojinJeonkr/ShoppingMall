<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="../../top.jsp"></jsp:include>
		</div>
		<div id="top2">
			<jsp:include page="../../top2.jsp"></jsp:include>
		</div>
		<section class="get-info">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="left-image">
							<img src="resources/assets/images/about-left-image.png" alt="">
						</div>
					</div>
					<div class="col-lg-6 align-self-center">
						<div class="section-heading">
							<h6>QnA 수정 완료</h6>
							<h4>
								<em> QnA 수정 </em>을 성공적으로 마쳤습니다.
							</h4>
							<p></p>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="info-item">
									<div class="icon">
										<img src="resources/assets/images/service-icon-01.png" alt="">
									</div>
									<h4>
										<a href="serviceList.jsp">목록보기</a>
									</h4>
									<p></p>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="info-item">
									<div class="icon">
										<img src="resources/assets/images/service-icon-02.png" alt="">
									</div>
									<h4>
										<a href="serviceWrite.jsp">글쓰기</a>
									</h4>
									<p></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

</body>
</html>