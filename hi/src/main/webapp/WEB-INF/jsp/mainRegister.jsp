<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script  src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<h1 style="text-align: center">Board Write</h1>
	<form action="insertTest.do" method="post" encType="multipart/form-data">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="titl" value=""
					required="required"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writNm" value=""></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="writId" value=""></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" name="cntn"> </textarea></td>
			</tr>
			<tr>
				<th>첨부파일:</th>
				<td><input type="file" name="File" multiple="multiple"></td>	
			</tr>
			<tr>
				<td>
					<button type="submit" class="btn btn-sm btn-primary">등록</button>
				</td>
			</tr>
		</table>
	</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script
		 src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
		 integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
		 crossorigin="anonymous"></script>
	<script
		 src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
		 integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
		 crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 	<script type="text/javascript">
		//글쓰기

		$(document).on('click', '#btn_register', function(e) {
			$("#form_test").submit();
		});
	</script> -->
</body>
</html>