<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>publicData</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript" src="resources/js/basket.js"></script>
	
	<link rel = "stylesheet" type = "text/css" href = "resources/css/project.css">

    <!-- Additional CSS Files -->
</head>
<script type="text/javascript">
$(function(){
	
	var ajax_last_num = 0; //초기값
	
	var current_ajax_num = ajax_last_num; 
	//ajax 중복요청 일 시 ajax success 코드 실행 방지. 
	
    $("#requestBtn").click(function(){
    	
    	
    	
    	
        $.ajax({
        	url:"",//본인의 Request URL을 입력해주세요.
            //data:{keyword:'value값'},
            method:"get",
            beforeSend:function(){
                //URL 전송전에 작업할 내용
                console.log('beforeSend');
                ajax_last_num = ajax_last_num+1; 
                console.log(ajax_last_num);
            },
            dataType:"json",
            success:function(json){
            	if(current_ajax_num == ajax_last_num -1){//ajax_last_num이 1일때만 실행. 
           		console.log(ajax_last_num);
            	
                //성공적으로 URL 전송하고난 내용
                console.log('Success');
                console.log(json);
                
                
                 
                 
                $.each(json.data, function(index, item){
                	 $('#table').append(
                             "<tr><td>"+item.성별+"</td>"+
                             	 "<td>"+item.연령대+"</td>"+
                            	 "<td>"+item.거주지+"</td>"+
                                 "<td>"+item['귀하의 취미는 무엇입니까_']+"</td>"+ //.으로 출력이 안되서 []이용. 
                                 "<td>"+item['어떤 종류위 여행을 좋아하십니까_']+"</td>"+
                                 "<td>"+item['국내여행 희망시 어떤 형태를 선호하십니까_']+"</td>"+
                                 "<td>"+item['선호하는 여행방식은 어떤 것입니까_']+"</td>"+
                                 "<td>"+item['선호하는 상품 및 서비스 항목은 무엇입니까_']+"</td>"+
                                 "<td>"+item['온라인 쇼핑을 통해 자주 구매하는 상품 및 서비스는 무엇입니까_']+"</td>"+
                                 "<td>"+item['가장관심있는 온라인 상품 카테고리는 무엇입니까_']+"</td>"+
                                 "<td>"+item['온라인 쇼핑몰에서 진행했으면하는 이벤트가 무엇입니까_']+"</td></tr>"
                                 
                     );
             
                });  
            }
            },
            error:function(){
                //오류 났을때 사용하는 내용
                console.log('Error');
            },
            complete:function(){
                //모든 것이 끝나고 마지막으로 정리하는 내용
                console.log('Complete');
            }
        });
    });
    

    
    
    
});

</script>
<body>
<div id = "top">
	   <jsp:include page="../../top.jsp"></jsp:include>
	   <!-- <button type="button" class="btn btn-light"><a href="productList.jsp">리스트 목록으로 </a></button> -->
</div> 
  <button id="requestBtn" class="btn btn-light">설문조사 내용 가져오기</button>
 <table id = "table">
 	 <tr>
            <td>성별</td>
            <td>연령대</td>
            <td>거주지</td>
            <td>취미</td>
            <td>선호하는 여행</td>
            <td>국내여행 희망 시 선호하는 형태</td>
            <td>선호하는 여행방식</td>
            <td>선호하는 상품 및 서비스 항목</td>
            <td>온라인 쇼핑을 통해 자주 구매하는 상품 및 서비스</td>
            <td>관심있는 온라인 상품 카테고리</td>
            <td>진행하기를 원하는 이벤트</td>
        </tr>
 </table>


</body>
</html>