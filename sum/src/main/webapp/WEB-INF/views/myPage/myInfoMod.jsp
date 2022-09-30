<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/myPage/myInfoMod.css?var=1">

    <div class="section">
        <h2>마이페이지</h2>
        <p>홍길동님, 오늘도 영화처럼 멋진 하루 되세요!</p>

        <hr class="hr1">

        <div class="nav"> 
            <ul class="nav_ul">
                <li><a href="#">예매확인/취소</a></li>
                <li><a href="#">나의 포인트</a></li>
                <li><a href="#">나의 문의내역</a></li>
                <li><a href="#">나의 한줄평</a></li>
                <li><a href="#">나의 무비로드</a></li>
                <li><a href="#">개인정보수정</a></li>
            </ul>
            <hr>
        </div>

        <div class="content">
            <div class="div1"><img src="${ path }/resources/image/4sum1.png" height="90" alt="SUM 로고"></div>
            <div class="div2"><p>비밀번호를 입력해주세요.</p></div>
            <div class="div3"><input class="pwd" type="password" placeholder="Password"></div>
            <br>
            <div class="div3"><button class="btn">개인정보수정</button></div>
        </div>


    </div> 

<jsp:include page="/WEB-INF/views/common/footer.jsp" />