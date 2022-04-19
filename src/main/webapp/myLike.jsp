<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myLike</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="resources/js/basket.js"></script>

<link rel = "stylesheet" type = "text/css" href = "resources/css/project.css">
<link rel = "stylesheet" type = "text/css" href = "resources/css/basket.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

<script type="text/javascript">

$(function(){
	//alert('test..')
	$.ajax({
		url : "myProductLike",
		type: "get", 
		data:{
			user_id: '${user_id}',
		},
		success: function(jsonData){
			
			console.log(jsonData)
			
			$(jsonData).each(function(index, item){
				/* product_idx.push(item.product_idx); 
				user_id.push(item.user_id);
				product_price.push(item.product_price); 
				product_description.push(item.product_description)
				product_title.push(item.product_title);
				product_category.push(item.product_category);
				product_img.push(product_img); */ 
			
			
			})
			
			
			
		},
		error: function() {
			console.log('myProductLike error')
		}
	
	})
}) 

</script>
<body>
<!-- myLikeInfo[{product_rgstdate=2022-04-05 11:23:00.0, product_idx=2, likecheck=1, user_id=jack, like_idx=248, product_price=49900,
 product_description=가디건&풀오버, product_title=크롭트 가디건, product_category=가디건, product_img=cardigan.jpg}] -->
	<div id = "top">
		<jsp:include page="top.jsp"></jsp:include>
	   <a href="productList.jsp">리스트 목록으로 </a>
	</div> 

	<h2>myLike</h2>





</body>
</html>