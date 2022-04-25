<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- <body bgcolor="skyblue"> -->
<body>
<h3>회원상세정보입니다</h3>
<table border=2>
   <tr>
      <td>아이디</td>
      <td>${one.user_id}</td> <!-- one.getId -->
   </tr>
   <tr>
      <td>이름</td>
      <td>${one.user_name}</td>
   </tr>
   <tr>
      <td>패스워드</td>
      <td>${one.user_pw}</td>
   </tr>
   <tr>
      <td>전화번호</td>
      <td>${one.user_tel}</td>
   </tr>
   <tr>
      <td>나이</td>
      <td>${one.user_age}</td>
   </tr>
   <tr>
      <td>주소</td>
      <td>${one.user_addr}</td>
   </tr>
   <tr>
      <td>레벨</td>
      <td>${one.level}</td>
   </tr>
</table>

<h3>회원삭제</h3>
<form action="memberAdDelete">
아이디 : <input type="text" name="user_id" value="${one.user_id}" readonly="readonly"><br>
<button>회원삭제</button>
</form>
<h3>회원 수정</h3>
<form action="memberAdUpdate">
		<table>
			<tr>
				<td class="left">아이디</td>
				<td class="right"><input class="form-control input-lg"
					type="text" name="user_id" id="id" value="${one.user_id}">
				</td>
			</tr>
			<tr>
				<td class="left">이름</td>
				<td class="right"><input class="form-control input-lg"
					type="text" name="user_name" id="name" value="${one.user_name}">
				</td>
			</tr>
			<tr>
				<td class="left">패스워드</td>
				<td class="right"><input class="form-control input-lg"
					type="text" name="user_pw" id="pw" value="${one.user_pw}">
				</td>
			</tr>
		</table>
<button type="submit">회원수정</button>
</form>
</body>
</html> 