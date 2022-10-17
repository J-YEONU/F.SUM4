<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/movieList.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	    <h3><strong>무비차트</strong></h3>
	    <p>생생함이 담긴 영화소식, 다양한 영화를 만나보세요.</p>
	    <!-- 영화 등록 임시 버튼 -->
	                    <button type="submit" onclick="location.href='${ path }/admin/movie'">등록하기(임시)</button>
	
     <div class="container">
        <div id="demo" class="carousel slide" data-ride="carousel">
	        <div class="carousel-inner">
	        <!-- 슬라이드 쇼 -->
	        <div class="carousel-item active">
	            <!--가로-->
	            <img class="d-block w-100" 
	            src="${ path }/resources/image/banner1.jpg"
	                alt="First slide">
	            <div class="carousel-caption d-none d-md-block">
	                <h5>TEST</h5>
	                <p>testtesttest</p>
	            </div>
	        </div>
	        <div class="carousel-item">
	            <img class="d-block w-100"
	            src="${ path }/resources/image/banner1.jpg"
	            alt="Second slide">
	        </div>
	        <div class="carousel-item">
	            <img class="d-block w-100"
	            src="${ path }/resources/image/banner1.jpg"
	            alt="Third slide">
	        </div>
	        
	        <!-- / 슬라이드 쇼 끝 -->
	    
	        <!-- 왼쪽 오른쪽 화살표 버튼 -->
	        <a class="carousel-control-prev" href="#demo" data-slide="prev">
	            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	            <!-- <span>Previous</span> -->
	        </a>
	        <a class="carousel-control-next" href="#demo" data-slide="next">
	            <span class="carousel-control-next-icon" aria-hidden="true"></span>
	            <!-- <span>Next</span> -->
	        </a>
	        <!-- / 화살표 버튼 끝 -->
	        
	        <!-- 인디케이터 -->
	        <ul class="carousel-indicators">
	            <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작-->
	            <li data-target="#demo" data-slide-to="1"></li>
	            <li data-target="#demo" data-slide-to="2"></li>
	        </ul>
	        <!-- 인디케이터 끝 -->
	    </div>
<<<<<<< HEAD
    </div>
    <div id="contents">
        <div class="inner-wrap">
            <div class="movie_title">
                <ul>
                    <li class="active"><a href="#">현재상영작</a></li>
                    <li><a href="${ path }/movie/movieList2">상영예정작</a></li>
                    <li><a href="#">나의추천영화</a></li>
                </ul>
            </div>
        <!-- movie-list -->
        <div class="movie-list">
            <div class="chart_cont1">
                <ol class="list" id="movieList">
               		<c:forEach var="movieList" items="${ list }">
	                    <li class="no-img">
	                        <div class="movie-list-info">
	                     		   <!-- 영화 상세페이지로 가는 링크 
	                               <a href="${path}/movie/view?no=${ movieList.movieNo }" name="no"> -->
	                            <img src="${ path }/resources/image/poster/${ movieList.moviePoster }" alt="포스터" class="poster lozad" onerror="noImg(this)">
	                        </div>
	                        
	                        <div class="infor">
	                        
	                            <c:if test="${movieList.movieRating == '전체'}"> 
	                            <h3><span class="icon gr_all">${ movieList.movieRating }</span> <strong>${ movieList.movieTitle }</strong></h3>
	                            </c:if>
	                            <c:if test="${movieList.movieRating == 12}"> 
	                            <h3><span class="icon gr_12">${ movieList.movieRating }</span> <strong>${ movieList.movieTitle }</strong></h3>
	                            </c:if>
	                            <c:if test="${movieList.movieRating == 15}"> 
	                            <h3><span class="icon gr_15">${ movieList.movieRating }</span> <strong>${ movieList.movieTitle }</strong></h3>
	                            </c:if>
	                            <c:if test="${movieList.movieRating == '청불'}"> 
	                            <h3><span class="icon gr_18">${ movieList.movieRating }</span> <strong>${ movieList.movieTitle }</strong></h3>
	                            </c:if>
	                            <div class="movie_info">
	                               <span>예매율 ${ movieList.movieBookingRate } %</span>
	                               <span>관람평점 ${ movieList.movieRating }</span>
	                            </div>
	                            
	                        </div>
	                        
	                    </li>
	                </c:forEach>
                </ol>
            </div>
            <div class="chart_cont2">
                <ol class="list" id="movieList">
               		<c:forEach var="movieList" items="${ list }">
	                    <li class="no-img">
	                        <div class="movie-list-info">
	                     		   <!-- 영화 상세페이지로 가는 링크 
	                               <a href="${path}/movie/view?no=${ movieList.movieNo }" name="no"> -->
	                            <img src="${ path }/resources/image/poster/${ movieList.moviePoster }" alt="포스터" class="poster lozad" onerror="noImg(this)">
	                        </div>
	                        <div class="infor">
	                            <h3><span class="icon gr_all">전체</span> <strong>${ movieList.movieTitle }</strong></h3>
	                            <div class="movie_info">
	                               <span>예매율 ${ movieList.movieBookingRate } %</span>
	                               <span>관람평점 ${ movieList.movieRating }</span>
