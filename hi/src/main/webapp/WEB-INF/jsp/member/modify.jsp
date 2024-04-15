<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post">

		<div>
			<label for="id">아이디</label> <input type="text" id="id" name="id"
				value="${member.id}" readonly />
		</div>
		<div>
			<label for="password">새 비밀번호</label> <input type="password"
				id="password" name="password" />
		</div>
		<div>
			<label for="nickname">닉네임</label> <input type="text"
				id="nickname" name="nickname" />
		</div>
		<div>
			<label for="email">이메일</label> <input type="text"
				id="email" name="email" />
		</div>
		<div>
			<button type="submit">회원정보 수정</button>
		</div>
	</form>
	<div>
		<button onclick="location.href='/testList.do'">목록</button>
	</div>
</body>
</html>