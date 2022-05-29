<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productList</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type = "text/javascript">

	 $(function(){
		//alert('test..')
		$.ajax({
			url : "productList", 
			success: function(result){ //views/list.jsp의 결과 
				$('#d1').html(result)//결과가 담겨진 table
			},
			error: function() {
				alert('실패')
			}
		
		})
	}) 
</script>
<div id = "total">
	<p style="float:right">
		<button type="button" class="btn btn-warning" onClick="location.href='http://127.0.0.1:8000/tag/'">카테고리 분류</button>
		<button type="button" class="btn btn-warning" onClick="location.href='http://127.0.0.1:8000/chart'">차트 보기</button>
	</p>
	<div>
		<div id="d1"></div>
	</div>
</div>
</body>
</html>