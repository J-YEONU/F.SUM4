<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SUM</title>
    <link rel="stylesheet" href="${ path }/resources/css/headerFooter.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

	<!-- 파비콘 삽입 -->
	<link rel="shortcut icon" type="image/x-icon" href="${ path }/resources/image/4sum1.png">
</head>
<body>
    <header>
        <div class="header_div">
            <div class="logo_div">
                <a class="logo" href="${ path }/">
                    <img src="${ path }/resources/image/sum_logo.png" height="50px" alt="SUM 로고">
                </a>
            </div>

            <ul class="ul1">
                <li><a href="${ path }/ticket/ticketing">예매</a></li>
                <li><a href="${ path }/movie/movieList">영화</a></li>
                <li><a href="${ path }/cinema/cinema">영화관</a></li>
                <li><a href="#">무비로드</a></li>
                <li><a href="#">이벤트</a></li>
                <li><a href="${ path }/notice/notice">공지사항</a></li>
                <li><a href="${ path }/qna/qna">고객센터</a></li>
            </ul>

			<c:if test="${ loginMember == null}">
	            <ul class="ul2">
	                <li><a href="${ path }/member/login">로그인</a></li>
	                <li><a href="${ path }/member/enroll">회원가입</a></li>
	            </ul>
	        </c:if>
	        <c:if test="${ !empty loginMember }">
	        	<ul class="ul2">
                    <li>${loginMember.name} 님 </li>
	                    <c:if test="${loginMember.role == 'ROLE_USER' }">
							<li><a href="${path }/myPage/myBooking">마이 페이지</a></li>
	                    </c:if>
                    
	                    <c:if test="${loginMember.role == 'ROLE_ADMIN' }">
		                    <li><a href="${path }/myPage/myBooking">마이 페이지</a></li>
		                    <li><a href="${path }/admin/main">관리자 페이지</a></li>
	                    </c:if>
					<li><a href="${ path }/logout">로그아웃</a></li>
				</ul>
			</c:if>
	        
        </div>
    </header>
