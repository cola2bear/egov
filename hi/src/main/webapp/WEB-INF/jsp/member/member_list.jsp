<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
<%@ include file="../include/member_header.jsp" %>
</head>
<body>
<%@ include file="../include/member_menu.jsp" %>
    <h2>회원 목록</h2>
    <table border="1" width="700px">
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>이메일</th>
            <th>전화번호</th>
            <th>회원가입일자</th>
        </tr>
        <c:forEach var="row" items="${list}">
        <tr>
            <td>${row.id}</td>
            <td>${row.name}</td>
            <td>${row.email}</td>
            <td>${row.phoneNumber}</td>
            <td>${row.createDate}</td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>
