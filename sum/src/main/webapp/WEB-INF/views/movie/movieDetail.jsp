<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/movie/movieDetail.css?var=1">

	<div class="name">
        <h1>육사오(6/45)</h1>
        <hr>
    </div>

    <div class="detail_page">
        <div class="posterImg">
            <img id="poster" width="300" src="${ path }/resources/post/9_10/645.jpg">
        </div>

        <div class="detail_info">
            <div>개봉일: {released}</div>
            <div>감독 : {director}</div>
            <div>배우 : {casts}</div>
            <div>배우 : {casts? casts.map(cast => <span>{cast} </span>):null}</div>
            <div>장르 : {genres}</div>
            <div>상영 여부 : {screenStatus}</div>
            <div>상영시간 : {runtime}</div>
            <div>관람객 평점 : {visitorRating}</div>
            <div>전문가 평점 : {expertRating}</div>
            <div>예매율: {advanceRate}</div>
            <div>예매율 순위 : {advanceRateRank}</div>
        </div>

        <div class="booking">
            <button id="btn" type="button">영화 예매하러가기</button>
        </div>
    </div>

    <div class="plot_div">
        <h3><img id="tag" src="${ path }/resources/image/tag.png">줄거리</h3>
        <div>우연히 1등 당첨 로또를 주운 말년 병장 ‘천우’. 심장이 터질듯한 설렘도 잠시, 순간의 실수로 바람을 타고 군사분계선을 넘어간 로또. 바사삭 부서진 멘탈을 부여잡고…기필코 다시 찾아야 한다! 우연히 남쪽에서 넘어온 1등 당첨 로또를 주운 북한 병사 ‘용호’. 이거이 남조선 인민의 고혈을 쥐어 짜내는 육사오라는 종이쪼가리란 말인가? 근데 무려 당첨금이 57억이라고?! 당첨금을 눈앞에서 놓칠 위기에 처한 ‘천우’와 북에선 한낱 종이쪼가리일 뿐일 로또를 당첨금으로 바꿔야 하는 ‘용호’. 여기에 예상치 못한 멤버들(?)까지 합류하고 57억을 사수하기 위한 3:3팀이 결성되는데… 주운 자 VS 또 주운 자 아슬아슬 선 넘는 지분 협상이 시작된다!</div>
    </div>

    <div class="poto">
        <h3><img id="tag" src="${ path }/resources/image/tag.png">포토 & 예고편</h3>
        <div class="filmstrip">
            <div class="stillCut"><img id="sc" src="${ path }/resources/image/stillCut/stillcut_645.jpg"></div>
            <div class="stillCut"><img id="sc" src="${ path }/resources/image/stillCut/stillcut_645.jpg"></div>
            <div class="stillCut"><img id="sc" src="${ path }/resources/image/stillCut/stillcut_645.jpg"></div>
            <div class="stillCut"><img id="sc" src="${ path }/resources/image/stillCut/stillcut_645.jpg"></div>
        </div>
    </div>

    <div class="review">
        <h3 class="review_h3"><img id="tag" src="${ path }/resources/image/tag.png">평점 및 영화 리뷰</h3>

        <form class="mb-3" name="myform" id="myform" method="post">
            <span class="text-bold">내 평점 등록하기</span>
            <fieldset>
                <input type="radio" name="reviewStar" value="5" id="rate1"><label for="rate1">★</label>
                <input type="radio" name="reviewStar" value="4" id="rate2"><label for="rate2">★</label>
                <input type="radio" name="reviewStar" value="3" id="rate3"><label for="rate3">★</label>
                <input type="radio" name="reviewStar" value="2" id="rate4"><label for="rate4">★</label>
                <input type="radio" name="reviewStar" value="1" id="rate5"><label for="rate5">★</label>
            </fieldset>
            <div>
                <textarea class="col-auto form-control" type="text" 
                id="reviewContents" placeholder="영화 리뷰는 로그인 후 작성 가능합니다."></textarea>
                <span class="input-group-btn">
                    <button class="btn-btn-default" type="button" name="commentInsertBtn">등록</button>
                </span>
            </div>
        </form>
        
        <!-- 댓글 불러오기 -->
        <input type="hidden" name="pcnum" value="${Pconmment.PCm_no}">
        <div class="reply_contents">
            <ul>
                <li>
                    <img src="${ path }/resources/image/4sum1.png" class="reply_contents_userIcon">
                    <span id="reply_contents_writer"> 작성한 회원 아이디 </span>
                    <span> 댓글작성합니다. </span>
                    <span id="reply_contents_date">
                        2022-10-18
                        <span>
                            <input type="hidden" class="pcno" value="${Pconmment.PCm_no}">
                            <button class="reply_contents_delete" type="button" name="commentInsertBtn">삭제</button>
                        </span>
                    </span>
                </li>
                <li>
                    <img src="${ path }/resources/image/4sum1.png" class="reply_contents_userIcon">
                    <span id="reply_contents_writer"> 작성한 회원 아이디 </span>
                    <span> 댓글작성합니다. </span>
                    <span id="reply_contents_date">
                        2022-10-18
                        <span>
                            <input type="hidden" class="pcno" value="${Pconmment.PCm_no}">
                            <button class="reply_contents_delete" type="button" name="commentInsertBtn">삭제</button>
                        </span>
                    </span>
                </li>
            </ul>
        </div>
    </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />