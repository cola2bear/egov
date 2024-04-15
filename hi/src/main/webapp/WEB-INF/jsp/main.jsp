<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="webapp/css/main.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script  src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	//로그인
	var result = '${result}'; //쌍따옴표 말고 따옴표가 데이터를 가져온다

	if (result === "loginFalse") {
		alert("로그인실패");
	} else if (result === "updateOK") {
		alert("회원정보 변경");
	} else if (result === "loginOK") {
		alert("로그인 성공");
	} else if (result === "registerOK") {
		alert("회원가입 성공");
	}
</script>
</head>
<body>
	<div></div>

	<br />     
	<h1 class="text-center">Board List</h1>
	    
	<br />
	<c:if test="${member eq null}">
		<form method="post" action="/member/login.do">

			<div>
				<label for="id">아이디</label> <input type="text" id="id" name="id" />
			</div>

			<div>
				<label for="password">비밀번호</label> <input type="password"
					id="password" name="password" />
			</div>

			<div>
				<button type="submit">로그인</button>
			</div>
		</form>
	</c:if>

	<c:if test="${member eq null}">
		<button type="button" onclick="location.href='/member/register.do'">회원가입</button>
	</c:if>

	<c:if test="${member ne null}">
		<div>
			<button type="button" onclick="location.href='/member/logout.do'">로그아웃</button>
			<button type="button" onclick="location.href='/member/modify.do'">회원정보
				수정</button>
			<button type="button" onclick="location.href='/member/remove.do'">회원탈퇴</button>
		</div>
	</c:if>

	<c:if test="${member ne null }">
		<div>${member.id}님 환영합니다.</div>
	</c:if>
	    
	<br />     
	<div class="container">
		<table  class="table table-hover table-striped text-center"
			 style="border: 1px solid;">
			<colgroup>
				<col  width="10%"  />
				<col  width="20%"  />
				<col  width="30%"  />
				<col  width="15%"  />
				<col  width="15%"  />
				<col  width="10%"  />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>                     
					<th>제목</th>
					<th>내용</th>                     
					<th>작성자</th>
					<th>작성자 아이디</th>                     
					<th>등록일자</th>                 
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="result">
					<tr class="rowClick">
						<td>${result.srSeq}</td>
						<td><a href="testDetail.do?srSeq=${result.srSeq}">${result.titl}</a></td>
						<td>${result.cntn}</td>
						<td>${result.writNm}</td>
						<td>${result.writId}</td>
						<td>${result.regDttm}</td>
					</tr>
            	</c:forEach>
			</tbody>
		</table>
	</div>
	        
	<button type="button" class="btn btn-sm btn-primary" id="btnWrite">글쓰기</button>
	</div>
	<br>
	<!-- pagination{s} -->

	<div id="paginationBox" class="pagination1">
		<ul class="pagination">

			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.searchType}', '${search.keyword}')">이전</a></li>
			</c:if>

			<c:forEach begin="${pagination.startPage}"
				end="${pagination.endPage}" var="srSeq">

				<li
					class="page-item <c:out value="${pagination.page == srSeq ? 'active' : ''}"/> "><a
					class="page-link" href="#"
					onClick="fn_pagination('${srSeq}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					 ,'${search.searchType}', '${search.keyword}')">
						${srSeq} </a></li>
			</c:forEach>

			<c:if test="${pagination.next}">

				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.searchType}', '${search.keyword}')">다음</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination{e} -->



	<!-- search{s} -->

	<div class="form-group row justify-content-center">

		<div class="w100" style="padding-right: 10px">
			<select class="form-control form-control-sm" name="searchType"
				id="searchType">
				<option value="titl">제목</option>
				<option value="cntn">본문</option>
				<option value="writNm">작성자</option>
			</select>
		</div>

		<div class="w300" style="padding-right: 10px">
			<input type="text"
				<%-- value="${pagination.keyword}" --%> class="form-control form-control-sm"
				name="keyword" id="keyword">
		</div>

		<div>
			<button class="btn btn-sm btn-primary" name="btnSearch"
				id="btnSearch">검색</button>
		</div>

	</div>

	<!-- search{e} -->


	<!-- 페이지 목록 갯수   -->
	<div class="form-group row justify-content-center">
		<p>게시판 목록 갯수</p>
		<div class="w100" style="padding-right: 10px">
			<select class="form-control form-control-sm" name="searchType"
				id="listSize" onchange="page(1)">
				<option value="10"
					<c:if test="${pagination.getListSize() == 10 }">selected="selected"</c:if>>10개</option>
				<option value="15"
					<c:if test="${pagination.getListSize() == 15 }">selected="selected"</c:if>>15개</option>
				<option value="20"
					<c:if test="${pagination.getListSize() == 20 }">selected="selected"</c:if>>20개</option>
			</select>
		</div>

	</div>
	    

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
	<c:set var="cpath" value="${pageContext.request.contextPath}" />
	<script type="text/javascript">
		//글 작성 버튼 클릭 시 testRegister로 이동
		$(document).on('click', '#btnWrite', function() {
			location.href = "${cpath}/testRegister.do";
		});

		//이전 버튼 이벤트
		//5개의 인자값을 가지고 이동 testList.do
		//무조건 이전페이지 범위의 가장 앞 페이지로 이동
		function fn_prev(page, range, rangeSize, listSize, searchType, keyword) {

			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;

			var url = "/testList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
			location.href = url;
		}

		//페이지 번호 클릭

		function fn_pagination(page, range, rangeSize, listSize, searchType,
				keyword) {

			var url = "/testList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;

			location.href = url;
		}

		//다음 버튼 이벤트
		//다음 페이지 범위의 가장 앞 페이지로 이동
		function fn_next(page, range, rangeSize, listSize, searchType, keyword) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "/testList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
			location.href = url;
		}

		/* $는 jQuery를 시작하는 명령어로
		$(DOM요소) 와 같은 명령어로 각 요소에 접근 할 수 있다.
		e.preventDefault(); 는 버튼 고유의 기능을 막는 명령어 */

		// 검색
		$(document).on('click', '#btnSearch', function(e) {
			e.preventDefault();
			var url = "${selectMain}";
			url = url + "?searchType=" + $('#searchType').val();
			url = url + "&keyword=" + $('#keyword').val();
			url = url + "&listSize=" + $('#listSize').val();
			location.href = url;
			console.log(url);

		});

		/*한페이지당 게시물 */
		function page(srSeq) {
			var startPage = srSeq;
			var listSize = $("#listSize option:selected").val();

			if (listSize == 10) {
				var url = "/testList.do?startPage=" + startPage + "&listSize="
						+ listSize
			} else if (listSize == 15) {
				var url = "/testList.do?startPage=" + startPage + "&listSize="
						+ listSize
			} else if (listSize == 20) {
				var url = "/testList.do?startPage=" + startPage + "&listSize="
						+ listSize

			}
			location.href = url;
		}
	</script>
</body>
</html>