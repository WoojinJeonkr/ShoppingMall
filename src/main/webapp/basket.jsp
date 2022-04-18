<%@page import="com.hi.clothingStore.vo.ProductListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basket</title>
<link rel = "stylesheet" type = "text/css" href = "resources/css/project.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/css/basket.css" />
<style>
	.text_over{
	overflow: hidden;
	text-overflow:ellipsis;
	white-space: nowrap; /* 텍스트 칸 일정하게 유지 */
	}
</style>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="resources/js/basket.js"></script>
<script type="text/javascript">
/* $('#del').click(function() {
			if(confirm("정말로 삭제하시겠습니까?")){
				//controller의 bbsDel요청 후,
				//삭제가 성공하면, 
				//bbs.jsp로 화면을 넘기면 됨
				$.ajax({
					url: "basketDel",
					data: {
						id: ${one.p_idx}	
					},
					success : function(result) {
						
						if(result == '1'){
							location.href = "basket.jsp"
						}
					}
				})
			}
		}) */
	</script>	
</head>
<body>
<div id = "total">
	<div id = "top">
		<jsp:include page="top.jsp"></jsp:include>
	</div>
	<div id = "center">
		<h3>장바구니 목록</h3>
		<hr>
		
		<%
			ArrayList<ProductListVO> list = (ArrayList<ProductListVO>) session.getAttribute("basket");
			if(list != null){
		%>
		
		
		
		
		<%-- <span><%=list.size()%></span>개의 물건이 장바구니에 들어있습니다. --%>
		 
		 <%int i=0; %>
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="pname" align="center">상품명</div>
                    </div>
                    <div class="subdiv">
                          <div class="basketprice" align="center">상품번호</div>
                    	<div></div>
                    	<div></div>
                    </div>
                    <div class="subdiv">
                        <div class="pname">가격</div>
                    </div>
                    <div class="split"></div>
                </div>
   <%
   		for(ProductListVO one: list) {
  		i++;
   %>
    		<div class="row data">
                    <div class="subdiv">
                        <div class="pname">
                            <div align="center"><%=one.getProduct_title()%></div>
                        </div>
                    </div>
                    <div class="subdiv">
                        	<div class="basketprice" align="center"><%=one.getProduct_idx()%></div>
                    	<div></div>
                    	<div></div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd" align="center"><%=one.getProduct_price()%></div> 
                    </div>
                     <div class="split"></div>
                </div>
   
   <%
   } 
   %>
   
    		<!-- <div class="right-align basketrowcmd">
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
            </div> -->

   
   <%}else { %>
   	<span>0개의 물건이 장바구니에 들어 있습니다.</span>
   <%} %>
	</div>
	
</div>
</body>
</html>