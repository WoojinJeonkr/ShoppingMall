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
		if($('#p_category').val() == ''){				
			alert('카테고리를 입력해주세요.');
		} else if($('#p_isbn').val() == ''){		
			alert('ISBN을 입력해주세요.');
		} else if($('#p_author').val() == ''){		
			alert('저자를 입력해주세요.');
		} else if($('#p_company').val() == ''){			
			alert('회사명 입력하세요.');
		}  else if($('#p_page').val() == ''){			
			alert('페이지수를 입력하세요.');
		} else if($('#p_weight').val() == ''){		
			alert('무게를 입력 하세요.');
		} else if($('#p_price').val() == ''){		
			alert('가격을 입력 하세요.');
		}else if($('#p_title').val() == ''){		
			alert('책 제목을 입력 하세요.');
		}else if($('#p_content').val() == ''){		
			alert('책 내용을 입력 하세요.');
		}else{
			$('#form').submit();
		}
		})	
	});
	//p_page, p_price int형만 입력되게 설정 	
	
	// 숫자가 아닌 정규식
    var replaceNotInt = /[^0-9]/gi;
    
    $(document).ready(function(){
        
        $("#p_page").on("focusout", function() {
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
				p_category :<input type="text" class="form-control"name="p_category" id="p_category"/><br>
				 p_isbn :<input type="text" class="form-control" name="p_isbn" id="p_isbn"/><br>
				p_author :<input type="text" class="form-control" name="p_author" id="p_author" /><br>
				 p_company :<input type="text" class="form-control" name="p_company" id="p_company" /><br>
				p_page :<input type="text" class="form-control" name="p_page"
				 id="p_page" pattern="[0-9]+"  /><p>숫자로 입력</p><br>
				 p_weight<input type="text" class="form-control" name="p_weight" id="p_weight" /><br>
				p_price:<input type="text" class="form-control" name="p_price"
				 id="p_price" pattern="[0-9]+" /><p>숫자로 입력</p><br> 
				p_title:<input type="text" class="form-control" name="p_title" id="p_title" /><br>
				p_content<input type="text" class="form-control" name="p_content" id="p_content" /><br> 
				p_img<input type="text" class="form-control" name="p_img" value="defaultbook.jpg" /><br>
				<button id="button" type="button" class="btn btn-success">Submit</button>

			</form>
		</div>
	</div>
</body>
</html>