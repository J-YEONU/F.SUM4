<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${ path }/resources/css/member/enrollEnd.css">
<meta charset="UTF-8">
<title>SUM 가입을 축하합니다.</title>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="ci">
	<a href="${ path }/">
		<img width="200px" src="${ path }/resources/image/member/the-sum-of11.png">
	</a>
	</div>
    <h1>회원가입완료</h1>
    <h2>SUM에 오신걸 환영합니다.</h2>
    <hr>
    <div class="thanks">
        포인트 1000점이 적립되었습니다.<br><br>
        감사합니다.
    </div>
    <div>
        <button onclick="location.href='${ path }/member/login'">로그인</button> <button onclick="location.href='${ path }/'">홈으로가기</button>
    </div>
</body>
</html>