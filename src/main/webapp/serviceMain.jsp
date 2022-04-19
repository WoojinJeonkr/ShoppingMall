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
		
		location.href="serviceFaqUpdate2?service_faq_idx="+valueArr;
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
	
		var myClass;
		$(".cate").click(function() {
			myClass = $(this).attr("id");
			$.ajax({

				url : "faqListView",
				type : 'POST',
				traditional : true,
				data : {
					service_faq_category : myClass
				},
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
			<div class="well"  style="width: 30%; height: 150px; float: left;">
				<h1>FAQ</h1>
				<p>자주 묻는 질문사항</p>
			</div>
			<div class="well"  style="width: 70%; height: 150px; float: left;">
				<div id="faqBtn">
					<a href="serviceMain.jsp"><h4>FAQ</h4></a>
				</div>
				<div id="qnaBtn">
					<a href="serviceList"><h4>QnA</h4></a>
				</div>
				<div id="NoticeBtn">
					<a href="serviceNoticeList"><h4>Notice</h4></a>
				</div>
			</div>

			<hr>

			<ul class="nav nav-tabs" name="service_faq_category">
				<li class="active"><a href="#" id="전체" value="*">전체</a></li>
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
				if (session.getAttribute("user_id").equals("admin")) {
			%>
			<div><a href="serviceFaqCreate.jsp"><button>추가</button></a> <input
				type="button" name="chk" value="체크박스 활성화" onclick="showCheck()">
			<input type="button" name="del" style="display: none" value="삭제"
				onclick="deleteValue()"> <input type="button" name="modi"
				style="display: none" value="수정" onclick="modifyValue()"></div>
			
			<%
				}
			%>
			<%
				}
			%>

		</div>
	</div>


</body>
</html>