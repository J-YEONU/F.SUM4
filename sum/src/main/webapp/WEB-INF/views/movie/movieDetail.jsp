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
            <img id="poster" width="300" src="${ path }/resources/post/9_10/${ movieDetail.moviePoster }">
        </div>

        <div class="detail_info">
            <div>개봉일: ${movieDetail.movieRelease}</div>
            <div>감독 : ${movieDetail.movieDirector}</div>
            <div>출연진 : ${movieDetail.movieCast}</div>
            <div>장르 : ${movieDetail.movieGenre}</div>
            <div>관람등급 : ${movieDetail.movieRating}</div>
            <div>평점 : ${ avgScore }점 (참여 : ${ participant }명)</div>
            <div>예매율: <fmt:formatNumber value="${ ticketingRate }" pattern=".0"/>%</div> 
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
        <p align="center" id="url"><iframe width="560" height="315" src="https://www.youtube.com/embed/M-OsBtkztpQ" 
        title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; 
        clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>
        <div class="filmstrip">  	
			<c:choose>
				<c:when test="${ stillCutList.get(0) == null }">
					<div class="stillCut"></div>
					<div class="stillCut"></div>
					<div class="stillCut"></div>
					<div class="stillCut"></div>
				</c:when>

				<c:when test="${ stillCutList != null }">
		            <div class="stillCut"><img id="sc" src="${ path }/resources/image/stillCut/${ stillCutList.get(0) }"></div>
		            <div class="stillCut"><img id="sc" src="${ path }/resources/image/stillCut/${ stillCutList.get(1) }"></div>
		            <div class="stillCut"><img id="sc" src="${ path }/resources/image/stillCut/${ stillCutList.get(2) }"></div>
		            <div class="stillCut"><img id="sc" src="${ path }/resources/image/stillCut/${ stillCutList.get(3) }"></div>
				</c:when>
			</c:choose>

            
        </div>
    </div>

    <div class="review">
        <h3 class="review_h3"><img id="tag" src="${ path }/resources/image/tag.png">평점 및 영화 리뷰</h3>

        <form class="mb-3" name="myform" id="myform" action="${ path }/movie/movieCommentsInsert" method="post">
			<input type="hidden" name="cmId" value="${loginMember.id}">
			<input type="hidden" name="mNo" value="${movieDetail.movieNo}">
			<input type="hidden" name="mName" value="${movieDetail.movieTitle}">
            <span class="text-bold">내 평점 등록하기</span>
            <fieldset>
                <input type="radio" name="score" value="5" id="rate1"><label for="rate1">★</label>
                <input type="radio" name="score" value="4" id="rate2"><label for="rate2">★</label>
                <input type="radio" name="score" value="3" id="rate3"><label for="rate3">★</label>
                <input type="radio" name="score" value="2" id="rate4"><label for="rate4">★</label>
                <input type="radio" name="score" value="1" id="rate5"><label for="rate5">★</label>
            </fieldset>
            <div>
                <textarea class="col-auto form-control" type="text" name="content"
                id="reviewContents" placeholder="영화 리뷰는 로그인 후 작성 가능합니다."></textarea>
                <span class="input-group-btn">
                    <button class="btn-btn-default" type="submit" id="commentInsertBtn" name="commentInsertBtn" >등록</button>
                </span>
            </div>
        </form>
        
        <!-- 댓글 불러오기 -->
        <div class="reply_contents">
            <ul id="comment_ul">
            	<c:forEach var="commentList" items="${ list }">
	                <li>
	                	<span id="iconSpan">
	                    <img src="${ path }/resources/image/4sum1.png" class="reply_contents_userIcon">
	                	</span>
	                	<c:choose>
	                		<c:when test="${ commentList.score == 1 }">
	                			<span id="starSpan"><img src="${ path }/resources/image/star/star1.PNG" id="star"></span>
	                		</c:when>
	                		<c:when test="${ commentList.score == 2 }">
	                			<span id="starSpan"><img src="${ path }/resources/image/star/star2.PNG" id="star"></span>
	                		</c:when>
	                		<c:when test="${ commentList.score == 3 }">
	                			<span id="starSpan"><img src="${ path }/resources/image/star/star3.PNG" id="star"></span>
	                		</c:when>
	                		<c:when test="${ commentList.score == 4 }">
	                			<span id="starSpan"><img src="${ path }/resources/image/star/star4.PNG" id="star"></span>
	                		</c:when>
	                		<c:when test="${ commentList.score == 5 }">
	                			<span id="starSpan"><img src="${ path }/resources/image/star/star5.PNG" id="star"></span>
	                		</c:when>
	                	</c:choose>
	                    <span id="reply_contents_writer"> ${ commentList.cmId } </span>
	                    <span> ${ commentList.content } </span>
	                    <span id="reply_contents_date">
	                       <fmt:formatDate value="${ commentList.regDate }" pattern="yyyy-MM-dd"/>
	                        <span>
                   				<c:if test="${ not empty loginMember && loginMember.id == commentList.cmId }">
                   					<form action="${ path }/movie/movieCommentsDelete" method="post"
                   							style="display: inline;">
                   						<input type="hidden" name="cmNo" value="${commentList.cmNo}">
                   						<input type="hidden" name="mNo" value="${movieDetail.movieNo}">
			                            <button class="reply_contents_delete" type="submit" id="commentDeleteBtn" name="commentDeleteBtn">삭제</button>
	                   				</form>
								</c:if>
	                        </span>
	                    </span>
                        <hr>
	                </li>
            	</c:forEach>
            </ul>
        </div>
    </div>

    <script src="${ path }/js/jquery-3.6.0.min.js"></script>
    <script>
/* 	    $(document).ready(function(){
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
	        
	    });*/
	    
/* 		$(document).ready(() => {
			$("#commentDeleteBtn").on("click", () => {
				if(confirm("댓글을 삭제 하시겠습니까?")) {
					location.replace("${ path }/movie/movieCommentsDelete?cmNo=${ list.get(0) }&mNo=${movieDetail.movieNo});
				}
			}); */
			
/* 			$("#replyContent").on("focus", (e) => {
				if(${ empty loginMember }) {
					alert("로그인 후 이용해주세요!");
					
					$("#userId").focus();				
				}
			}); 
		});*/
	    
	    
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />