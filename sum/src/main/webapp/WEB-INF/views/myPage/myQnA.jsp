<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/myPage/myQnA.css?var=1">

    <div class="section">
        <h2>마이페이지</h2>
        <p>홍길동님, 오늘도 영화처럼 멋진 하루 되세요!</p>

        <hr class="hr1">

        <div class="nav"> 
            <ul class="nav_ul">
                <li><a href="${ path }/myPage/myBooking">예매확인/취소</a></li>
                <li><a href="#">나의 포인트</a></li>
                <li><a href="${ path }/myPage/myQnA">나의 문의내역</a></li>
                <li><a href="${ path }/myPage/myComments">나의 한줄평</a></li>
                <li><a href="#">나의 무비로드</a></li>
                <li><a href="${ path }/myPage/myInfoMod">개인정보수정</a></li>
            </ul>
            <hr>
        </div>

        <div class="board_list_wrap">
            <table class="board_list">
                <thead>
                    <tr class="tr1">
                        <td>NO</td>
                        <td>제목</td>
                        <td>등록일</td>
                        <td>답변상태</td>
                    </tr>
                </thead>
                <tbody>
                
                <c:if test="${ empty list }">
            		<tr>
						<td colspan="4">
							조회된 게시글이 없습니다.
						</td>
					</tr>	
				</c:if>
				
				<c:if test="${ not empty list }">
					<c:forEach var="qna" items="${ list }">
	                    <tr>
	                        <td>${ qna.no }</td>
	                        <td> <a href="${ path }/sum/myPage/myQnADetail?no=${ qna.no }">${ qna.title }</a> </td>
	                        <td><fmt:formatDate type="date" value="${ qna.createDate }"/></td>
	                        <c:choose>
	                         	<c:when test="${ qna.answerStatus == 'Y'.charAt(0) }">
		                         	<td>진행중</td>
	                         	</c:when>
	                         	<c:when test="${ qna.answerStatus == 'N'.charAt(0) }">
		                         	<td class="td4">답변완료</td>
	                         	</c:when>
                         	</c:choose>
	                    </tr>
                    </c:forEach>
                </c:if>

                </tbody>
            </table>
        </div>
        
        <!-- ====================================================== -->
         <!-- 페이지 버튼 -->
         <div class="page_wrap">
             <div class="page_nation">
                 <a class="arrow pprev" href="${ path }/myPage/myQnA?page=1">&#60;&#60;</a>
                 <a class="arrow prev" href="${ path }/myPage/myQnA?page=${ pageInfo.prevPage }">&#60;</a>
                 
			   		<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:if test="${ status.current == pageInfo.currentPage }">
							<a href="#" class="active">${ status.current }</a>
						</c:if>
						<c:if test="${ status.current != pageInfo.currentPage }">
							<a href="${ path }/myPage/myQnA?page=${ status.current }">${ status.current }</a>
						</c:if>
					</c:forEach>

                 <a class="arrow next" href="${ path }/myPage/myQnA?page=${ pageInfo.nextPage }">&#62;</a>
                 <a class="arrow nnext" href="${ path }/myPage/myQnA?page=${ pageInfo.maxPage }">&#62;&#62;</a>
             </div>
         </div>

    </div> 

<jsp:include page="/WEB-INF/views/common/footer.jsp" />