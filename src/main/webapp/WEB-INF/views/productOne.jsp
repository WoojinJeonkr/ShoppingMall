<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
 .product_left{
 float:left;  max-width:50%; max-height: auto;display: block;
}
.product_right{
 float:right; max-width: 50%; display: block;
} */
/* .main_product_img{
  max-width:500px;
} */


</style>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript" src="resources/js/basket.js"></script>
	
	<link rel = "stylesheet" type = "text/css" href = "resources/css/project.css">
	<link rel = "stylesheet" type = "text/css" href = "resources/css/basket.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-eduwell-style.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
<script type="text/javascript">



$(function () {
	$('#add').click(function(){
	
	$.ajax({
		url: 'productAdd',
		data : {
			product_idx: '${one.product_idx}', //string 
			product_title:'${one.product_title}', //string
			product_idx : '${one.product_idx}',
			product_price: ${one.product_price} //int
			
		},
		success: function(result){
			alert(result)
			if(confirm("장바구니를 확인하시겠습니까?")){
				location.href ="basket.jsp"
			}
		},
		error: function(){
			alert("ajax 에러 발생.")
			}//error
		});//ajax
	});//click


 $('#deleteBtn').click(function() {
	if(confirm("정말로 삭제하시겠습니까?")){
		$.ajax({
			url: "productDel",
			data: {
				product_idx: ${one.product_idx}	
			},
			success : function(result) {
				if(result == '1'){
					location.href = "productList.jsp"
					}
				},
			error:function(){
				alert('삭제 실패')
				}
			});
		}
	}); 
	
		/* $('#love').click(function() {
		$.ajax({
			url:"createMemberLike",
			data:{
				user_id: ${user_id}
				product_idx : ${product_idx}
			},
			success: 

			 }
		   }
		
		})
	})
		
	*/
	
	    let likecheck = []; 
		let user_id = []; 
		let product_idx = []; 
	
	
		$.ajax({
			url:"selectMemberLikeOne",
			type:'get', 
			data:{
				user_id: '${user_id}',
				product_idx : ${one.product_idx}
			},
			success: function(jsonData) { 
				
				console.log(jsonData)
				
				$(jsonData).each(function(index, item){
					
					likecheck.push(item.likecheck);
					
					console.log('LikeOne likecheck:'+likecheck);
					
					
				});
				
				if(likecheck == 1){
					console.log('이전에 좋아요 클릭한 상태')
					$('#likecheck').val(1); 
					$('#likebtn').attr('class', 'btn btn-danger'); 
				}else{
					console.log('이전에 좋아요를 누르지 않았음.')

					$('#likecheck').val(''); 

					$('#likebtn').attr('class', 'btn btn-light'); 
				}
				
				
			 }, error:function(jsonData){
				 console.log('에러')
			 }
			
			
		   });//ajax
			
		
		   $(function(){
				//alert('test..')
				$.ajax({
					url : "likeCheck", 
					data:{
						user_id: '${user_id}',
						product_idx : ${one.product_idx}
					},
					success: function(result){
						console.log('likecheck 값'+result)
						console.log('likecheck 성공')
						
						if(result==1){
							console.log('이전에 좋아요 클릭한 상태')
							$('#likeck').val(1); 
							$('#likebtn').attr('class', 'btn btn-danger'); 
						}else{
							console.log('이전에 좋아요를 누르지 않았음.')
							$('#likeck').val(''); 
							$('#likebtn').attr('class', 'btn btn-light'); 
						}
					},
					error: function() {
						console.log('likecheck 실패')
					
					}
				
				})
			}) 
		

			    $(function(){
				 $("#likeDelbtn").on("click",function(){ 
					//alert('test..')
					$.ajax({
						url : "likeCheckRevert", 
						type:'post', 
						data:{
							user_id: '${user_id}',
							product_idx : ${one.product_idx}
						},
						success: function(result){
							console.log(location.reload )
							  if (self.name != 'reload') {
							         self.name = 'reload';
							         self.location.reload(true);
							     }
							     else self.name = ''; 
							
						},
						error: function() {
							console.log(location.reload )
							
							  if (self.name != 'reload') {
							         self.name = 'reload';
							         self.location.reload(true);
							     }
							     else self.name = ''; 
							
							
						}
					
					})
				 })
			})    
				
			
			
			 $(function(){
				 $("#likebtn").on("click",function(){ 
				//alert('test..')
				$.ajax({
					url : "likeCheckInsert", 
					data:{
						user_id: '${user_id}',
						product_idx : ${one.product_idx}
					},
					success: function(result){
						console.log('likeInsert 성공')
						   if (self.name != 'reload') {
					         self.name = 'reload';
					         self.location.reload(true);
					     }
					     else self.name = '';   
					},
					error: function() {
						console.log('likeInsert 실패')
						   if (self.name != 'reload') {
					         self.name = 'reload';
					         self.location.reload(true);
					     }
					     else self.name = '';  
					}
				
				})
				
			 })
		}) 
		
		
		//에러를 찾기 위함. 
		 error: (error) => {
             console.log(JSON.stringify(error));
		}
		 
		 
		$.ajax({
			url:'getProductIdxByLike',
			type:'get',
			success:function(jsonData){
				
				
				product_idx = []; 
				likecheck = []; 
				
				$(jsonData).each(function(index,item){
					product_idx.push(item.product_idx); 
					likecheck.push(item.likecheck); 
				});
				
				console.log('product_idx'+product_idx)
				console.log('likecheck'+likecheck)
				
				let data = {
						
						labels : product_idx,
						datasets : [{
							
							label : 'ProductIdx by Like number',
							data: likecheck,
							backgroundColor : [
								
								  'rgba(255, 99, 132, 0.2)',
							      'rgba(255, 159, 64, 0.2)',
							      'rgba(255, 205, 86, 0.2)',
							      'rgba(75, 192, 192, 0.2)',
							      'rgba(54, 162, 235, 0.2)',
							      'rgba(153, 102, 255, 0.2)',
							      'rgba(201, 203, 207, 0.2)'
								
							],
							borderColor: [
								
								 'rgb(255, 99, 132)',
							      'rgb(255, 159, 64)',
							      'rgb(255, 205, 86)',
							      'rgb(75, 192, 192)',
							      'rgb(54, 162, 235)',
							      'rgb(153, 102, 255)',
							      'rgb(201, 203, 207)'
							
							],
							
							borderWidth: 1
							
							}]	
						
					}; //let data
					
					let config = {
										type: 'bar', 
										data : data, 
										options : {
											scales:{
												y:{
													beginAtZero:true
												}
											}
										},
								};
					
							var myChart = new Chart(document.getElementById('myChart'), config); 
				
						}
			
			
				});
		
	}); //$


