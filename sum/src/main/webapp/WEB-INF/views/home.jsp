<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/main/main1.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	
        <div id="demo" class="carousel slide" data-ride="carousel">
	        <div class="carousel-inner">
	        <!-- 슬라이드 쇼 -->
	        <div class="carousel-item active">
	            <!--가로-->
	            <img class="d-block w-100" 
	            src="${ path }/resources/image/main/banner캐릭터.jpg"
	                alt="First slide">
	        </div>
	        <div class="carousel-item">
	            <img class="d-block w-100"
	            src="${ path }/resources/image/main/banner자백.jpg"
	            alt="Second slide">
	        </div>
	        <!-- 
	        <div class="carousel-item">
	            <img class="d-block w-100"
	            src="${ path }/resources/image/main/banner1.jpg"
	            alt="Third slide">
	        </div>
	         -->
	        
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
	            <!--  
	            <li data-target="#demo" data-slide-to="2"></li>
	            -->
	        </ul>
	        <!-- 인디케이터 끝 -->
	    </div>
    </div>
    
    
    <div class="container">
    <div id="contents">
        <div class="inner-wrap">
            <div class="movie_title" id="myTabs">
                <ul>
                    <li class="active"><a href="#">현재상영작</a></li>
                    <li><a href="#">상영예정작</a></li>

                </ul>
            </div>
        <!-- movie-list -->
        <div class="movie-list">
            <div class="chart_cont1">
                <ol class="list" id="movieList">
               		<c:forEach var="movieList" items="${ list }" varStatus="ml">
	                    <li class="no-img">
	                        <div class="movie-list-info">
	                            <a href="${path}/movie/movieDetail?no=${ movieList.movieNo }" name="no">
	                            <img src="${ path }/resources/post/9_10/${ movieList.renamedPoster  }" alt="포스터" class="poster lozad" onerror="noImg(this)"></a>
	                        	<div class="rank">${ ml.index +1 }</div>
	                        </div>
	                        
	                        <div class="infor">
	                        
	                            <c:if test="${movieList.movieRating == '전체'}"> 
	                            <h5><span class="icon gr_all">${ movieList.movieRating }</span> <strong>${ movieList.movieTitle }</strong></h5>
	                            </c:if>
	                            <c:if test="${movieList.movieRating == '12'}"> 
	                            <h5><span class="icon gr_12">${ movieList.movieRating }</span> <strong>${ movieList.movieTitle }</strong></h5>
	                            </c:if>
	                            <c:if test="${movieList.movieRating == '15'}"> 
	                            <h5><span class="icon gr_15">${ movieList.movieRating }</span> <strong>${ movieList.movieTitle }</strong></h5>
	                            </c:if>
	                            <c:if test="${movieList.movieRating == '청불'}"> 
	                            <h5><span class="icon gr_18">${ movieList.movieRating }</span> <strong>${ movieList.movieTitle }</strong></h5>
	                            </c:if>
	                            <!--  
	                            <div class="movie_info">
	                               <span>예매율  %</span>
	                               <span>관람평점 </span>
	                            </div>
	                            -->
	                            
	                        </div>
	                        
	                    </li>
	                </c:forEach>
                </ol>
            </div>
            <div class="chart_cont2">
                <ol class="list" id="movieList">
               		<c:forEach var="movieList" items="${ list1 }">
	                    <li class="no-img">
	                        <div class="movie-list-info">
	                     		   <a href="${path}/movie/movieDetail?no=${ movieList.movieNo }" name="no">
	                            <img src="${ path }/resources/post/9_10/${ movieList.renamedPoster  }" alt="포스터" class="poster lozad" onerror="noImg(this)"></a>
	                        </div>
	                        
	                        <div class="infor">
	                        
	                            <c:if test="${movieList.movieRating == '전체'}"> 
	                            <h5><span class="icon gr_all">${ movieList.movieRating }</span> <strong>${ movieList.movieTitle }</strong></h5>
	                            </c:if>
	                            <c:if test="${movieList.movieRating == '12'}"> 
	                            <h5><span class="icon gr_12">${ movieList.movieRating }</span> <strong>${ movieList.movieTitle }</strong></h5>
	                            </c:if>
	                            <c:if test="${movieList.movieRating == '15'}"> 
	                            <h5><span class="icon gr_15">${ movieList.movieRating }</span> <strong>${ movieList.movieTitle }</strong></h5>
	                            </c:if>
	                            <c:if test="${movieList.movieRating == '청불'}"> 
	                            <h5><span class="icon gr_18">${ movieList.movieRating }</span> <strong>${ movieList.movieTitle }</strong></h5>
	                            </c:if>
	                            <!--  
	                            <div class="movie_info">
	                               <span>예매율  %</span>
	                               <span>관람평점 </span>
	                            </div>
	                            -->
	                            
	                        </div>
	                        
	                    </li>
	                </c:forEach>
                </ol>
            </div>
        </div>
    </div>
</div>


