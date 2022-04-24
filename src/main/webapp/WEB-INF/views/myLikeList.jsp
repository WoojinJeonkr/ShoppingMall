<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myProductLikeViews</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/project.css">
<script>
 
</script>
 <style>
    .box01{
       border-width:5px; 
       border-style:solid; 
       border-color:#F6F6F6;
    }
  
	/* tbody{
		height:1200px;
		display:inline-block; 
		width:1800px; 
		overflow: auto; 
	}
	
	#wrapper{
		width:300px;
		margin:auto;
	} */
	
</style> 

</head>
<body>
<div id = "top">
		<jsp:include page="../../top.jsp"></jsp:include>
</div>

<!-- myLikeInfo[{product_rgstdate=2022-04-05 11:23:00.0, product_idx=2, likecheck=1, user_id=jack, like_idx=248, product_price=49900,
 product_description=가디건&풀오버, product_title=크롭트 가디건, product_category=가디건, product_img=cardigan.jpg}] -->
 
 <table border="1"> 
 <tr>
 
	<%
	 int i=0; 
	%>  
			   <c:forEach items="${myLikeInfo}" var="one">
					<%
		i+=1;
	%>
	
	<td>
					<div>
						<div><img src="resources/img/${one.product_img}" width="30px" height="30px" ></div>
						<div>${one.product_title}</div>
						<div>${one.product_category}</div>
						<div>￦${one.product_price}</div>
					</div>
					
					
	</td>
	<%
		if(i%6==0){
	%>
		<tr>
		</tr>
		<%
		}
		%>
					
				</c:forEach>
				
</table>
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

</body>
</html>