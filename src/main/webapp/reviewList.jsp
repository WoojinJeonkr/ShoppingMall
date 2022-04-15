<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 후기 목록</title>
<%
	int product_idx = Integer.parseInt(request.getParameter("product_idx"));	
%>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<style>
 	section.reviewForm {padding:30px 0;}
	section.reviewForm div.input_area {margin:10px 0;}
	section.reviewForm textarea {font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px;}
	section.reviewForm button {font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc;}

	section.reviewList {padding:30px 0;}
	section.reviewList ol { padding:0; margin:0;}
	section.reviewList ol li {padding:10px 0; border-bottom:2px solid #eee;}
	section.reviewList div.userInfo {}
	section.reviewList div.userInfo .userId {font-size:24px; font-weight:bold;}
	section.reviewList div.userInfo .date {color:#999; display:inline-block; margin-left:10px;}
	section.reviewList div.reviewContent {padding:10px; margin:20px 0;}
	section.reviewList div.reviewFooter button { font-size:14px; border: 1px solid #999; background:none; margin-right:10px;}
	
	div.reviewModal { position:relative; z-index:1; display:none;}
	div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
	div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
	div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
	div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
	div.modalContent button.modal_cancel { margin-left:20px;}
</style>
	<!-- 함수로 사용할 스크립트들은 특별한 이유가 있지 않은 한 헤드 내부에 위치시킨다 -->
	<script>
		// 구매 후기 불러오기
		function reviewList(){ // reviewList()라는 함수로 생성
			console.log("-----------------------");
			$.getJSON("reviewList?product_idx=<%= product_idx%>", function(data){ // 비동기식으로 제이슨(Json) 데이터를 가져옴
				console.log("-----------------------");
				var str = "";
				$.each(data, function(idx, one){
					console.log(one); // 콘솔에서 data 확인
					
					var review_rgstdate = new Date(this.review_rgstdate);
					review_rgstdate = review_rgstdate.toLocaleDateString("ko-US")
					
					// HTML 코드 조립
					str += "<li data-review_idx='" + this.review_idx + "'>"
						+ "<div class='userInfo'>"
						+ "<span class='userName'>" + this.user_name + "</span>"
						+ "<span class='date'>" + review_rgstdate + "</span>" 
						+ "</div>"
						+ "<div class='review_content'>" + this.review_content + "</div>"
						+ "<c:if test='${user_id != null}'>"
						+ "<div class='reviewFooter'>"
						+ "<button type='button' class='update' data-review_idx='" + this.review_idx + "'>수정</button>"
						+ "<button type='button' class='delete' data-review_idx='" + this.review_idx + "'>삭제</button>"
						+ "</c:if>"
						+ "</li>";
				});
				
				console.log(str);
				$("section.reviewList ol").html(str);
			});
		}
	</script>
	
	<!-- 버튼 관련 스크립트 -->
	<script>
		$(function(){
			/* 후기 작성  */
			$("#review_btn").click(function(){
				var formObj = $(".reviewForm form[role='form']");
				var product_idx2 = $("#product_idx").val(); // 상품 번호 변수 선언
				var review_content2 = $("textarea#review_content2").val(); // 후기 내용 변수 선언
				
				var data = {
					product_idx : product_idx2,
					review_content : review_content2
				};
				
				alert(product_idx2)
				alert(review_content2)
				
				$.ajax({
					url : "reviewCreate", // 데이터가 전송될 주소
					type : "post", // 타입
					data : data, // 전송될 데이터
					success : function(){ // 데이터 전송이 성공되었을 경우 실행할 함수부
						reviewList();
						$("#textarea#review_content2").val("")
					},
					error: function() {
						alert('실패')
					}
				
				});
				console.log(data)
			});
		});
		
		/* 후기 수정  */
		$("#modal_update_btn").click(function(){
			var updateConfirm = confirm("정말로 수정하시겠습니까? 수정 후 복구가 불가능합니다.");
			
			if(updateConfirm){
				var data = {
					review_idx : $(this).attr("data-review_idx"),
					review_Content: $('.modal_review_content').val()
				}; //reviewVO 형태로 데이터 생성
				
				$.ajax({ // 후기 수정 관련 ajax
					url : "reviewUpdate",
					type : "post",
					data : data,
					success : function(result){
						
						// result 값에 따라 동작
						if(result == 1) {
							reviewList();
						} else {
							alert("작성자 본인만 후기 수정이 가능합니다")
						}
					},
					error: function(){ // 로그인하지 않은 상태에서 버튼을 눌렀을 경우
						alert("로그인해주세요.")
					}
				});
			}	
		});
		
		/* 후기 수정 버튼 클릭 시 */
		$(document).on("click", ".update", function(){
			$(".reviewModal").fadeIn(200);
			
			var review_idx = $(this).attr("data-review_idx"); // 변수 review_idx에 버튼에 부여된 review_idx 저장
			var review_content = $(this).parent().parent().children(".review_content").text(); // 변수 review_content에 버튼의 부모의 부모에서 자식 클래스가 review_content인 요소 값 저장
			
			$(".modal_review_content").val(review_content);
			$(".modal_update_btn").attr("data-review_idx", review_idx);
		});
		
		/* 후기 수정 취소 버튼 클릭 시 */
		$(".modal_cancel").click(function(){
			$(".reviewModal").fadeOut(200);
		});
		
		/* 후기 삭제  */
		$(document).on("click", ".delete", function() { // .on() 메서드 : 클릭 메서드
			/*
				confirm 메서드
				내부의 텍스트를 사용자에게 보여주며 확인 버튼과 취소 버튼을 같이 보여준다
				확인 버튼을 클릭하면 참을 반환하고 취소 버튼을 클릭하면 거짓을 반환한다.
			 */
			var deleteConfirm = confirm("정말로 삭제하시겠습니까? 삭제 후 복구가 불가능합니다.");
			if (deleteConfirm) {
				var data = {review_idx : $(this).attr("data-review_idx")}; // ajax를 통해 data-review_idx 값을 전달

				$.ajax({ // 후기 삭제 관련 ajax
					url : "reviewDelete",
					type : "post",
					data : data,
					success : function(result) {
						if (result == 1) {
							reviewList();
						} else {
							alert("작성자 본인만 후기 삭제가 가능합니다")
						}
					},
					error : function() { // 로그인하지 않은 상태에서 버튼을 눌렀을 경우
						alert("로그인해주세요.")
					}
				});
			}
		});
		
		/* 수정 창  */
		$(".modal_cancel").click(function(){
			$(".reviewModal").attr("style", "display:none");
		});
	</script>
</head>
<body>
<div id="center">
<!-- 후기 시작 -->
	<div id="review">
		<!-- 비회원의 경우 -->
		<% if(session.getAttribute("user_id") == null) { %>
		<p>
			후기를 남기시려면 <a href="member.jsp">로그인</a>해주세요
		</p>
		<% }else{ %>
		<!-- 회원의 경우 -->
		<section class="reviewForm">
			<form role="form" method="post" autocomplete="off">
				<input type="hidden" id="product_idx" name="product_idx" value='<%= request.getParameter("product_idx")%>'>
				
				<!-- 후기 내용 작성 -->
				<div class="input_area">
					<textarea name="review_Content" id="review_content2" placeholder="바르고 고운 말이 세상을 아름답게 합니다"></textarea>
				</div>
				
				<!-- 후기 작성 버튼 -->
				<div class="input_area">
					<button type="button" id="review_btn">후기  작성</button>
				</div>
				
				<!-- 작성한 후기 목록 보여주기 -->
				<section class="reviewList">
					<!-- 헤더 내부에 선언한 함수 호출 > 목록 보여주기 -->
					<ol></ol>
					<script> reviewList();</script>
				</section>
				
				<!-- 후기 수정 시 창 -->
				<div class="reviewModal">
					<div class="modalContent">
						<div>
							<textarea class="modal_review_Content" name="modal_review_Content"></textarea>
						</div>
					</div>
					<div>
						<button type="button" class="modal_update_btn">후기 수정</button>
						<button type="button" class="madal_cancel">수정 취소</button>
					</div>
					<div class="modalBackground"></div>
				</div>
			</form>
		</section>
		<% } %>
	</div>
</div>
</body>
</html>