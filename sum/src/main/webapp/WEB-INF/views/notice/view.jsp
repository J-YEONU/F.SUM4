<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/myPage/myQnA.css?var=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="${ path }/resources/css/admin/styles.css">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

    <div class="section">
        <h2>공지사항</h2>
        <p>'SUM'에서 알려드리는 다양한 소식을 만나보세요.</p>

        <hr class="hr1">

        <div class="board_list_wrap">
            <table class="board_list">
                <thead>
                    <tr class="tr1">
                        <td>제목</td>
                        <td class="whiteTd">${ notice.title }</td>
                        <td>작성일</td>
                        <td class="whiteTd"><fmt:formatDate type="date" value="${ notice.createDate }"/></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="4">
		                    <c:if test="${not empty notice.renamedImg }">
		                    <div id="cimg">
		                    <img alt="??" src="${path }/resources//image/notice/${notice.renamedImg}" style="width: 300px">
		                    </div>
		                    </c:if>
                    	${ notice.content }</td>
                    </tr>

                </tbody>
            </table>
        </div>

        <div class="btnzone">
 			<button type="button" class="btn btn-warning btnsize" onclick="location.href='${ path }/notice'"
 				style=" width: 129px; margin-top: 50px; "> 목록으로 </button>
       </div>  

    </div> 

<jsp:include page="/WEB-INF/views/common/footer.jsp" />