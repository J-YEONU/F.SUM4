<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/movie/movieDetail.css?var=1">

	<div class="name">
        <h1>${movieDetail.movieTitle}</h1>
        <hr>
    </div>

    <div class="detail_page">
        <div class="posterImg">
            <img id="poster" width="300" src="${ path }/resources/post/9_10/645.jpg">
        </div>

        <div class="detail_info">
            <div>개봉일: ${movieDetail.movieRelease}</div>
            <div>감독 : ${movieDetail.movieDirector}</div>
            <div>출연진 : ${movieDetail.movieCast}</div>
            <div>장르 : ${movieDetail.movieGenre}</div>
            <div>관람등급 : ${movieDetail.movieRating}</div>
            <div>평점 : ${movieDetail.movieGrade} (참여 : 16명)</div>
            <div>예매율: 10.2%</div>
        </div>

        <div class="booking">
            <a href="${ path }/ticket/ticketing"><button id="btn" type="button">영화 예매하러가기</button></a>
        </div>
    </div>

    <div class="plot_div">
        <h3><img id="tag" src="${ path }/resources/image/tag.png">줄거리</h3>
        <div>${movieDetail.movieSummary}</div>
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
                    <button class="btn-btn-default" type="button" id="commentInsertBtn" name="commentInsertBtn" >등록</button>
                </span>
            </div>
        </form>
        <!-- 댓글 불러오기 -->
        <input type="hidden" name="pcnum" value="${Pconmment.PCm_no}">
        <div class="reply_contents">
            <ul id="comment_ul">
            	<c:forEach var="commentList" items="${ list }">
	                <li>
	                    <img src="${ path }/resources/image/4sum1.png" class="reply_contents_userIcon">
	                    <span id="reply_contents_writer"> ${ commentList.cmId } </span>
	                    <span> ${ commentList.content } </span>
	                    <span id="reply_contents_date">
	                       <fmt:formatDate value="${ commentList.regDate }" pattern="yyyy-MM-dd"/>
	                        <span>
	                            <input type="hidden" class="pcno" value="${Pconmment.PCm_no}">
	                            <button class="reply_contents_delete" type="button" id="commentEditBtn" name="commentEditBtn">수정</button>
	                            <button class="reply_contents_delete" type="button" id="commentDeleteBtn" name="commentDeleteBtn">삭제</button>
	                        </span>
	                        <hr>
	                    </span>
	                </li>
            	</c:forEach>
            </ul>
        </div>
    </div>
    <script src="${ path }/js/jquery-3.6.0.min.js"></script>
    <script>
	    $(document).ready(function(){
	        $("#commentInsertBtn").click(function(){
	        	let comment = $("#reviewContents").val();
	        	
	            $.ajax({
	                type:'POST',       // 요청 메서드
	                url: '${ path }/movie/movieCommentsInsert',  // 요청 URI
	                //headers : { "content-type": "application/json"}, // 요청 헤더
	                dataType: "json", // 전송받을 데이터의 타입
	                data : {"comment" : comment },  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
	                success : function(result){
	                    //alert("received="+result);       // result는 서버가 전송한 데이터
	                    //$("#data").html("name="+person2.name+", age="+person2.age);
	                    var comment_ul = $("#comment_ul"); //
	                    comment_ul.append("<li>"
	                    		+ "<img src='" + "/sum" + "/resources/image/4sum1.png' class='reply_contents_userIcon'>"
	                    		+ "<span>"+result.comment +"</span>"
	                    		+"</li>"); //ul_list안쪽에 li추가
	                },
	                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
	            }); // $.ajax()
	            //alert("the request is sent")
	        });
	        
	    });
	    
	    
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />