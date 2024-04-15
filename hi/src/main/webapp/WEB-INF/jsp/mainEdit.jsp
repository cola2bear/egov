<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainDetail</title>


<body>
	<h1  class="text-center">Board Detail</h1>

	<div  class="container">
		        
		<form  action="updateTest.do"  id="viewForm"  method="post"
			            encType="multipart/form-data">
		<input type="hidden" value="${vo.srSeq}" name="srSeq">
			<table  class="table table-bordered">
				                
				<tbody>
					<tr>
						<th>제목</th>
						<td><input name="titl" type="text" value="${vo.titl}"
							class="form-control"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input name="writNm" type="text" value="${vo.writNm}"
							class="form-control" readonly /></td>
					</tr>
					<tr>
						<th>작성자 아이디</th>
						<td><input name="writId" type="text" value="${vo.writId}"
							class="form-control" readonly /></td>
					</tr>
					                    
					<tr>
						                        
						<th>내용</th>                         
						<td><textarea  name="cntn"  class="form-control"
								                                style="height:  200px;">${vo.cntn}</textarea></td>
					</tr>
					<tr>
						<th>작성일자</th>
						<td><input name="regDttm" type="text" value="${vo.regDttm}"
							class="form-control" readonly /></td>
					</tr>
					<tr>
						<c:if test="${vo.fileName ne null}">
							<tr>
								<td>다운로드</td>

								<td><a href="fileDownload.do?fileName=${vo.fileName}">
										<input type="text" id="asd" value="${vo.fileName}"
										name="fileName" class="form-control" readonly />
								</a>
									<button id="asdasd" type="button" class="btn_previous">파일지우기</button>
							</tr>
						</c:if>
					</tr>
					<tr>
						<th>첨부파일:</th>
						<td><input type="file" name="uploadFile"></td>
					</tr>
					<tr>
						<td  colspan="2"  style="text-align:  right;">

							<button>
								<a href="testList.do" class="btn btn-info btn-sm"> <span
									class="glyphicon glyphicon-list" aria-hidden="true"></span>
									목록으로
								</a>
							</button>
							<button type="submit" class="btn btn-sm btn-primary" formaction="update.do">
								<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
								수정
							</button>

							<button type="submit" formaction="deleteTest.do"
								class="btn btn-sm btn-danger">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								삭제
							</button>
						</td>                     
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		// 목록 링크 클릭
		$('.btn-info').click(function() {
			if (!confirm('목록으로 돌아가시겠습니까?')) {
				return false; // 목록으로의 이동을 취소함
			}
		});

		// 저장 버튼 클릭
		$('button.btn-primary').click(function() {
			if (!confirm('저장하시겠습니까?')) {
				return false; // 저장을 취소함
			}
		});

		// 삭제 버튼 클릭
		$('button.btn-danger').click(function() {
			if (!confirm('정말로 삭제하시겠습니까?')) {
				return false; // 삭제를 취소함
			}
		});
	</script>


</body>

</html>