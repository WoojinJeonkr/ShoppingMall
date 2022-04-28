<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<script type="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="resources/assets/css/fontawesome.css">
<link rel="stylesheet"
	href="resources/assets/css/templatemo-eduwell-style.css">
<link rel="stylesheet" href="resources/assets/css/owl.css">
<link rel="stylesheet" href="resources/assets/css/lightbox.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- member.css파일 -->
<link rel="stylesheet" type="text/css" href="resources/css/member.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	//빈 값이 있거나 조건에 맞지 않으면 회원가입이 안되도록 구현.
	$(document).ready(function() {
		$('#addMember').click(function() {
			console.log('id="addMember"인 회원가입버튼 click!');
			//아이디 중복 체크구현. 
			//id가 #addMember인 회원가입 버튼을 눌렀을 때, ajax를 실행시켜 아이디 중복 체크를 하게 구현함.
			$.ajax({
				url : "memberIdCheck",
				data : {
					"user_id" : $('#id').val()
				},
				//$('#id').val()는 input에 있는 id="id"와 이름이 같아야한다.
				//"user_id"는 컨트롤러의 idcheck멥핑에 값이 들어가기때문에 idcheck부분이랑 이름 맞춰주어야한다.
				success : function(data) { //views아래에 있는 memberIdCheck.jsp의 실행결과가 data에 담김.
					if (data == 1) {
						//data=result(컨트롤러의 model의 result를 의미)
						//result==1이면 db에 있는 아이디라는 의미이기 때문에 사용할 수 없는 아이디이다. 
						$('#idc').text('사용할 수 없는 아이디 입니다');
					}
				}//success
			})//ajax
			if ($('#id').val() == '') {//아이디입력안했을 시 text 띄우기				
				$('#idc').text('아이디를  입력해주세요');
				return false;
			} else if (($('#id').val().length) < 4) {//아이디길이 4자 이상				
				$('#idc').text('아이디를 4자 이상으로 입력해주세요');
				return false;
			} else {
				$('#idc').text('사용가능한 아이디 입니다');
			}
			if ($('#pw').val().length < 8) {
				$('#pwc1').text('비밀번호를 8자 이상으로 입력해주세요');
			} else if ($('#pw2').val() == '') {
				$('#pwc2').text('비밀번호 중복확인을 해주세요');
			} else if ($('#pw').val() != $('#pw2').val()) {
				$('#pwc2').text('비밀번호가 일치하지 않습니다.');
				//이름
			} else if ($('#name').val() == '') {
				$('#nac').text('이름을 입력하세요.');
				//핸드폰 번호
			} else if ($('#tel').val().length <= 10) {// 11보다 작으면 번호 다시 입력, 아래 input에 maxlength="11"을 지정해주어 11글자가 최대가 되도록 구현			
				$('#tec').text('번호를  제대로 입력하세요.');
			} else if (isNaN($('#tel').val())) {//핸드폰번호는 숫자만 가능isNaN=not a number		
				$('#tec').text('번호를 다시 입력하세요.');
				//나이 조건 
			} else if (($('#age').val()) > 120) {//120보다 나이가 많으면 가입 불가
				$('#agec').text('나이를 다시 입력하세요.');
			} else if (($('#age').val()) < 5) {//5보다 나이가 적으면 가입 불가
				$('#agec').text('나이를 다시 입력하세요.');
			} else if (isNaN($('#age').val())) {//나이는 숫자만 가능isNaN		
				$('#agec').text('나이를 다시 입력하세요.');
				//주소
			} else if ($('#addr').val() == '') {
				$('#addrc').text('주소를 입력하세요.');
			} else {
				$('#form').submit();
			}

		})//#addMember	

		//다시 한 번 누르면 text 내용을 없애주도록 구현.
		$('#id').click(function() {
			$('#idc').text('')
		})
		$('#pw').click(function() {
			$('#pwc1').text('')
		})
		$('#pw2').click(function() {
			$('#pwc1').text('')
		})
		$('#pw2').click(function() {
			$('#pwc2').text('')
		})
		$('#name').click(function() {
			$('#nac').text('')
		})
		$('#tel').click(function() {
			$('#tec').text('')
		})
		$('#age').click(function() {
			$('#agec').text('')
		})
		$('#addr').click(function() {
			$('#addrc').text('')
		})
		$("#pw").change(function() {
			checkPassword($('#pw').val());
		});
		$("#id").change(function() {
			checkId($('#id').val());
		});
		$("#name").change(function() {
			checkName($('#name').val());
		});
		$("#addr").change(function() {
			checkAddr($('#addr').val());
		});

	});//$(document)

	//비밀번호 유효성 검사
	$("#pw").change(function() {//change=> pw의 값이 변경되었을 때 실행.
		checkPassword($('#pw').val());
	});
	function checkPassword(pw) {

		if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw)) {
			alert('비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.');
			//$('#pwc1').text('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.')
			$('#pw').val('').focus();
			//focus=>#pw가 선택되었을 때 실행되어, pw안에 들어있는 값을 지워준다.=> 유효성 검사를 통과한 pw만 쓰기 위한 과정
			//값을 지워주지 않았을 경우 회원가입하기 버튼을 누르면 회원가입이 완료되기 때문에 지워주어야 한다.
		}//if
	}//function checkPassword(pw)

	//아이디 유효성 검사
	$("#id").change(function() {//change=> id의 값이 변경되었을 때 실행.
		checkId($('#id').val());
	});
	function checkId(id) {

		if (!/^(?=.*[a-z])(?=.*[0-9]).{4,11}$/.test(id)) {
			alert('아이디는 4자~11자 이어야 하며, 숫자/영문소문자 모두 포함해야 합니다.');
			$('#id').val('').focus();
			//focus=>#id가 선택되었을 때 실행되어, pw안에 들어있는 값을 지워준다.=> 유효성 검사를 통과한 id만 쓰기 위한 과정
			//값을 지워주지 않았을 경우 회원가입하기 버튼을 누르면 회원가입이 완료되기 때문에 지워주어야 한다.
		}//if
	}//function checkId(id)

	//이름 유효성 검사
	$("#name").change(function() {//change=> pw의 값이 변경되었을 때 실행.
		checkName($('#name').val());
	});
	function checkName(name) {

		if ((!/^(?=.[가-힣a-zA-Z]).{1,11}$/.test(name))) {
			alert('이름은 숫자/특수문자를 제외하고 10자 이하로 입력해주세요.');
			$('#name').val('').focus();
		}//if
	}//

	//주소 유효성 검사
	//한글+숫자만 가능.
	$("#addr").change(function() {//change=> pw의 값이 변경되었을 때 실행.
		checkAddr($('#addr').val());
	});
	function checkAddr(addr) {

		if ((!/^(?=.*[가-힣])(?=.*[0-9]).{4,30}$/.test(addr))) {
			alert('주소 형식에 맞게 입력해주세요.');
			$('#addr').val('').focus();
			return false;
		}//if
	}//

	//취소버튼 눌렀을 때 productList.jsp호출
	$(document).ready(function() {
		$('#cancel').click(function() {
			alert("회원가입 취소 하시겠습니까?");
			location.href = "productList.jsp";
		})
	});
