<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${ path }/resources/css/qna/qna.css">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section class="title">
<div><h2>사용문의나 불편하신 부분, 궁금한 사항을 남겨주세요</h2></div>
<div><p>문의주신 내용은 <strong>마이페이지 '나의 문의내역'</strong>에서 확인 가능합니다.</p></div>
<div><img src="${ path }/resources/image/qna/email_ico.png" class="ico"> <span>admin@sum4.com &nbsp</span>
<img src="${ path }/resources/image/qna/phone_ico.png" class="ico"> <span> 010-1234-5678</span></div>
</section>

<section class="content">
<div>
<input type="text" name="qnaTitle" class="qnaTitle" placeholder=" 제목">
<input type="text" name="userId" class="userId" placeholder=" 손님 (guest)">
<div>
<input type="text" name="qnaContent" class="qnaContent" placeholder=" 문의내용">
</div>
</div>

<div>
<button type="submit">문의하기</button>
</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />