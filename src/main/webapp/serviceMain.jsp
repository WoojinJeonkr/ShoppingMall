<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="resources/assets/css/fontawesome.css">
<link rel="stylesheet"
	href="resources/assets/css/templatemo-eduwell-style.css">
<link rel="stylesheet" href="resources/assets/css/owl.css">
<link rel="stylesheet" href="resources/assets/css/lightbox.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!--

TemplateMo 573 EduWell

https://templatemo.com/tm-573-eduwell

-->

<title>고객센터</title>
</head>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function deleteValue() {
		var url = "serviceFaqDelete" //Controller로 보내고자 하는 url
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) {
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 글이 없습니다.")
		} else {
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url : url,
				type : 'POST',
				traditional : true,
				data : {
					service_faq_idx : valueArr
				},
				success : function(jdata) {
					console.log(valueArr)
					if (jdata = 1) {
						alert("삭제 성공");
						location.replace("serviceMain.jsp")
					} else {
						alert("삭제실패");
					}
				}
			});
		}
	}

	function modifyValue() {
		var url = "serviceFaqUpdate2" //Controller로 보내고자 하는 url
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) {
				valueArr.push(list[i].value);
			}
		}

		location.href = "serviceFaqUpdate2?service_faq_idx=" + valueArr;
	}

	var a = 0;
	function showCheck() {
		console.log("체크박스클릭됨")
		a = a + 1
		console.log(a)
		$(function() {
			if (a % 2 == 1) {
				$("input[name='chk']").val('체크박스 숨기기');
				$("input[name='RowCheck']").css("display", "inline");
				$("input[name='modi']").css("display", "inline");
				$("input[name='del']").css("display", "inline");
				$(".radi").css("display", "block");

			} else {
				$("input[name='chk']").val('체크박스 활성화');
				$("input[name='RowCheck']").css("display", "none");
				$("input[name='modi']").css("display", "none");
				$("input[name='del']").css("display", "none");
			}
		});

	}
	$(function() {
		$.ajax({
			url : "faqList",
			success : function(list1) {
				$("#result").html(list1);
			},
			error : function() {
				alert('실패');
			}
		});
		$(".tot").mouseenter(function() {
			$.ajax({
				url : "faqList",
				success : function(list1) {
					$("#result").html(list1);
				},
				error : function() {
					alert('실패');
				}
			});
		});
		var myClass;
		$(".cate").mouseenter(function() {
			myClass = $(this).attr("id");
			$(this).addClass("active");
			$.ajax({
				url : "faqListView?service_faq_category=" + myClass,
				type : 'POST',
				traditional : true,

				success : function(list1) {
					$("#result").html(list1);
				},
				error : function() {
					alert('실패');
				}
			});

		});

	});
</script>
<style>
.nav-tabs>li>a:hover {
	background: #dc8cdb;
	transition: background-color .5s;
}

