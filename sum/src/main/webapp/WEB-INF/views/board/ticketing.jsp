<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${ path }/resources/css/ticketing.css">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section id="tSection">
	<div id="title">영화예매</div><br>
        <span id="infospan">영화 예매를 순서대로 진행해주세요.</span>
            <div id="info"><img src="${ path }/resources/image/tagbox.png" id="tagbox">
                <span id="step"> 영화 &gt; 좌석 &gt; 결제 3단계로 이루어져 있습니다.</span>
            </div>
            <hr id="hr">
                <div id="tagtitle"><img src="${ path }/resources/image/tag.png" id="tag"> 영화예매</div>
                    <div id="bottom">
                        <div id="tagdiv1"></div>
                        <div id="tagdiv2"></div>
                        <div id="tagdiv3"></div>
                    </div>
            
	<div id="subtitle"><img src="${ path }/resources/image/tag.png" id="tag"> 영화선택</div>
		<div class="movie_chart">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="poster">
							<img src="${ path }/resources/post/9_10/Collaboration 2_ International.jpg" alt="공조 2 : 인터내셔날">
						</div>
							<div class="infor">
								<h3>공조2 : 인터내셔날</h3>
							</div>
					</div>
					<div class="swiper-slide">
					    <div class="poster">
				            <img src="${ path }/resources/post/9_10/Honest Candidate 2.jpg" alt="정직한 후보 2">
					    </div>
							<div class="infor">
							    <h3>정직한 후보2</h3>
							</div>
					</div>
					<div class="swiper-slide">
						<div class="poster">
					        <img src="${ path }/resources/post/9_10/bullet train.jpg" alt="불릿 트레인">
						</div>
							<div class="infor">
							    <h3>불릿 트레인</h3>
							</div>
					</div>
					<div class="swiper-slide">
						<div class="poster">
							<img src="${ path }/resources/post/9_10/645.jpg" alt="육사오">
						</div>
							<div class="infor">
					   			 <h3>육사오</h3>
							</div>
					</div>
    			 </div>
    		</div>
		</div>
            
	<div id="choice"><p>선택하신 영화 : </p></div>
            
<!-- cinema choice -->
	<div id="subtitle"><img src="${ path }/resources/image/tag.png" id="tag"> 영화관 선택</div>
	<br>
	<span id="infospan"><img src="${ path }/resources/image/mark.png" id="mark"> 선택하신 영화가 상영되는 영화관만 표시됩니다.</span>
	<br><br>
    
    <nav>
		<ul id="navi">
			<li><a href="#" id="li">서울</a>
			    <ul>
			        <li><a href="#">&gt; 강남</a></li>
			        <li><a href="#">&gt; 코엑스</a></li>
			    </ul>
			</li>
			<li><a href="#" >경기</a>
			    <ul>
			        <li><a href="#">&gt; 분당</a></li>
			        <li><a href="#">&gt; 일산</a></li>
			    </ul>
			</li>
			<li><a href="#">인천</a>
			    <ul>
			        <li><a href="#">&gt; 인천아시아드</a></li>
			        <li><a href="#">&gt; 인천터미널</a></li>
			    </ul>
			</li>
			<li>
			    <a href="#">강원</a>
			    <ul>
			        <li><a href="#">&gt; 춘천</a></li>
			        <li><a href="#">&gt; 원주</a></li>
			    </ul>
			</li>
			<li><a href="#">대전/충청</a>
			    <ul>
			        <li><a href="#">&gt; 대전</a></li>
			        <li><a href="#">&gt; 대전중앙로</a></li>
			    </ul>
			</li>
		</ul>
	</nav>
            
	<div id="subtitle"><img src="${ path }/resources/image/tag.png" id="tag"> 상영날짜</div><br>
		<span id="infospan"><img src="${ path }/resources/image/mark.png" id="mark"> 영화는 일주일 간격으로 예매가 가능합니다.</span>
			<div id="date"><img src="${ path }/resources/image/calendar_icon.png" id="calendar"> DATE
				<form style="display: inline-block;">
					<input type='date' id='currentDate'/>
				</form>
			</div>
	
	<div id="subtitle"><img src="${ path }/resources/image/tag.png" id="tag"> 시간 선택</div><br>
		<span id="infospan"><img src="${ path }/resources/image/mark.png" id="mark"> 시간이 안 나올시 상영날짜를 다시 한번 설정하세요.</span>
	<br><br><br>
    
<!-- <div id="choicetz">
    <span>영화관명</span>
</div> -->
            
	<div id="choice"><p>선택하신 시간 : </p></div>
		<button type="submit" id="btn" onclick="location.href='${ path }/board/seat'">
			<p id="p1">NEXT STEP</p>
			<p id="p2">-------------------------------<span id="p3">> </span></p>
			<em id="p4">chosee a seat</em>
		</button>
</section>

	<!-- 달력에 현재 일자 스크립트 -->
	<script>
		document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
	</script>

    <script>
    //영화차트 이미지 슬라이드 스크립트
    
    </script>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" />