/* $(function(){
	
	var sum = $("#sum").hasClass("sum")
	console.log(sum);
});
 */


 		//서버가 작동할 떄 
 		//JAVA>JSTL>HTML>Javascript순으로 작동하기 떄문에 
 		//Javascript에서는 jstl이나 태그의 값을 다루는데에 제한적일 수 밖에 없다. 
 		//다만 스크립트가 로드되기 전부터 존재하는 el값은 스크립트에서 조작이 가능하다 
 		//ex) ${item1.name}(x)
 		//ex) var list = '<c:out value="${list}"/>'; 
 		
		function total(){
			
		

		 var p_price1 =  document.getElementById("p_price1").value; 
		 var p_num1 = document.getElementById("p_num1").value;
		 var total = p_price1 * p_num1 
		 console.log(total); 

		 
		 
		 //파라미터를 넘길 때 &구분자를 기준으로 인식하기 때문에 잊지않고 꼭 써주기. 
		 
		 location.href="purchaseList?payment_total="+total+"&user_id="+'<c:out value="${user_id}"/>'
				 +"&product_title="+'<c:out value="${one.product_title}"/>'
				 +"&product_idx="+'<c:out value="${one.product_idx}"/>'+"&p_num1="+p_num1+"&product_img="+'<c:out value="${one.product_img}"/>'; 
    	}

		/*  var level = [];
		
		$(function(){
			//alert('test..')
			$.ajax({
				url : "getUserLevel",
				type: "get", 
				data:{
					user_id: '${user_id}',
				},
				
				success: function(result){
					
					console.log('levelValue 조회 성공')
					console.log(result)
					
					$(result).each(function(index, item){
					
					level.push(item.level);
					
					console.log('getUserLevel level:'+level);
					
					});
					
				},
				error: function() {
					console.log('levelValue 조회 실패')
				}
			
			})
		})   */
		