a {
	color: pink;
	text-decoration: none;
}
</style>
<body>
	<div class="row" style="width: 1200px; margin: auto;">
		<div id="total">
			<div id="top">
				<jsp:include page="top.jsp"></jsp:include>
			</div>
			<div id="top2">
				<jsp:include page="top2.jsp"></jsp:include>
			</div>
			<div class="row" style="width: 1200px; margin: auto;">
				<div id="center">
					<section class="page-heading">
						<div class="container">
							<div class="row">
								<div class="col-lg-12">
									<div class="header-text">
										<h4>What We Do</h4>
										<h1>Our Services</h1>
									</div>
								</div>
							</div>
						</div>
					</section>
					<section class="services">
						<div class="container">
							<div class="row">
								<div class="col-lg-12">
									<div class="section-heading">
										<h6>자주 묻는 질문 사항</h6>
										<h4>
											Fa<em>Q</em>
										</h4>
									</div>
								</div>
								<div class="col-lg-12"
									style="overflow: visible; width: 800px; margin: auto; text-align: center;">
									<div class="owl-service-item owl-carousel"
										style="display: inline-block; width: 800px; margin: auto; text-align: center;">
										<div class="item" style="width: 200px; float: left;">
											<div class="service-item">
												<div class="icon">
													<img src="resources/assets/images/service-icon-01.png"
														alt="">
												</div>
												<h4>
													<a href="serviceMain.jsp" style="color: #dc8cdb">FAQ</a>
												</h4>

											</div>
										</div>
										<div class="item" style="width: 200px; float: left">
											<div class="service-item">
												<div class="icon">
													<img src="resources/assets/images/service-icon-02.png"
														alt="">
												</div>
												<h4>
													<a href="serviceList.jsp" style="color: #dc8cdb">QnA</a>
												</h4>

											</div>
										</div>
										<div class="item" style="width: 200px; float: left">
											<div class="service-item">
												<div class="icon">
													<img src="resources/assets/images/service-icon-03.png"
														alt="">
												</div>
												<h4>
													<a href="serviceNoticeList" style="color: #dc8cdb">Notice</a>
												</h4>
											</div>
										</div>

										<div class="item" style="width: 200px;">
											<div class="service-item">
												<div class="icon">
													<img src="resources/assets/images/service-icon-04.png"
														alt="">
												</div>
												<h4>
													<%
														if (session.getAttribute("user_id") != null) {
													%>
													<a href="serviceMyQuestion.jsp" style="color: #dc8cdb">
														<%
															} else {
														%> <a href="member" style="color: #dc8cdb">
															<%
																}
															%> MyQuestion
													</a>
												</h4>
												<%
													if (session.getAttribute("user_id") == null) {
												%>
												<p>로그인후 사용가능</p>
												<%
													}
												%>

											</div>
										</div>
										<%
											if (session.getAttribute("user_id") != null) {
										%>
										<c:if test="${user_level == 2}">
											<div class="item" style="width: 200px;">
												<div class="service-item">
													<div class="icon">
														<img src="resources/assets/images/service-icon-03.png"
															alt="">
													</div>
													<h4>

														<a href="serviceStatistics" style="color: #dc8cdb"> Statistics </a>
										</c:if>
										<%
											}
										%>
									</div>
								</div>
							</div>
						</div>
					</section>


					<ul class="nav nav-tabs" name="service_faq_category"
						style="float: left">
						<li><a href="#" class="tot" id="전체" value="*">전체</a></li>
						<li><a href="" class="cate" id="교환/환불" value="교환/환불">교환/환불</a></li>
						<li><a href="" class="cate" id="주문결제" value="주문결제">주문결제</a></li>
						<li><a href="" class="cate" id="배송안내" value="배송안내">배송안내</a></li>
						<li><a href="" class="cate" id="상품/회원관련" value="상품/회원관련">상품/회원관련</a></li>
					</ul>
					<div id="result"></div>

					<%
						if (session.getAttribute("user_id") != null) {
					%>
					<%
						if ((int) (session.getAttribute("user_level")) == 2) {
					%>
					<div>
						<a href="serviceFaqCreate.jsp"><button>추가</button></a> <input
							type="button" name="chk" value="체크박스 활성화" onclick="showCheck()">
						<input type="button" name="del" style="display: none" value="삭제"
							onclick="deleteValue()"> <input type="button" name="modi"
							style="display: none" value="수정" onclick="modifyValue()">
					</div>
					<%
						}
					%>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>

	<section class="contact-us">
		<div class="container">
			<div class="row">
				<div class="col-lg-8" style="height: 420px;">
					<div id="map">
						<!-- You just need to go to Google Maps for your own map point, and copy the embed code from Share -> Embed a map section -->

						<div class="row">
							<div class="col-lg-4 offset-lg-1">
								<div class="contact-info" style="width: 200px;">
									<div class="icon">
										<i class="fa fa-phone"></i>
									</div>
									<h4>Phone</h4>
									<span>010-020-0340</span>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="contact-info" style="width: 200px;">
									<div class="icon">
										<i class="fa fa-phone"></i>
									</div>
									<h4>Mobile</h4>
									<span>090-080-0760</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4"></div>
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
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="resources/assets/js/isotope.min.js"></script>
	<script src="resources/assets/js/owl-carousel.js"></script>
	<script src="resources/assets/js/lightbox.js"></script>
	<script src="resources/assets/js/tabs.js"></script>
	<script src="resources/assets/js/video.js"></script>
	<script src="resources/assets/js/slick-slider.js"></script>
	<script src="resources/assets/js/custom.js"></script>
	<script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
          e.preventDefault();
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>
</body>

</html>