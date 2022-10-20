<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${ path }/resources/css/ticketing/ticketing.css">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section id="tSection">
	<div id="title">영화예매</div>
        <span id="infospan">영화 예매를 순서대로 진행해주세요.</span>
            <div id="info"><img src="${ path }/resources/image/ticketing/tagbox.png" id="tagbox">
                <span id="step"> 영화 &gt; 좌석 &gt; 결제 3단계로 이루어져 있습니다.</span>
            </div>
            <hr id="hr">
                <div id="tagtitle"><img src="${ path }/resources/image/ticketing/tag.png" id="tag"> 영화예매</div>
                    <div id="bottom">
                        <div id="tagdiv1"></div>
                        <div id="tagdiv2"></div>
                        <div id="tagdiv3"></div>
                    </div>
            
	<div id="subtitle"><img src="${ path }/resources/image/ticketing/tag.png" id="tag"> 영화선택</div>
	
	<!-- 영화 목록 css 수정 예정 -->
	<div class="movie">
		<c:forEach var="movieList" items="${ list }">
	      <div class="movieInfo">
	         <span><img src="${ movieList.moviePoster }" name="mChoice"></span>   
	         <strong class="mInfo">${ movieList.movieTitle }</strong>
	      </div>
		</c:forEach>
	      
	</div>
            
	<div id="choice"><p>선택하신 영화 : </p></div>
            
<!-- cinema choice -->
	<div id="subtitle"><img src="${ path }/resources/image/ticketing/tag.png" id="tag"> 영화관 선택</div>
	<div id="infospan"><span><img src="${ path }/resources/image/ticketing/mark.png" id="mark"> 선택하신 영화가 상영되는 영화관만 표시됩니다.</span></div>
    
    <nav>
		<ul id="navi">
			<li><a href="#">서울</a>
			    <ul>
			        <li><a href="#">&gt; 강남</a></li>
			        <li><a href="#">&gt; 장안</a></li>
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
			        <li><a href="#">&gt; 부평</a></li>
			        <li><a href="#">&gt; 주안</a></li>
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
			        <li><a href="#">&gt; 청주</a></li>
			    </ul>
			</li>
		</ul>
	</nav>
            
	<div id="subtitle"><img src="${ path }/resources/image/ticketing/tag.png" id="tag"> 상영날짜</div>
		<span id="infospan"><img src="${ path }/resources/image/ticketing/mark.png" id="mark"> 영화는 일주일 간격으로 예매가 가능합니다.</span>
			<div id="date"><img src="${ path }/resources/image/ticketing/calendar_icon.png" id="calendar"> DATE
				<form style="display: inline-block;">
					<input type='date' id='currentDate'/>
				</form>
			</div>
	
	<div id="subtitle"><img src="${ path }/resources/image/ticketing/tag.png" id="tag"> 시간 선택</div>
		<div id="infospan"><span><img src="${ path }/resources/image/ticketing/mark.png" id="mark"> 시간이 안 나올시 상영날짜를 다시 한번 설정하세요.</span></div>
	
    
            
	<div id="choice"><p>선택하신 시간 : </p> <div id="result"> </div></div>
		<div id="btn">
			<button type="submit" class="btn" onclick="location.href='${ path }/ticket/seat'">
				<p id="p1">NEXT STEP</p>
				<p id="p2">-------------------------------<span id="p3">> </span></p>
				<em id="p2">chosee a seat</em>
			</button>
		</div>
</section>

	<!-- 달력에 현재 일자 스크립트 -->
	<script>
		document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
	</script>

	<!-- 영화 선택 시, 선택된 값 출력 스크립트 내용 수정할것. 미구현. -->
	<script>
	function getMovieChoiceValue()  {
		  // 선택된 목록 가져오기
		  const query = 'img[name="mChoice"]:select';
		  const selectedEls = 
		      document.querySelectorAll(query);
		  
		  // 선택된 목록에서 value 찾기
		  let result = '';
		  selectedEls.forEach((el) => {
		    result += el.value + ' ';
		  });
		  
		  // 출력
		  document.getElementById('result').innerText
		    = result;
		}
	</script>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" />