</script>
</head>
<body>

<div id = "top">
	   <jsp:include page="../../top.jsp"></jsp:include>
	   <!-- <button type="button" class="btn btn-light"><a href="productList.jsp">리스트 목록으로 </a></button> -->
</div> 

<section class="main-banner" id="top">
      <div class="row">
        <div class="col-lg-6 align-self-center">
          <div class="header-text">
            <h6>상품 상세정보</h6>
            <div class="main-button-gradient">
              <!-- 상품 정보 -->
    <div class="product_left"> 
   	   <img src="resources/img/${one.product_img}" style = width:50%; >
     	  
     	  <div class="product_right"> 
		     <div style="display: none;">${one.product_idx}</div> <!-- one.getId() -->
		     <div>이름:${one.product_title}</div> 
		     <div>카테고리:${one.product_category}</div>
		     <div>상세 설명:${one.product_description}</div>
	      	 <div>등록일:${one.product_rgstdate.substring(0,10)}</div> 
	      	 <div>수정일:${one.product_mdfydate} </div>
		     
		     <div class="subdiv">
                        <div class="basketprice">
                        	<input type="hidden" name="p_price" id="p_price1" class="p_price" value="${one.product_price}">${one.product_price}원
                       	</div>
                        <div class="num">
                            <div class="updown">
                                수량 입력[최대 99]: <br>
                             <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(1);">
                            </div>
                        </div>



				

					 <% if(((int)(session.getAttribute("user_level")) == 1 )|| (((int)session.getAttribute("user_level")) == 2)){ %> 
					
                       	구매 시 버튼 클릭:<button onclick="total()" class="btn btn-light"><div id = "sum" class="sum">상품구매</div></button>

                    </div> 	 
	    		 
   		 			<div>
						<a><button type = "button" id="likebtn" class="btn btn-light">❤좋아요</button></a>
  		  					<a><button type = "button" id="likeDelbtn" class="btn btn-light">❤ revert</button></a>
   		  			</div>
      	 
			      	 <a><button id = "add" class="btn btn-light">장바구니</button></a> 
			      	 
		      	  <%}%>  
			      	 
			      	 <a href="reviewList.jsp?product_idx=${one.product_idx}" ><button class="btn btn-light">리뷰보기</button></a>
	   			 </div>
		    

		    <!-- 관리자만 버튼 보이게 -->
		    <%if((int)(session.getAttribute("user_level"))==2){ %> 

     	 <div>
	      	 <a href="productInsert"><button class="btn btn-light">상품 생성</button></a>
			 <a href="productUp?product_idx=${one.product_idx}"><button class="btn btn-light">상품 수정</button></a>
			 <a><button id="deleteBtn" class="btn btn-light">상품 삭제</button></a>
			 <a href="publicData"><button class="btn btn-light">공공 데이터</button></a>
      	 </div>
      	  <%} %> 
      	 <div class="right-content">
                       
9 a.m.-6 p.m. / Sat, Sun, Holiday
Check the full sensitivity question.
1:1 consultation is available.
For product inquiries, please use the product Q&A.

                        </div>
      	 <!-- 차트를 생성하려면 Chart 클래스를 인스턴스화 차트를 그리고 싶은 캔버스의 노드, jQuery 인스턴스 또는 2D 컨텍스트를 전달 -->
      	 <canvas id="myChart" width = "400" height = "400"></canvas>
      	 
  </div>	 
            </div>
          </div>
        </div>
      </div>
  </section>

<section class="simple-cta">
    <div class="container">
      <div class="row">
        <div class="col-lg-5 offset-lg-1">
          <div class="left-image">
            <img src="assets/images/cta-left-image.png" alt="">
          </div>
        </div>
        <div class="col-lg-5 align-self-center">
          <h4>Apparel ShoppingMall</h4>
          <p class="copyright">Copyright © 2022 EduWell Co., Ltd. All Rights Reserved. 
          <!-- <div class="white-button">
            <a href="contact-us.html">View Courses</a>
          </div> -->
        </div>
      </div>
    </div>
  </section>	
	
	
	  
<div id = "total">

</div>
</body>
</html>