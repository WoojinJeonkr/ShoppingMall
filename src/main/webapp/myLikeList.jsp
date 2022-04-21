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
<script type="text/javascript">
$(function(){
	//alert('test..')
	$.ajax({
		url : "myLikeList",
		type: "get", 
		data:{
			user_id: '${user_id}',
		},
		success: function(result){
			
			console.log('result:'+result)
			$('#d1').html(result)
			
			/* console.log(jsonData)
			var jsonData2 = JSON.stringify(data) */ 
			
			/* console.log("jsonData2:"+jsonData2)
			console.log("jsondata:"+JSON.stringify(jsonData))
			console.log(jsonData2[0]["product_idx"])
			 */
			/* $(jsonData).each(function(index, item){
				 product_idx.push(item.product_idx); 
				user_id.push(item.user_id);
				product_price.push(item.product_price); 
				product_description.push(item.product_description)
				product_title.push(item.product_title);
				product_category.push(item.product_category);
				product_img.push(product_img); 
			}) */
			
			 /* const uri = location.href="myLike2.jsp?jsonData2="+jsonData2; 
			
			const encoded = encodeURI(uri);
			console.log(encoded);

			try {
			  console.log(decodeURI(encoded));
			} catch (e) { 
			  console.error(e);
			} */
		},
		error: function() {
			console.log('myProductLike error')
		}
	
	})
}) 

</script>
<body>

 
 <!-- modelAttribute는 클라이언트 쪽으로 가지 않고  views쪽으로 
	보낼 수 있기 때문에 서로 응답하는 지점이 다르다.-->
	<div id = "total">
	<%-- <div id = "top">
		<jsp:include page="top.jsp"></jsp:include>
	</div> --%>
	<div>
		<div id="d1"></div>
	</div>


</body>
</html>