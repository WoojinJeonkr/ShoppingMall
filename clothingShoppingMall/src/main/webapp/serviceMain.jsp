<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
</head>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
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

		$('#qnaBtn').click(function() {
			$.ajax({
				url : "serviceList",
				success : function(list1) {
					$("#result").html(list1);
				},
				error : function() {
					alert('실패');
				}
			});

		});
		$('#faqBtn').click(function() {
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

	});
</script>
<style>
#navii{width:10%;  float: left; background:gray;}
#result{width:90%;float: right;}
</style>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="top.jsp"></jsp:include>
		</div>
		<div id="top2">
			<jsp:include page="top2.jsp"></jsp:include>
		</div>
		<div id="center">
			<h3>고객센터</h3>
			<hr>
			<div id="navii">
				<div id="faqBtn">FAQ</div>
				<div id="qnaBtn">QnA</div>
			</div>

			<div id="result"></div>


		</div>
	</div>

</body>
</html>