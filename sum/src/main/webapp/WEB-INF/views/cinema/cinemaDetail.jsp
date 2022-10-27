<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/cinema/cinemaDetail.css">

	    <div class="container">

        <div class="name">
            <h1>홍대점</h1>
            <h2>서울특별시 마포구 양화로 153 (동교동) 4층</h2>
            <hr>
        </div>
        
        <div class="area">
        </div>

        <div class="plot_div">
            <h3><img id="tag" src="${ path }/resources/image/cinema/bus.jpg">교통안내</h3>
            <div>교통편 설명</div>
        </div>
        <hr>
        <div class="plot_div">
            <h3><img id="tag" src="${ path }/resources/image/cinema/car.jpg">주차안내</h3>
            <div>주차 설명</div>
        </div>
        <hr>

        <div class="button_area">
            <button>목록</button>
        </div>
    </div>
    
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />