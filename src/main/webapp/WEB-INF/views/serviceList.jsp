<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
table {
	width: 100%;
	border-collapse: collapse;
	border-top: 3px solid #ff75b3;
}

#one {
	color: #ffffff;
	background: linear-gradient(-145deg, rgba(219, 138, 222, 1) 0%,
		rgba(246, 191, 159, 1) 100%) !important;
}

th, td {
	padding: 10px;
	border-bottom: 2px solid #ff75b3;
	padding: 10px;
}

th:first-child, td:first-child {
	border-left: 0;
}

th:last-child, td:last-child {
	border-right: 0;
}

.right>a:link {
	color: pink;
	text-decoration: none;
}

.right>a:visited {
	color: gray;
	text-decoration: none;
}

.right>a:hover {
	color: red;
	text-decoration: underline;
}

.right>a:active {
	color: green;
	text-decoration: none;
}
.rounded {
  background: #ff3d84;
  height: 25px; width: 60px;
  border-radius: 40%;
}

p{text-align:center;color:white;}
</style>

<table>

	<tr id="one">
		<td class="left">index</td>
		<td class="left">title</td>
		<td class="left">writer</td>
	</tr>
	<c:forEach items="${list}" var="one">
		<tr>
			<td class="right">${one.service_idx}
			<td class="right"><div class='rounded' style="float:left; margin:10px">
				<p>${one.service_cate}</p><!-- ML -->
			</div><a
				href="serviceOne?service_idx=${one.service_idx}">${one.service_title}</a></td>
			<td class="right">
				<%
					if (session.getAttribute("user_id") != null) {
				%> <%
 	if ((int) (session.getAttribute("user_level")) == 2) {
 %> <a href="memberOne?user_id=${one.user_id}"> <%
 	}
 %> <%
 	}
 %> ${one.user_id} 
			</td>
	</c:forEach>
</table>
<ul class="btn-group pagination">
	<c:if test="${pageMaker.prev}">
		<li><a
			href='<c:url value="serviceList?page=${pageMaker.startPage-1}"/>'
			style="color: #ff75b3;"> <i class="fa fa-chevron-left"></i>
		</a></li>
	</c:if>
	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
		var="pageNum">
		<li><a href='<c:url value="serviceList?page=${pageNum}"/>'
			style="color: #ff75b3;"><i class="fa">${pageNum}</i></a></li>
	</c:forEach>
	<c:if test="${pageMaker.next && pageMaker.endPage>0}">
		<li><a
			href='<c:url value="serviceList?page=${pageMaker.endPage+1}"/>'
			style="color: #ff75b3;"><i class="fa fa-chevron-right"></i></a></li>
	</c:if>
</ul>