</script>
</head>
<body>
	<div id="top"><jsp:include page="top.jsp"></jsp:include></div>
	<h3 class="active">회원가입</h3>
	<form action="memberCreate1" id="form">
		<table>
			<tr>
				<td class="left">아이디</td>
				<td class="right"><input class="form-control input-lg"
					type="text" name="user_id" id="id" placeholder="4자이상 입력해주세요">
					<div id="idc"></div></td>
			</tr>
			<tr>
				<td class="left">패스워드</td>
				<td class="right"><input class="form-control input-lg"
					type="password" name="user_pw" id="pw"
					placeholder="숫자+영문자+특수문자합 8글자이상 써주세요" value="wls2gml2!!">
					<div id="pwc1"></div></td>
			</tr>
			<tr>
				<td class="left">패스워드확인</td>
				<td class="right"><input class="form-control input-lg"
					type="password" name="pw2" id="pw2" placeholder="비밀번호를 재입력해주세요"
					value="wls2gml2!!">
					<div id="pwc2"></div></td>
			</tr>
			<tr>
				<td class="left">이름</td>
				<td class="right"><input class="form-control input-lg"
					type="text" name="user_name" id="name" placeholder="성함을 입력해주세요">
					<div id="nac"></div></td>
			</tr>
			<tr>
				<td class="left">전화번호</td>
				<td class="right"><input class="form-control input-lg"
					type="text" name="user_tel" id="tel" maxlength="11"
					value="01012341234" placeholder="하이폰을 제외한 핸드폰번호를 입력해주세요"> <!-- 아래 input에 maxlength="11"을 지정해주어 11글자가 최대가 되도록 구현 -->
					<div id="tec"></div></td>
			</tr>
			<tr>
				<td class="left">나이</td>
				<td class="right"><input class="form-control input-lg"
					type="text" name="user_age" id="age" placeholder="나이를 입력해주세요">
					<div id="agec"></div></td>
			</tr>
			<tr>
				<td class="left">주소</td>
				<td class="right"><input class="form-control input-lg"
					type="text" name="user_addr" id="addr" placeholder="주소를 입력해주세요">
					<div id="addrc"></div></td>
			</tr>
			<tr>
				<td colspan="2">
						<div>
								<button type="button" id="addMember"
									class="btn btn-info"
									style="border-radius: 6px 6px 6px 6px; width: 200px;">회원가입하기</button>
								<button type="button" id="cancel" class="btn btn-info"
									style="border-radius: 6px 6px 6px 6px; width: 200px;">회원가입취소</button>
							
						</div>
					</div>
				</td>


			</tr>
		</table>
	</form>
	<hr>
	<div id="result"></div>
</body>
</html>