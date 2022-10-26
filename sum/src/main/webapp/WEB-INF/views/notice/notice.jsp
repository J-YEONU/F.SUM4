<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/notice/notice.css?var=1">

    <div class="section">
        <h2>공지사항</h2>
        <p>'SUM'에서 알려드리는 다양한 소식을 만나보세요.</p>

        <hr class="hr1">

        <div class="board_list_wrap">
            <table class="board_list">
                <thead>
                    <tr class="tr1">
                        <td>NO</td>
                        <td>제목</td>
                        <td>등록일</td>
                        <td>조회수</td>
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
	                        <td>${ qna.noticeNo }</td>
	                        <td> <a href="#">${ qna.title }</a> </td>
	                        <td><fmt:formatDate type="date" value="${ qna.createDate }"/></td>
	                        <td> <a href="#">${board.readCount }</a> </td>
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
                 <a class="arrow pprev" href="${ path }/notice?page=1">&#60;&#60;</a>
                 <a class="arrow prev" href="${ path }/notice?page=${ pageInfo.prevPage }">&#60;</a>
                 
			   		<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:if test="${ status.current == pageInfo.currentPage }">
							<a href="#" class="active">${ status.current }</a>
						</c:if>
						<c:if test="${ status.current != pageInfo.currentPage }">
							<a href="${ path }/notice?page=${ status.current }">${ status.current }</a>
						</c:if>
					</c:forEach>

                 <a class="arrow next" href="${ path }/notice?page=${ pageInfo.nextPage }">&#62;</a>
                 <a class="arrow nnext" href="${ path }/notice?page=${ pageInfo.maxPage }">&#62;&#62;</a>
             </div>
         </div>

    </div> 

<jsp:include page="/WEB-INF/views/common/footer.jsp" />