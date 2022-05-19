
<!-- 
FAQ를 보여주는 jsp
(READ)
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<title>고객센터:FAQ</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style>
#title {
	background: linear-gradient(-145deg, rgba(219, 138, 222, 1) 0%,
		rgba(246, 191, 159, 1) 100%) !important;
	color: white;
	font-size: 20px;
}

#ansewer {
	background: white;
	color: gray;
	font-size: 10px;
	text-style: bold;
}

table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom: none;
}

th, td {
	border: none;
	border-bottom: 1px solid #444444;
	padding: 10px;
	border-collapse: collapse;
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom: none;
}
</style>
<script>
	$(function() {
		var article = ("table .show");
		var cnt = 0; // 닫힌 상태
		$("table .title").click(function() {
			myArticle = $(this).next("tr");

			if ($(myArticle).hasClass('hide')) {
				$(myArticle).removeClass('hide').addClass('show');
				$('#radi').css('width', '10px');
			} else {
				$(myArticle).removeClass('show').addClass('hide');
				$('#radi').css('width', '10px');
			}

		});

	});
</script>
</head>
<body>
	<table>
		<c:forEach items="${list}" var="one">
			<div class="menu">

				<tr id="title" class="title">
					<td class="radi" style="display: none; width: 30px"><input name="RowCheck" type="checkbox"
						value="${one.service_faq_idx}" style="display: none; width: 10px" /></td>
					<!-- 자주 묻는 질문 -->
					<td class="real">${one.service_faq_question}</td>
					<!-- 자주 묻는 질문 -->
				</tr>
				<tr class="hide">
					<td id="answer" class="anwer" colspan="2">${one.service_faq_answer}</td>
					<!-- 그에대한 답변 -->
				</tr>
			</div>
		</c:forEach>
	</table>
</body>
</html>