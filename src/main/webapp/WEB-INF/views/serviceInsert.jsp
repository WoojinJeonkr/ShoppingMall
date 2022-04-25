<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
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
							<h6>QnA등록완료</h6>
							<h4>
								문의 주셔서 <em>감사합니다.</em>
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
									<p>Food & truck tumeric taxidermy hoodie chiasore bitters
										retroed gentrify street portland.</p>
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
									<p>Food & truck tumeric taxidermy hoodie chiasore bitters
										retroed gentrify street portland.</p>
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