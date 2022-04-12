<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#button').click(function(){
		console.log('button click!');
		if($('#product_title').val() == ''){				
			alert('상품 이름을 입력하세요.');
		} else if($('#product_img').val() == ''){		
			alert('이미지 주소를 입력하세요.');
		} else if($('#product_price').val() == ''){		
			alert('가격을 입력하세요.');
		} else if($('#product_category').val() == ''){			
			alert('카테고리명을 입력하세요.');
		} else if($('#product_description').val() == ''){		
			alert('상품 상세설명을 입력 하세요.');
		}else{
			$('#form').submit();
		}
		})	
	});
	
	//product_price, product_like int형만 입력되게 설정 	
	
	// 숫자가 아닌 정규식
    var replaceNotInt = /[^0-9]/gi;
    
    $(document).ready(function(){
        
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
    
 	$(document).ready(function(){
        
        $("#product_like").on("focusout", function() {
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
		
</script>
<style>
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
	       <h3>상품정보 등록</h3>
		<br>
		 <form action="productIn" id="form">
				product_title :<input type="text" class="form-control"name="product_title" id="product_title"/><br>
				 product_img :<input type="text" class="form-control" name="product_img" id="product_img"/><br>
				product_price:<input type="text" class="form-control" name="product_price"id="product_price" pattern="[0-9]+" /><p>숫자로 입력</p><br>
				
				
				<!-- 카테고리명 지정된 영역 내에서 선택 할 수 있게 변경 -->
				product_category :<input type="text" class="form-control" name="product_category" id="product_category" /><br>
				
				
				
				
				
				<!-- product_like:<input type="text" class="form-control" name="product_like"id="product_like" pattern="[0-9]+" value=0/><p>숫자로 입력</p><br> -->
				product_description:<input type="text" class="form-control"name="product_description" id="product_description"/><br>
				
			<button id="button" type="button" class="btn btn-success">Submit</button>
		 </form>
		</div>
	</div>
</body>
</html>