<!-- 이벤트 -->
<div id="event">
    <div class="event_title">
        <h4><img id="tag" src="${ path }/resources/image/tag.png" alt="세모아이콘"> <strong>새로운 이벤트</strong></h4>
    </div>
    <div class="event_left">
        <div class="event_slider">
            <img src="${ path }/resources/image/main/event01.jpg" srcset="./img/event01@2.jpg 2x" alt="시티 패키지">
        </div>
        <div class="event_box1">
            <img src="${ path }/resources/image/main/event02.jpg" srcset="./img/event02@2.jpg 2x" alt="남포항점 2019 시즌할인권">
        </div>
        <div class="event_box2">
            <img src="${ path }/resources/image/main/event03.jpg" srcset="./img/event03@2.jpg 2x" alt="설 선물 이수점 전용 관람권 런칭">
        </div>
    </div>
        <div class="event_right">
            <div class="boxoffice_head">
                <div id="table_date"></div>
                <div>BOX OFFICE</div>
            </div>
            <div class="wrap contaner"></div>
        
    </div>
</div>

<!-- //event -->


<div id="comunity">
        <div class="community_icon">
            <h4><img id="tag" src="${ path }/resources/image/tag.png" alt="세모아이콘"> <strong>커뮤니티</strong></h4>
        </div>
        <div class="row">
        <div class="comunity" style="width: 1100px">
                <div class="cell notice">
                    <img src="${ path }/resources/image/main/notice_ico.png" alt="notice아이콘">
                    <div>
                        2022-10-31<br>
                        SUM에서<br>
                        소식을 만나보세요.
                        <br>
                        <a href="#">
                            공지사항 >
                        </a>
                    </div>
                </div>
                <div class="cell event2">
                    <img src="${ path }/resources/image/main/event_ico.png" alt="event아이콘">
                    <div>
                        새로운 이벤트<br>
                        특별한 혜택과 함께<br>
                        영화를 즐겨보세요
                        <br>
                        <a href="#">
                            이벤트 >
                        </a>
                    </div>
                </div>
                <div class="cell inquiry">
                    <img src="${ path }/resources/image/main/inquiry_ico.png" alt="inquiry아이콘">
                    <div>
                        1:1 상담<br>
                        문의사항이나 <br> 
                        불편사항을<br>
                        이곳에 남겨주세요.
                        
                        <a href="#">
                            1:1 문의 >
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- //comunity -->
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
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    // 배너 이미지 슬라이드
    $('.carousel').carousel({
      interval: 2000 //기본 5초
    })
    </script>
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
    <script type="text/javascript">
        // 박스오피스 api

        // 조회할 날짜를 계산
            var dt = new Date();
        
            var m = dt.getMonth() + 1;
            if (m < 10) {
                var month = "0" + m;
            } else {
                var month = m + "";
            }
        
            var d = dt.getDate() - 1;
            if (d < 10) {
                var day = "0" + d;
            } else {
                var day = d + "";
            }
        
            var y = dt.getFullYear();
            var year = y + "";
        
            var result = year + month + day;
            $(function() {
                $.ajax({
                    //"키입력" 부분에 발급받은 키를 입력
                    //&itemPerPage: 1-10위 까지의 데이터가 출력되도록 설정
                            url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=de487a28577ca808d2fdf3a2f7cf5640&targetDt="
                                    + result + "&itemPerPage=10",
                            dataType : "xml",
                            success : function(data) {
                                var $data = $(data)
                                        .find("boxOfficeResult>dailyBoxOfficeList>dailyBoxOffice");
                                //데이터를 테이블 구조에 저장. html의 table태그, class는 table로 하여 부트스트랩 적용
                                if ($data.length > 0) {
                                    var table = $("<table/>").attr("class", "table");
                                    //<table>안에 테이블의 컬럼 타이틀 부분인 thead 태그
                                    var thead = $("<thead/>").append($("<tr/>"))
                                            .append(
                                                    //추출하고자 하는 컬럼들의 타이틀 정의
                                                    $("<th/>").html("순위"),
                                                    $("<th/>").html("영화 제목"),
                                                    $("<th/>").html("누적 관객수"));
                                    var tbody = $("<tbody/>");
                                    $.each($data, function(i, o) {
        
                                        //오픈 API에 정의된 변수와 내가 정의한 변수 데이터 파싱
                                        var $rank = $(o).find("rank").text(); // 순위
                                        var $movieNm = $(o).find("movieNm").text(); //영화명
                                        var $audiAcc = $(o).find("audiAcc").text(); //누적 관객수
                                        
                                        //<tbody><tr><td>태그안에 파싱하여 추출된 데이터 넣기
                                        var row = $("<tr/>").append(
                                                
                                                $("<td/>").text($rank),
                                                $("<td/>").text($movieNm),
                                                $("<td/>").text($audiAcc));
        
                                        tbody.append(row);
        
                                    });// end of each 
        
                                    table.append(thead);
                                    table.append(tbody);
                                    $(".wrap").append(table);
                                }
                            },
                            //에러 발생시 "실시간 박스오피스 로딩중"메시지가 뜨도록 한다.
                            error : function() {
                                alert("실시간 박스오피스 로딩중...");
                            }
                        });
            });
        </script>
        <script>
            var today = new Date();

            var year = today.getFullYear();
            var month = ('0' + (today.getMonth() + 1)).slice(-2);
            var day = ('0' + today.getDate()).slice(-2);

            var dateString = year + '-' + month  + '-' + day;

            document.getElementById("table_date").innerText = dateString;
            console.log(dateString);
        </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />