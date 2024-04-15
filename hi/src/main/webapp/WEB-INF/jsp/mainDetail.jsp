<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainDetail</title>
<!-- Latest compiled and minified CSS -->
<link  rel="stylesheet"
	    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	    crossorigin="anonymous">
<!-- Optional theme -->
<link  rel="stylesheet"
	    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	    integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	    crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	    crossorigin="anonymous"></script>

<script
	 src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<h1  class="text-center">Board Detail</h1>

	<div  class="container">
		        
		<form  action="updateTest.do"  id="viewForm"  method="post"
			            encType="multiplart/form-data">
			            
			<table  class="table table-bordered">
				                
				<tbody>
					<tr>
						<th>글번호</th>
						<td>${vo.srSeq}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${vo.titl}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${vo.writNm}</td>
					</tr>
					<tr>
						<th>작성자 아이디</th>
						<td>${vo.writId}</td>
					</tr>
					                    
					<tr>
						                        
						<th>내용</th>                         
						<td>${vo.cntn}</td>
					</tr>
					<tr>
						<th>작성일자</th>
						<td>${vo.regDttm}</td>
					</tr>
					<tr>
						<th>다운로드</th>
						<td><c:if test="${not empty fileList}">
								<div class="form-group" style="border: 1px solid #dbdbdb;">
									<c:forEach var="file" items="${fileList}">
										<a href="${cpath}/fileDownload.do?fileName=${file.FILE_NO}"
											target="_blank">${file.ORG_FILE_NAME}</a> (${file.FILE_SIZE}kb)<br>
									</c:forEach>
								</div>
							</c:if></td>
					</tr>
					<tr>
						<td  colspan="2"  style="text-align:  right;">
							<button type="button" class="btn btn-sm btn-primary"
								id="btnUpdate">수정</button>
							<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
						</td>                     
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<c:set var="cpath" value="${pageContext.request.contextPath}" />
	<script type="text/javascript">
		//목록
		$(document).on('click', '#btnList', function() {
			location.href = "${cpath}/testList.do";
		});
		//수정버튼
		$(document).on('click', '#btnUpdate', function() {
			var url = "${cpath}/testEdit.do";
			url = url + "?srSeq=" + $
			{vo.srSeq};
			location.href = url;
		});
		function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#FILE_NO").attr("value", fileNo);
			formObj.attr("action", "/board/fileDown");
			formObj.submit();
		}
	</script>
</body>

</html>