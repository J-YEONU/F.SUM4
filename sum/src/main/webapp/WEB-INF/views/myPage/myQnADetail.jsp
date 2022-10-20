<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/myPage/myQn.css?var=1">

    <div class="section">
        <h2>나의 문의내역</h2>
        <p>1:1 문의에 남겨주시는 글들은 순차적으로 답변을 진행하고 있습니다.</p>

        <hr class="hr1">

        <div class="board_list_wrap">
            <table class="board_list">
                <thead>
                    <div id="member-main-container" class="">
                        <div class="container" style="border: 1px solid">
                            <div class="row">
                </thead>
                <tbody>
                    <c:forEach var="qna" items="${ list }">
                        <div class="col-2">
                            제목
                        </div>
                        <div class="col-4">
                            <td> <a href="#">${ qna.title }</a> </td>
                        </div>
                        <div class="col-2">
                            작성일
                        </div>
                        <div class="col-4">
                            <td><fmt:formatDate type="date" value="${ qna.createDate }"/></td>
                        </div>
                        <div class="col-2">
                            답변상태
                        </div>
                        <div class="col-4">
                            <c:choose>
                                <c:when test="${ qna.answerStatus == 'Y'.charAt(0) }">
                                    <td>진행중</td>
                                </c:when>
                                <c:when test="${ qna.answerStatus == 'N'.charAt(0) }">
                                    <td class="td4">답변완료</td>
                                </c:when>
                            </c:choose>
                        </div>
                    </c:forEach>
                        
                </div>
                <div>
                </div>
                
                <div class="btnzone">
                    <button type="submit" class="btn btn-warning"> 수정 </button>
                    <button type="reset" class="btn btn-light"> 삭제 </button>
                    <button type="reset" class="btn btn-light"> 목록 </button>
                </div>
		</div>
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