<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="resources/css/project.css"> -->

<!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-eduwell-style.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
    
    
</head>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js">

/* 	$(document).ready(function(){
			$('#btn').click(function(){
					$('#productForm').submit();
			});
	});
 */


</script>
<style>
/*  ------------사진 공간 여백----------------- */


*{margin:0;padding:0;}
#wrap{
	width:650px; 
	overflow: hidden; 
	padding-top:10px;
}

div > article{

float:left; 
margin-left:10px; 
margin-bottom:10px; 
}

img{display:block;}


/* // -------------사진 공간 여백---------------- */
    /* .box01{
       border-width:5px; 
       border-style:solid; 
       border-color:#F6F6F6;
    } */
  
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
	
	table{
	width:80%; 
	height:100px; 
	margin:auto;
	table-layout:fixed; 
	text-align:center;
	}
	
	#wrapper{
	text-align:center;
	
	}
</style>
<body>
 <div id = "top">
		<jsp:include page="../../top.jsp"></jsp:include>
</div>
<section class="page-heading">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="header-text">
           <!--  <h4>What We Do</h4> -->
            <h1>Our Fashions</h1>
          </div>
        </div>
      </div>
    </div>
    
    
 </section>

<section class="page-heading">
<form id = "productForm" action="${pageContext.request.contextPath}/productList" method ="get">

           <!--  <h4>What We Do</h4> -->
            <h4>product_category: </h4>
         <select name = "categoryName">
		<option value="">카테고리 선택</option>
		<!-- <option value="test">test</option> -->
		<!-- Controller에서 받아온 productCategory 값과 
			 쇼핑몰 이용자가 선택한 productCategory.name이 일치하면 그 값이 옵션에서 선택되고 
			 그렇지 않다면  선택된 것이 아니라 목록만 보여주게 된다.(본인은 값이 안 넘어간다로 이해.)-->
		
		<c:forEach var="c" items = "${categoryList}">
			<c:if test="${c== categoryName}">
				<option value="${c}" selected="selected">${c}</option>
			</c:if>
			<c:if test="${c!=categoryName}">
				<option value="${c}">${c}</option>
			</c:if>
		</c:forEach>
		
		</select>

    <button type="submit" class="btn btn-light"> 검색</button>
</form>    
    
<form id = "productForm" action="${pageContext.request.contextPath}/productList" method ="get"> 
 
           <!--  <h4>What We Do</h4> -->
            <h4><label for = "searchWord">apperal name</label></h4> 
	<input name = "searchWord" type = "text">
	<button type="submit" class="btn btn-light"> 검색</button>
</form>    
    
</section>
<!-- 값을 넘겨줘야 하므로 form을 만들자 -->


    

 <!-- 원래는 form 하나에 담았으나.. form 하나에 하나의 변수만 넣어줄 수 있는것으로 보인다. --> 


<br><br><br><br>

<table border="1"> 
 <tr>
 
	<%
	 int i=0; 
	%>   
   <c:forEach items="${voListResult}" var="one">
	<%
		i+=1;
	%>
	<td>

	 <!-- <div style = "height: 250px; overflow; hidden;position: relative;"> -->
	      <div class="wrap">
	      	<article><img src="resources/img/${one.product_img}" width="600px" height="300px"></article>
	      </div>
	       <% if(session.getAttribute("user_id")!=null){ %> 
		      <div><a href="productOne?product_idx=${one.product_idx}&product_img=${one.product_img}&likecheck=${one.likecheck}&user_id=${user_id}">
		   <%}else{ %>   
			<div><a href="productOne?product_idx=${one.product_idx}&product_img=${one.product_img}&likecheck=${one.likecheck}">
	      <%} %>
		      
		      ${one.product_title} <%-- [${one.product_idx}] --%></a></div>
		       
		       
		       <div>￦${one.product_price}❤${one.likecheck}</div> 
	  
	</td> 
	<%
		if(i%5==0){ //상품 5개마다 다음 행으로 이동 
	%>
		<tr>
		</tr>
		<%
		}
	
		%>
		 </c:forEach>
   </tr>
  
   </table>
   <br>
   <div id="wrapper">
		  <div>
		 
		    <c:if test="${currentPage<=1}">
		    	<button type="button" class="btn btn-light">이전</button> <!-- 버튼 활성화 안한 장식용 2페이지부터 활성화 -->
		    </c:if>
		   	
		   	<c:if test="${currentPage>1}">
		   		<button type="button" class="btn btn-light"><a href="${pageContext.request.contextPath}/productList?currentPage=${currentPage-1}&categoryName=${categoryName}&searchWord=${searchWord}"><button type="button" class="btn btn-light">이전</button></a>
		   	</c:if>
	
		     <%-- <c:if test = "${endIdx!=1}"> --%>
			   	<c:forEach begin ="${startIdx}" end ="${endIdx}" var = "pageIdx"> <!-- endPage값 문제가 있는지 확인해야 함. -->
			   			<button type="button" class="btn btn-light"><a href="${pageContext.request.contextPath}/productList?currentPage=${pageIdx}&categoryName=${categoryName}&searchWord=${searchWord}">${pageIdx}</button></a>
			   	</c:forEach>
			<%--  </c:if> --%>
		   	
		   	<c:if test="${currentPage<lastPage}">
		   		<a href="${pageContext.request.contextPath}/productList?currentPage=${currentPage+1}&categoryName=${categoryName}&searchWord=${searchWord}"><button type="button" class="btn btn-light">다음</button></a>
			</c:if>   	
		</div>
   </div>
   
   
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

 

  <!-- <section class="contact-us our-office">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="left-info">
            <div class="section-heading">
              <h6>Our Office</h6>
              <h4>Get closer to <em>EduWell</em></h4>
            </div>
            <p>Trust fund nocore broklyn humblebrag mustache
              pork kitsch, bicycle rights hexagon schlitz keytar palo is
              santo drinking vinegar fam ramps. <br><br>Four dollar toast and
              edison bulb vinyl, listicle hashtag pug scenester typewrit
              er yuccie street artboard or whatever to fill place.</p>
            <ul>
              <li>- Selfies you probably haven't heard of them.</li>
              <li>- Tousled cold-pressed chicharrones yuccie.</li>
              <li>- Pabst iPhone chartreuse shabby chic tumeric.</li>
              <li>- Scenester normcore mumblecore snackwave.</li>
            </ul>
            <div class="main-button-gradient">
              <a href="our-services.html">Our Services</a>
            </div>
          </div>
        </div>
        <div class="col-lg-8">
          <div id="video">
            <div class="thumb">
              <img src="assets/images/video-thumb.jpg" alt="">
              <div class="play-button">
                <a href="http://youtube.com" target="_blank"><i class="fa fa-play"></i></a>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-12">
          <ul class="social-icons">
            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
            <li><a href="#"><i class="fa fa-rss"></i></a></li>
            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
          </ul>
        </div>
        <div class="col-lg-12">
          <p class="copyright">Copyright © 2022 EduWell Co., Ltd. All Rights Reserved. 
          
          <br>Design: <a rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a></p>
        </div>
      </div>
    </div>
  </section> -->

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/lightbox.js"></script>
    <script src="assets/js/tabs.js"></script>
    <script src="assets/js/video.js"></script>
    <script src="assets/js/slick-slider.js"></script>
    <script src="assets/js/custom.js"></script>
    <script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
          e.preventDefault();
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>
   
</body>
</html>