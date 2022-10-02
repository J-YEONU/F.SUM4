<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/main/main1.css">
<link rel="stylesheet" href="${ path }/resources/css/main/main2.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <div class="section">
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
        
        <!-- // 슬라이드 쇼 끝 -->
    
        <!-- 왼쪽 오른쪽 화살표 버튼 -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <!-- <span>Previous</span> -->
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <!-- <span>Next</span> -->
        </a>
        <!-- // 화살표 버튼 끝 -->
        
        <!-- 인디케이터 -->
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작-->
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>
        <!-- 인디케이터 끝 -->
    </div>
        


    <section id="movie">
        <div class="container">
            <div class="row">
                <div class="movie">
                    <h2 class="ir_so">최신 영화 정보</h2>
                    <div class="movie_title">
                        <ul>
                            <li class="active"><a href="#">박스오피스</a></li>
                            <li><a href="#">최신개봉작</a></li>
                            <li><a href="#">상영예정작</a></li>
                        </ul>
                    </div>
                    <div class="movie_chart">
                        <div class="chart_cont1">
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="${ path }/resources/image/poster1.jpg"  alt="침묵">
                                    </figure>
                                    <div class="rank">1</div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon all ir_pm">전체</span> <strong>공조</strong></h3>
                                    <div class="movie_info">
                                        <span>예매율 0.0%</span>
                                        <span>관람평점 0.0</span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="${ path }/resources/image/poster1.jpg"  alt="침묵">
                                    </figure>
                                    <div class="rank">2</div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a12 ir_pm">12세</span> <strong>공조</strong></h3>
                                    <div class="movie_info">
                                        <span>예매율 0.0%</span>
                                        <span>관람평점 0.0</span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="${ path }/resources/image/poster1.jpg"  alt="침묵">
                                    </figure>
                                    <div class="rank">3</div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a15 ir_pm">15세</span> <strong>공조</strong></h3>
                                    <div class="movie_info">
                                        <span>예매율 0.0%</span>
                                        <span>관람평점 0.0</span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="${ path }/resources/image/poster1.jpg"  alt="침묵">
                                    </figure>
                                    <div class="rank">4</div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a19 ir_pm">19세</span> <strong>공조</strong></h3>
                                    <div class="movie_info">
                                        <span>예매율 0.0%</span>
                                        <span>관람평점 0.0</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //chart_cont1-->
                        <div class="chart_cont2">
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="${ path }/resources/image/poster1.jpg"  alt="침묵">
                                    </figure>
                                    <div class="rank">1</div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a12 ir_pm">12세</span> <strong>공조</strong></h3>
                                    <div class="movie_info">
                                        <span>예매율 0.0%</span>
                                        <span>관람평점 0.0</span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="${ path }/resources/image/poster1.jpg"  alt="침묵">
                                    </figure>
                                    <div class="rank">2</div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a12 ir_pm">12세</span> <strong>공조</strong></h3>
                                    <div class="movie_info">
                                        <span>예매율 0.0%</span>
                                        <span>관람평점 0.0</span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="${ path }/resources/image/poster1.jpg"  alt="침묵">
                                    </figure>
                                    <div class="rank">3</div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a12 ir_pm">12세</span> <strong>공조</strong></h3>
                                    <div class="movie_info">
                                        <span>예매율 0.0%</span>
                                        <span>관람평점 0.0</span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="${ path }/resources/image/poster1.jpg"  alt="침묵">
                                    </figure>
                                    <div class="rank">4</div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a12 ir_pm">12세</span> <strong>공조</strong></h3>
                                    <div class="movie_info">
                                        <span>예매율 0.0%</span>
                                        <span>관람평점 0.0</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //chart_cont2-->
                        <div class="chart_cont3">
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="${ path }/resources/image/poster1.jpg"  alt="침묵">
                                    </figure>
                                    <div class="rank">1</div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a12 ir_pm">12세</span> <strong>공조</strong></h3>
                                    <div class="movie_info">
                                        <span>예매율 0.0%</span>
                                        <span>관람평점 0.0</span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="${ path }/resources/image/poster1.jpg"  alt="침묵">
                                    </figure>
                                    <div class="rank">2</div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a12 ir_pm">12세</span> <strong>공조</strong></h3>
                                    <div class="movie_info">
                                        <span>예매율 0.0%</span>
                                        <span>관람평점 0.0</span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="${ path }/resources/image/poster1.jpg"  alt="침묵">
                                    </figure>
                                    <div class="rank">3</div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a12 ir_pm">12세</span> <strong>공조</strong></h3>
                                    <div class="movie_info">
                                        <span>예매율 0.0%</span>
                                        <span>관람평점 0.0</span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="${ path }/resources/image/poster1.jpg"  alt="침묵">
                                    </figure>
                                    <div class="rank">4</div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a12 ir_pm">12세</span> <strong>공조</strong></h3>
                                    <div class="movie_info">
                                        <span>예매율 0.0%</span>
                                        <span>관람평점 0.0</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //chart_cont3-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //movie -->
        
        <section id="event">
            <div class="container">
                <div class="row">
                    <div class="event">
                        <div class="event_title">
                            <h4><img src="${ path }/resources/image/SUMICON.png" alt="세모아이콘"> <strong>새로운 이벤트</strong></h4>
                        </div>
                        <div class="event_left">
                            <div class="event_slider">
                                <img src="${ path }/resources/image/event01.jpg" alt="시티 패키지">
                            </div>
                            <div class="event_box1">
                                <img src="${ path }/resources/image/event02.jpg" alt="남포항점 2019 시즌할인권">
                            </div>
                            <div class="event_box2">
                                <img src="${ path }/resources/image/event03.jpg" alt="설 선물 이수점 전용 관람권 런칭">
                            </div>
                        </div>
                        <div class="event_right">
                            <div class="boxoffice_head">
                                <div>2022-09-19</div>
                                <div>BOX OFFICE</div>
                                <div class="date_week">
                                    <div class="date">일별순</div>
                                    <div class="week">주별순</div>
                                </div>
                            </div>
                        <table class="content-table">
                            <thead>
                                <tr>
                                    <th>순위</th>
                                    <th>영화제목</th>
                                    <th>관객수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>탑건:메버릭</td>
                                    <td>7,880,301 명</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>탑건:메버릭</td>
                                    <td>7,880,301 명</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>탑건:메버릭</td>
                                    <td>7,880,301 명</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>탑건:메버릭</td>
                                    <td>7,880,301 명</td>
                                </tr>
                            </tbody>
                        </table>
                                <button type="button" class="btn text-white" style="background-color: #333;">예매하기</button>
                        
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- //event -->
        
        
        <section id="comunity">
            <div class="container last">
                <div class="community_icon">
                    <h4><img src="${ path }/resources/image/SUMICON.png" alt="세모아이콘"> <strong>커뮤니티</strong></h4>
                </div>
                <div class="row">
                <div class="comunity">
                        <div class="cell notice">
                            <img src="${ path }/resources/image/notice_ico.png" alt="notice아이콘">
                            <div>
                                2022-08-23<br>
                                'Support Ur Movie'에서<br>
                                소식을 만나보세요.
                                <br>
                                <a href="#">
                                    공지사항 >
                                </a>
                            </div>
                        </div>
                        <div class="cell event2">
                            <img src="${ path }/resources/image/event_ico.png" alt="event아이콘">
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
                            <img src="${ path }/resources/image/inquiry_ico.png" alt="inquiry아이콘">
                            <div>
                                1:1 상담<br>
                                문의사항이나 불편사항을<br>
                                이곳에 남겨주세요.
                                <br>
                                <a href="#">
                                    1:1 문의 >
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- comunity -->
    
    </div>
    </div>
    <!-- 자바스크립트 라이브러리 -->
    <script src="./js/jquery.min_1.12.4.js"></script>
    <script src="./js/modernizr-custom.js"></script>
    <script src="./js/ie-checker.js"></script>
    <script src="./js/swiper.min.js"></script>
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
        var movBtn = $(".movie_title > ul > li");
        var movCont = $(".movie_chart > div");
        
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
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />