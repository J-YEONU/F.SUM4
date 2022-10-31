<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${ path }/resources/css/ticketing/ticketing.css">
<!-- swiper cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>


<jsp:include page="/WEB-INF/views/common/header.jsp" />

<form action="${ path }/ticket/seat" method="post">
<section id="tSection1">
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
</section>

			<!-- 영화 목록 css 수정 예정 -->
		<div class="movieSection ">
		<div class="swiper mySwiper">
			<ul class="swiper-wrapper">
					<c:forEach var="movieList" items="${ mlist }">
				<li class="swiper-slide">
							<div id="wrap" class="movie">
					         		<img src="${ path }/resources/post/9_10/${ movieList.renamedPoster }" alt="${ movieList.movieTitle }">
					        	 	<p>${ movieList.movieTitle }</p>
							</div>
				</li>
					</c:forEach>
			</ul>
      <div class="swiper-button-prev"></div>
      <div class="swiper-button-next"></div>
		</div>
		</div>
		
<section id="tSection2"> 
		<div id="choice"><span id="Cmovie" style="margin-left: 20px;">선택하신 영화 :  </span> </div>
		<input type="hidden" name="movieTitle" value="공조2">
	            
		<!-- cinema choice -->
			<div id="subtitle"><img src="${ path }/resources/image/ticketing/tag.png" id="tag"> 영화관 선택</div>
			<div id="infospan"><span><img src="${ path }/resources/image/ticketing/mark.png" id="mark"> 선택하신 영화가 상영되는 영화관만 표시됩니다.</span></div>
	    
			<div id="cinemaChoice">
				<div class="movie_title">
	                <ul>
	                    <li class="active" id="seoul"><a href="#">서울</a></li>
	                    <li><a href="#">경기</a></li>
	                    <li><a href="#">인천</a></li>
	                    <li><a href="#">강원</a></li>
	                    <li><a href="#">대전/충청</a></li>
	                </ul>
	            </div>
	            <div class="movie-list">
            <div class="chart_cont1">
                <ol class="list" id="movieList">
                	<c:forEach var="cinema" items="${ cinemaS }">
                    <li>
                        <div class="movie-list-info">
                        	 <a href="${path}/cinema/cinemaDetail?no=${ cinema.cinemaNo }" name="no">
                            <img src="${ path }/resources/image/cinema/${ cinema.cinemaImg }" alt="영화관"></a>
                        </div>
                        <div class="infor">
                            <strong>${ cinema.cinemaName }</strong>
                        </div>
                    </li>
                    </c:forEach>
                </ol>
            </div>
            <div class="chart_cont2">
                <ol class="list" id="movieList">
                	<c:forEach var="cinema" items="${ cinemaGG }">
                    <li>
                        <div class="movie-list-info">
                        	 <a href="${path}/cinema/cinemaDetail?no=${ cinema.cinemaNo }" name="no">
                            <img src="${ path }/resources/image/cinema/${ cinema.cinemaImg }" alt="영화관"></a>
                        </div>
                        <div class="infor">
                            <strong>${ cinema.cinemaName }</strong>
                        </div>
                    </li>
                    </c:forEach>
                </ol>
            </div>
            <div class="chart_cont3">
                <ol class="list" id="movieList">
                	<c:forEach var="cinema" items="${ cinemaIC }">
                    <li>
                        <div class="movie-list-info">
                        	 <a href="${path}/cinema/cinemaDetail?no=${ cinema.cinemaNo }" name="no">
                            <img src="${ path }/resources/image/cinema/${ cinema.cinemaImg }" alt="영화관"></a>
                        </div>
                        <div class="infor">
                            <strong>${ cinema.cinemaName }</strong>
                        </div>
                    </li>
                    </c:forEach>
                </ol>
            </div>
            <div class="chart_cont4">
                <ol class="list" id="movieList">
                	<c:forEach var="cinema" items="${ cinemaGW }">
                    <li>
                        <div class="movie-list-info">
                        	 <a href="${path}/cinema/cinemaDetail?no=${ cinema.cinemaNo }" name="no">
                            <img src="${ path }/resources/image/cinema/${ cinema.cinemaImg }" alt="영화관"></a>
                        </div>
                        <div class="infor">
                            <strong>${ cinema.cinemaName }</strong>
                        </div>
                    </li>
                    </c:forEach>
                </ol>
            </div>
            <div class="chart_cont5">
                <ol class="list" id="movieList">
                	<c:forEach var="cinema" items="${ cinemaD }">
                    <li>
                        <div class="movie-list-info">
                        	 <a href="${path}/cinema/cinemaDetail?no=${ cinema.cinemaNo }" name="no">
                            <img src="${ path }/resources/image/cinema/${ cinema.cinemaImg }" alt="영화관"></a>
                        </div>
                        <div class="infor">
                            <strong>${ cinema.cinemaName }</strong>
                        </div>
                    </li>
                    </c:forEach>
                </ol>
            </div>
        </div>
	            
            </div>

	<div id="choiceCinema"><span id="Cmovie" style="margin-left: 20px;">선택하신 영화관 :  </span> </div>
	
		<input type="hidden" name="cinemaName" value="강남점">
	            
		<div id="subtitle"><img src="${ path }/resources/image/ticketing/tag.png" id="tag"> 상영날짜</div>
			<span id="infospan"><img src="${ path }/resources/image/ticketing/mark.png" id="mark"> 영화는 일주일 간격으로 예매가 가능합니다.</span>
				<div id="date"><img src="${ path }/resources/image/ticketing/calendar_icon.png" id="calendar"> DATE
						
						<input type='date' id='currentDate' name="showDate">
	
				</div>
		
		<div id="subtitle"><img src="${ path }/resources/image/ticketing/tag.png" id="tag"> 시간 선택</div>
			<div id="infospan"><span><img src="${ path }/resources/image/ticketing/mark.png" id="mark"> 시간이 안 나올시 상영날짜를 다시 한번 설정하세요.</span></div>
		
	    
	            
		<div id="choice"><p>선택하신 시간 : 
				<input type="checkbox" style="margin-left: 20px;"> 11:00
				<input type="checkbox" style="margin-left: 20px;"> 12:00
			</p> <div id="result"> </div></div>

		<input type="hidden" name="memberNo" value="2">

		<div id="btn">
			<button type="submit" class="btn">
				<p id="p1">NEXT STEP</p>
				<p id="p2">-------------------------------<span id="p3">> </span></p>
				<em id="p2">chosee a seat</em>
			</button>
		</div>

</section>
		</form>
<script src="${ path }/resources/js/modernizr-custom.js"></script>
<script src="${ path }/resources/js/ie-checker.js"></script>


	<!-- 달력에 현재 일자 스크립트 -->
	<script>
		document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
	

	<!-- 영화 선택 시, 선택된 값 출력 스크립트 내용 수정할것. 미구현. -->
/* 	document.getElementById("mclick").addEventListener('click', Cmovie);
	function Cmovie() {
	  document.getElementById("mclick").innerHTML = "${ movieList.movieTitle }";
	} */
	
    //영화차트 이미지 슬라이드
	 var swiper = new Swiper(".mySwiper", {
		 slidesPerView : 6,
	        navigation: {
	          nextEl: ".swiper-button-next",
	          prevEl: ".swiper-button-prev",
	        },
	        scrollbar: {
	            el: ".swiper-scrollbar",
	            hide: true,
	          },
	      });
	
	
	$(document).ready(function(){
        $("#selectMovie").click(function(){
        	$("#choice").append("<span>"+"공조2"+"</span>")
        });
        
        $("#seoul").click(function(){
        	$("#cinemaChoice").append(		
        			"<div class='movie_title'>"+
        	        "<ul>"+
                    "<li class='active'>"+"<a href='#'>"+"강남" + "</a>"+"</li>"+
                    "<li>"+"<a href='#'>" + "홍대" + "</a>"+"</li>"+
               		 "</ul>"+ "</div>")
        });
        
        $("#seoul").click(function(){
        	$("#choiceCinema").append("<span>"+"강남"+"</span>")
        });

    
        
        
        
    });
	

       
		//영화차트 탭 메뉴
		var movBtn = $(".movie_title > ul > li");
		var movCont = $(".movie-list > div");
		
		movCont.hide().eq(0).show();
		
		movBtn.click(function(e){
		    e.preventDefault(); // 눌렀을 때 위로 안올라감.
		    var target = $(this); // 사용자가 몇번째 버튼을 클릭했는지 알 수 있음.
		    var index = target.index();
		    movBtn.removeClass("active"); // 클릭하지 않은 부분 active 제거
		    target.addClass("active"); // 클릭한 부분에 active 추가
		    movCont.css("display","none");
		    movCont.eq(index).css("display","block");
		});
		
		
	      $( document ).ready( function() {
	          var jbText = $( 'div' ).text();
	        } );
	      
</script>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" />