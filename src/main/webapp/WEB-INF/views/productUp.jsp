<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productUp</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/project.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		$('#button').click(function(){
			console.log('button click!');
			if($('#product_title').val() == ''){				
				alert('상품명을 입력하세요.');
			} else if($('#product_img').val() == ''){		
				alert('이미지 주소를 입력하세요.');
			} else if($('#product_price').val() == ''){		
				alert('가격을 입력하세요.');
			} else if($('#product_category').val() == ''){		
				alert('상품 카테고리을 입력하세요.');
			} else if($('#product_description').val() == ''){		
				alert('상품 상세설명을 입력하세요.');
			}else{
				$('#form').submit();
			}
		})	
});
		  
		  
		  $(document).ready(function(){
			  var replaceNotInt = /[^0-9]/gi;
        $("#product_price").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceNotInt)) {
                   x = x.replace(replaceNotInt, "");
                }
                $(this).val(x);
            }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceNotInt, ""));
        });
		  });
 
        
    
	//p_page, p_price int형만 입력되게 설정 	
</script>

<style>
td {
	background: white;
	height: 30px;
}
input:invalid{
	border-color:red;
}
</style>
</head>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="../../top.jsp"></jsp:include>
		</div>
		<div id="center">
			<form action="productUpdate" id="form">
				<div class="form-group">
					<label for="title"></label> <input type="hidden" name="product_idx"
						class="form-control" name="product_idx" value="${one.product_idx}">
				</div>
				<div class="form-group">
					<label for="content">product_title:</label> 					
					<textarea rows="5" cols="5" class="form-control" name="product_title" id="product_title"
						style="background: white-space;color: green; font-weight: bold;"
					>${one.product_title}</textarea>
				</div>
				<div class="form-group">
					<label for="content">product_img:</label> 					
					<textarea rows="5" cols="5" class="form-control" name="product_img" id="product_img"
						style="background: white-space;color: green; font-weight: bold;"
					>${one.product_img}</textarea>
				</div>
				<div class="form-group">
					<label for="title">product_price:</label> <input type="text" 
						class="form-control" name="product_price" id = "product_price" value="${one.product_price}" pattern="[0-9]+"><p>정수로 입력</p>
				</div>
				
				
				<!-- 카테고리 지정된 영역 내에서 변경할 수 있게 변경 -->
				

				<%-- <div class="form-group">
					<label for="content">product_category:</label> 					
					<textarea rows="5" cols="5" class="form-control" name="product_category" id="product_category"
						style="background: white-space;color: green; font-weight: bold;"
					>${one.product_category}</textarea>

				</div> --%>
				
			<div>
				<label for="content">product_category :</label> 
							<select name = "product_category">
								<option value ="">카테고리 선택</option>
								<option value = "가디건">가디건</option>
								<option value = "진">진</option>
								<option value = "드레스">드레스</option>
								<option value = "맨투맨">맨투맨</option>
								<option value = "블레이저">블레이저</option>
								<option value = "셔츠">셔츠</option>
								<option value = "쇼츠">쇼츠</option>
								<option value = "스커트">스커트</option>
								<option value = "재킷">재킷</option>
								<option value = "탑">탑</option>
								<option value = "팬츠">팬츠</option>
							</select>
			</div>

				
				<div class="form-group">
					<label for="content">product_description:</label> 					
					<textarea rows="5" cols="5" class="form-control" name="product_description" id="product_description"
						style="background: white-space;color: green; font-weight: bold;"
					>${one.product_description}</textarea>
				</div>
				<button id = "button" type="button" class="btn btn-light">Submit</button>
			</form>
		</div>
	</div>
</body>
</html> 