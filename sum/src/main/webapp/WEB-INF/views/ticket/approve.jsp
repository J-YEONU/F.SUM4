<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${ path }/resources/css/ticketing/approve.css">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section id="tSection">
	<div id="title">영화 예매완료</div>
        <span id="infospan">영화 예매를 해주셔서 감사합니다.</span>
            <div id="info"><img src="${ path }/resources/image/ticketing/tagbox.png" id="tagbox">
                <span id="step"> 마이페이지에서 취소 가능합니다.</span>
            </div>
            <hr id="hr">
        <div>
			<div class="t_img1"><img src="${ path }/resources/image/ticketing/ticket_img1.png"></div>
			<div class="t_div t_img2">
				<div class="area1">
					<div name="tk_no">예매번호 :<span id="no"> test</span></div>	
					<div name="tk_show">상영일 : <span>2022-10-20</span></div>	
					<div name="tkt_time">상영시간 : <span>20:00</span></div>	
					<div name="tk_cinema">상영관 : <span> 강남</span></div>	
					<div name="tk_price">가격 : &#8361;<span> 10,000</span></div>	
					<div name="tk_pay">결제수단 : 	<span>카카오</span></div>
					<div name="tk_date">결제일 : <span>날짜</span></div>
				</div>
				<div class="area2">
					<div name="tk_title" id="tk_title">영화명 : <span id="title"></span></div>
					<div class="blank">hidden</div>
					<div class="blank">hidden</div>
					<div name="tk_seat" id="tk_seat">좌석 : <span id="seat"></span></div>
					<div class="blank">hidden</div>
					<div class="blank">hidden</div>
					<div class="blank">hidden</div>
				</div>
				
				
				
				
			</div>
		</div>
	<div id="btn">
		<button type="submit" class="btn1" onclick="location.href='${ path }/myPage/myBooking'">마이페이지</button>
		<button type="submit" class="btn2" onclick="location.href='${ path }/'">메인</button>
	</div>

            
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />