<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			if($('#p_category').val() == ''){				
				alert('카테고리를 입력해주세요.');
			} else if($('#p_price').val() == ''){		
				alert('가격을 입력해주세요.');
			} else{
				$('#form').submit();
			}
		})	
});
		  
		  
		  $(document).ready(function(){
			  var replaceNotInt = /[^0-9]/gi;
        $("#p_price").on("focusout", function() {
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
					<label for="title"></label> <input type="hidden" name="p_idx"
						class="form-control" name="p_idx" value="${one.p_idx}">
				</div>
				<div class="form-group">
					<label for="content">p_category:</label> 					
					<textarea rows="5" cols="5" class="form-control" name="p_category" id="p_category"
						style="background: white-space;color: green; font-weight: bold;"
					>${one.p_category}</textarea>
				</div>
				<div class="form-group">
					<label for="title">p_price:</label> <input type="text" 
						class="form-control" name="p_price" id = "p_price" value="${one.p_price}" pattern="[0-9]+"><p>정수로 입력</p>
				</div>
				<button id = "button" type="button" class="btn btn-success">Submit</button>
			</form>
		</div>
	</div>
</body>
</html> 