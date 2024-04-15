<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
 <title>게시판</title> 
 
 <script>
 	var result = '${result}';
 	
 	if(result === "removeFalse") {
 		alert("비밀번호를 다시 입력해주세요.");
 	}
 </script>
</head>
<body>

<form method="post">
 	<div>
 		<label for="id">아이디</label>
 		<input type="text" id="id" name="id" value="${member.id}" readonly/>
 	</div>
 	<div>
 		<label for="password">비밀번호</label>
 		<input type="password" id="password" name="password" />
 	</div>
 	<div>
 		<button type="submit">회원탈퇴</button>
 	</div>
 	
</form>

	<div>
		<button onclick ="location.href='/testList.do'">처음</button>
	</div>
</body>
</html>