<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
</script>

<title>회원가입</title>
</head>
<body>
	<section id="container">
		<form id="register_form" method="post">
			<div class="form-group has-feedback">
				<label class="control-label" for="id">아이디</label> <input
					class="form-control" type="text" id="id" name="id" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="password">패스워드</label> <input
					class="form-control" type="password" id="password" name="password" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="name">성명</label> <input
					class="form-control" type="text" id="name" name="name" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="nickname">닉네임</label> <input
					class="form-control" type="text" id="nickname" name="nickname" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="email">이메일</label> <input
					class="form-control" type="text" id="email" name="email" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="phone_number">휴대폰번호</label> 
				<input class="form-control" type="text" id="phone_number" name="phoneNumber" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-primary" type="submit">회원가입</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
	
	
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {
			location.href = "/login";
		})
		$("#submit").on("click", function() {
			if ($("#id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			}
			if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
			if ($("#name").val() == "") {
				alert("성명을 입력해주세요.");
				$("#name").focus();
				return false;
			}
			
			// 휴대폰 번호 유효성 검사
			$("#phone_number").on("blur", function() {
			    var phoneNumber = $(this).val();
			    var phoneNumberRegex = /^\d{3}-\d{3,4}-\d{4}$/; // 예시: 010-1234-5678 형식
			    
			    if (!phoneNumberRegex.test(phoneNumber)) {
			        alert("유효한 휴대폰 번호 형식이 아닙니다. 다시 입력해주세요.");
			        $(this).val(""); // 입력한 내용 지우기
			        $(this).focus(); // 다시 포커스
			    }
		});
		})
	</script>
</body>

</html>