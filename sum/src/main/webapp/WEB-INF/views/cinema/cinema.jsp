<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/cinema/cinema.css">


 <div class="container">
    <div class="inner-wrap">
   	<h2 id="title"><strong>영화관</strong></h2>
    <p>내 집같은 편안함, 영화관의 새로운 표준을 제시합니다.</p>
          <hr>
      <div><img src="${ path }/resources/image/cinema/cinema.png"></div>

    <div id="contents">
      <div id="tagtitle"><img src="${ path }/resources/image/tag.png" id="tag"> 영화관 선택</div>
            <div class="movie_title">
                <ul>
                    <li class="active"><a href="#">서울</a></li>
                    <li><a href="#">경기</a></li>
                    <li><a href="#">인천</a></li>
                    <li><a href="#">강원</a></li>
                    <li><a href="#">대전/충청</a></li>
                </ul>
            </div>
        <!-- cinema-list -->
        <div class="movie-list">
            <div class="chart_cont1">
                <ol class="list" id="movieList">
                	<c:forEach var="cinema" items="${ cinema }">
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
                	<c:forEach var="cinema" items="${ cinema }">
                    <li>
                        <div class="movie-list-info">
                            <img src="${ path }/resources/image/cinema/${ cinema.cinemaImg }" alt="영화관">
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
                	<c:forEach var="cinema" items="${ cinema }">
                    <li>
                        <div class="movie-list-info">
                            <img src="${ path }/resources/image/cinema/${ cinema.cinemaImg }" alt="영화관">
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
                	<c:forEach var="cinema" items="${ cinema }">
                    <li>
                        <div class="movie-list-info">
                            <img src="${ path }/resources/image/cinema/${ cinema.cinemaImg }" alt="영화관">
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
                	<c:forEach var="cinema" items="${ cinema }">
                    <li>
                        <div class="movie-list-info">
                            <img src="${ path }/resources/image/cinema/${ cinema.cinemaImg }" alt="영화관">
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
</div>
</div>


<<<<<<< HEAD
    <!-- 자바스크립트 라이브러리 -->
    <script src="${ path }/resources/js/jquery.min_1.12.4.js"></script>
    <script src="${ path }/resources/js/modernizr-custom.js"></script>
    <script src="${ path }/resources/js/ie-checker.js"></script>
    <script src="${ path }/resources/js/swiper.min.js"></script>
    <script>
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
    </script>
=======
   <div class="cinema">
  	 <c:forEach var="cinema" items="${ list }">
	      <div class="cinemaInfo">
	         <span>
	         	<img src="${ cinema.cinemaImg }">
         	</span>   
	        	 <strong class="cInfo">${ cinema.cinemaName } </strong>
	      </div>
	</c:forEach>
   </div>
</section>
>>>>>>> 50d41631ec4d415d57f01ede0d8469f883a40c3a


<jsp:include page="/WEB-INF/views/common/footer.jsp" />