=======
	        
	                    
	                    
	    <section id="movie">
	        <div class="container">
	            <div class="row">
	                <div class="movie">
	                    <div class="movie_title">
	                        <ul>
	                            <li class="active"><a href="#">현재상영작</a></li>
	                            <li><a href="#">상영예정작</a></li>
	                            <li><a href="#">나의추천영화</a></li>
	                        </ul>
	                    </div>
	                    <div class="movie_chart">
	                        <div class="chart_cont1">
	                            <div>
	                            	<c:forEach var="movieList" items="${ list }">
		                                <div class="poster">
		                                <!-- 영화 상세페이지로 가는 링크 
		                                <a href="${path}/movie/view?no=${ movieList.movieNo }" name="no"> -->
		                                    <figure>
		                                        <img src="${ path }/resources/image/${ movieList.moviePoster }"  alt="포스터">
		                                    </figure>
		                                </div>
		                                <div class="infor">
		                                    <h3><span class="icon gr_18">청불</span> <strong>${ movieList.movieTitle }</strong></h3>
		                                    <div class="movie_info">
		                                        <span>예매율 ${ movieList.movieBookingRate } %</span>
		                                        <span>관람평점 ${ movieList.movieRating }</span>
		                                    </div>
		                                </div>
	                                </c:forEach>
>>>>>>> 7f2456c60d682214ce0bb0c62d4deb81add072fd
	                            </div>
	                        </div>
	                    </li>
	                </c:forEach>
                </ol>
            </div>
            <div class="chart_cont3">
                <div id="subtitle"><img src="${ path }/resources/image/tag.png" id="tag">장르</div>
                <ol class="list" id="movieList">
               		<c:forEach var="movieList" items="${ list }">
	                    <li class="no-img">
	                        <div class="movie-list-info">
	                     		   <!-- 영화 상세페이지로 가는 링크 
	                               <a href="${path}/movie/view?no=${ movieList.movieNo }" name="no"> -->
	                            <img src="${ path }/resources/image/poster/${ movieList.moviePoster }" alt="포스터" class="poster lozad" onerror="noImg(this)">
	                        </div>
	                        <div class="infor">
	                            <h3><span class="icon gr_all">전체</span> <strong>${ movieList.movieTitle }</strong></h3>
	                            <div class="movie_info">
	                               <span>예매율 ${ movieList.movieBookingRate } %</span>
	                               <span>관람평점 ${ movieList.movieRating }</span>
	                            </div>
	                        </div>
	                    </li>
	                </c:forEach>
                </ol>
            </div>
        </div>
    </div>
</div>
</div>
        
        
        
        
        
        
        
    <!-- 자바스크립트 라이브러리 -->
    <script src="${ path }/resources/js/jquery.min_1.12.4.js"></script>
    <script src="${ path }/resources/js/modernizr-custom.js"></script>
    <script src="${ path }/resources/js/ie-checker.js"></script>
    <script src="${ path }/resources/js/swiper.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
    <script>
    // 배너 이미지 슬라이드
    $('.carousel').carousel({
      interval: 2000 //기본 5초
    })

        //영화차트 이미지 슬라이드
        var mySwiper = new Swiper('.swiper-container2', {
            slidesPerView: 4,
            spaceBetween: 24,
//            mousewheel: {
//                invert: true,
//            },
            keyboard: {
                enabled: true,
                onlyInViewport: false,
            },
            autoplay: {
                delay: 6000,
            },
        });
        
        //영화차트 탭 메뉴
        <!-- var movBtn = $(".movie_title > ul > li");
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
        }); -->
    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />