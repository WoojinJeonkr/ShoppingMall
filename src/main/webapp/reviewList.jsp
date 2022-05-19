<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<!-- favicon.ico 404 Not found error 해결 -->
<link rel="icon" href="data:;base64,iVBORw0KGgo="> 
<title>Review Page</title>
<%
	int product_idx = Integer.parseInt(request.getParameter("product_idx"));	
%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel = "stylesheet" type = "text/css" href = "resources/css/reviewStyle.css">
<!-- 함수로 사용할 스크립트들은 특별한 이유가 있지 않은 한 헤드 내부에 위치시킨다 -->
<script>
	review_idx2 = 0
	// 구매 후기 불러오기
	function reviewList(){ // reviewList()라는 함수로 생성
		$.getJSON("reviewList?product_idx=<%= product_idx%>", function(data){ // 비동기식으로 제이슨(Json) 데이터를 가져옴
			var str = "";
			$.each(data, function(idx, one){
				console.log(one); // 콘솔에서 data 확인

				var review_rgstdate = new Date(this.review_rgstdate);
				review_rgstdate = review_rgstdate.toLocaleString()
				
				// HTML 코드 조립
				str += "<li>"
					+ "<div class='userInfo'>"
					+ "<span class='userName'>" + this.user_name + "</span>"
					+ "<span class='date'>" + review_rgstdate + "</span>"
					+ "<p></p>"
					+ "</div>"
					+ "<span class='review_score' readonly>" + "[" + this.review_score + "점]" + "&nbsp;" + "</span>" 
					+ "<span class='review_content'>" + this.review_content + "</span>"
					+ "<p></p>"
					+ "<span class='review_img' readonly>" + "<img src=resources/upload/" + this.review_img + "></span>" 
					+ "<span class='review_label' style='font-size:10rem;'> &#x" + this.review_label + "; </span>"
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
	
	// 후기 목록 무한스크롤
	$(window).scroll(function() {
		if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			reviewList();
		}
	});
	
	/* 버튼 관련 스크립트 */
	$(function(){
		/* 후기 작성  */
		$("#review_btn").click(function(){
			const imageInput = $("#file")[0]; // 파일을 여러 개 선택할 수 있으므로 files라는 객체에 담긴다.
			console.log("imageInput:", imageInput.files)
			
			if(imageInput.files.length == 0){
				alert('파일을 선택해주세요!!')
				return;
			}
			
			var form = $('#form')[0];
			const formData = new FormData(form);
			formData.append("product_idx", $("#product_idx").val());
			formData.append("review_content", $("textarea#review_content2").val());
			formData.append("file", imageInput.files[0]);
			formData.append("review_score", $("input:radio[name=star]:checked").val());
			
			$.ajax({
				url : "reviewCreate", // 데이터가 전송될 주소
				type : "post", // 타입
				processData: false,
		        contentType: false,
		        cache: false,
		        timeout : 600000,
		        enctype: 'multipart/form-data',
				data : formData, // 전송될 데이터
				success : function(){ // 데이터 전송이 성공되었을 경우 실행할 함수부
					reviewList();
					$("textarea#review_content2").val("") // 입력창 초기화
					href.location="reviewList.jsp?product_idx=<%=product_idx%>"
				},
				error: function() {
					alert('실패')
				}
			});
		});
	});
	
	/* 후기 수정  */
	function update(){
		var updateConfirm = confirm("정말로 수정하시겠습니까?");

		if(updateConfirm){
			var data = {
				review_idx : review_idx2,
				review_content : $('.modal_review_content').val()
			}; //reviewVO 형태로 데이터 생성
							
			$.ajax({ // 후기 수정 관련 ajax
				url : "reviewUpdate",
				type : "post",
				data : data,
				success : function(result){
					
					// result 값에 따라 동작
					if(result == 1) {
						reviewList();
						$(".reviewModal").fadeOut(200);
					} else {
						alert("작성자 본인만 후기 수정이 가능합니다")
					}
				},
				error: function(){
					alert("로그인해주세요.")
				}
			});
		}
	}
	

	/* 목록에서 후기 수정 버튼 클릭 시 */
	$(document).on("click", ".update", function(){
		$(".reviewModal").fadeIn(200);
		
		var review_idx = $(this).attr("data-review_idx"); 
		var review_content = $(this).parent().parent().children(".review_content").text();
		review_idx2 = review_idx
		$(".modal_review_content").val(review_content);
		$("#modal_update_btn").attr("data-review_idx", review_idx);
	});
	
	/* 후기 수정 취소 버튼 클릭 시 */
	function cancel(){
		$(".reviewModal").fadeOut(200);
	}
	
	/* 후기 삭제  */
	$(document).on("click", ".delete", function() {

		var deleteConfirm = confirm("정말로 삭제하시겠습니까? 삭제 후 복구가 불가능합니다.");
		if (deleteConfirm) {
			var data = {review_idx : $(this).attr("data-review_idx")};
			
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
	
	/* 평균 평점 반영 */
	var data = {product_idx : <%=product_idx%>}
	
	$.ajax({ // 평균 평점 관련 ajax
		url : "scoreAvg",
		type : "post",
		data : data,
		success : function(result) {
			$('#scoreTotal').html("&emsp;" + result.toFixed(1) + "점");
		},
		error : function() {
			str2 = "&emsp;" + "현재 집계된 평점이 없습니다"
			$('#scoreTotal').html(str2);
		}
	});
	
	/* 업로드하는 이미지 파일 크기 확인 */
	function fileCheck(file)
	{
	    // 사이즈체크
	    var maxSize  = 5 * 1024 * 1024    //30MB
	    var fileSize = 0;

		// 브라우저 확인
		var browser=navigator.appName;
		
		// 익스플로러일 경우
		if (browser=="Microsoft Internet Explorer")
		{
			var oas = new ActiveXObject("Scripting.FileSystemObject");
			fileSize = oas.getFile( file.value ).size;
		} else {
		// 익스플로러가 아닐경우
			fileSize = file.files[0].size;
		}

		alert("파일사이즈 : "+ fileSize +", 최대파일사이즈 : 5MB");

        if(fileSize > maxSize)
        {
            alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
            return;
        }
	}
</script>
</head>
<body>
<div id="top"><jsp:include page="top.jsp"></jsp:include></div>
<div id="center">
<!-- 후기 시작 -->
	<div id="review">
		<!-- 비회원의 경우 -->
		<% if(session.getAttribute("user_id") == null) { %>
		<p class="loginnotice">
			비회원 상태입니다. 후기를 남기시려면 <a href="member">&nbsp;로그인</a>해주세요
		</p>
		<% }else{ %>
		<!-- 회원의 경우 -->
		<form role="form" id="form" method="post" autocomplete="off" enctype="multipart/form-data" accept-charset="UTF-8">
			<section class="reviewForm">
				<input type="hidden" id="product_idx" name="product_idx" value='<%= request.getParameter("product_idx")%>'>
				
				<!-- 평점 선택 부분-->
				<div class="score_div">
					<table>
						<tr>
							<th>총 평점:</th>
							<th id="scoreTotal"></th>
						</tr>
						<tr>
							<th>
								<div class="startRadio">
									<label class="startRadio__box">
										<input type="radio" name="star" value="0.5">
										<span class="startRadio__img"><span class="blind">별 0.5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star"value="1.0">
										<span class="startRadio__img"><span class="blind">별 1.0개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" value="1.5">
										<span class="startRadio__img"><span class="blind">별 1.5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" value="2.0">
										<span class="startRadio__img"><span class="blind">별 2.0개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" value="2.5">
										<span class="startRadio__img"><span class="blind">별 2.5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" value="3.0">
										<span class="startRadio__img"><span class="blind">별 3.0개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" value="3.5">
										<span class="startRadio__img"><span class="blind">별 3.5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" value="4.0">
										<span class="startRadio__img"><span class="blind">별 4.0개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" value="4.5">
										<span class="startRadio__img"><span class="blind">별 4.5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" value="5.0">
										<span class="startRadio__img"><span class="blind">별 5.0개</span></span>
									</label>
								</div>
							</th>
							<th style="color:red">&emsp;평점은 수정이 불가능하니 정확히 선택해주세요!!</th>
						</tr>
					</table>
				</div>
				
				<!-- 후기 내용 작성 -->
					<div class="input_area">
						<textarea id="review_content2" placeholder="바르고 고운 말이 세상을 아름답게 합니다"></textarea>
					</div>
					<input type="file" name="file" id="file">
					<!-- 후기 작성 버튼 -->
					<div class="input_area">
						<button type="button" id="review_btn" onclick= "fileCheck(this.form.file)">후기  작성</button>
					</div>

				<!-- 작성한 후기 목록 보여주기 -->
				<section class="reviewList">
				<h2> 구매 후기 </h2>
				<p style='color:red'>중의적인 표현을 사용할 경우 부정으로 판단될 수 있으니 유의바랍니다</p>
					<!-- 헤더 내부에 선언한 함수 호출 > 목록 보여주기 -->
					<ol reversed></ol>
					<script> reviewList();</script>
				</section>
				
				<!-- 후기 수정 시 창 -->
				<div class="reviewModal">
					<div class="modalContent">
						<div>
							<textarea class="modal_review_content" name="modal_review_content"></textarea>
						</div>
						
						<div>
							<button type="button" id="modal_update_btn" onclick="update()">후기 수정</button>
							<button type="button" id="modal_cancel" onclick="cancel()">수정 취소</button>
						</div>
					</div>
					<div class="modalBackground"></div>
				</div>
			</section>
		</form>
	<% } %>
	</div>
</div>
</body>
</html>