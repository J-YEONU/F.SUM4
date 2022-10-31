<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${ path }/resources/css/member/login.css">
<meta charset="UTF-8">
<title>SUM 로그인</title>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="ci">
		<img width="85px"
			src="${ path }/resources/image/member/the-sum-of11.png">
	</div>

	<div>
		<h2>당신의 영화를 기억해 드립니다.</h2>
		<br>

		<form action="${ path }/login" method="POST">
			<input type="text" id="userId" name="id" placeholder="아이디" required
				style="width: 200px; height: 25px;"><br>
			<br> <input type="password" id="userPwd" name="password"
				placeholder="비밀번호" required style="width: 200px; height: 25px"><br>
			<br> <input type="submit" value="로그인"
				style="width: 116px; height: 36px;"><br>
			<br> <a href="${path}/member/findIdPage" style="font-size: 15px;">아이디 찾기</a> 
				 <a href="${path}/member/findPwdPage" style="font-size: 15px;">비밀번호 초기화</a>
		</form>
	</div>
</body>
</html>