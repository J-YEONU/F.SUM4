<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/myPage/myBooking.css?var=1">

	<div class="section">
        <h2>마이페이지</h2>
        <p>홍길동님, 오늘도 영화처럼 멋진 하루 되세요!</p>

        <hr class="hr1">

        <div class="nav"> 
            <ul class="nav_ul">
                <li><a href="#">예매확인/취소</a></li>
                <li><a href="#">나의 포인트</a></li>
                <li><a href="#">나의 문의내역</a></li>
                <li><a href="#">나의 한줄평</a></li>
                <li><a href="#">나의 무비로드</a></li>
                <li><a href="#">개인정보수정</a></li>
            </ul>
            <hr>
        </div>

        <div class="board_list_wrap">
            <table class="board_list">
                <thead>
                    <tr class="tr1">
                        <td>NO</td>
                        <td>예매번호</td>
                        <td>영화명/영화관</td>
                        <td>상영일시</td>
                        <td>예매일</td>
                        <td>예매취소</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>A1234</td>
                        <td>탑건/홍대</td>
                        <td>2022-08-23</td>
                        <td>2022-08-23</td>
                        <td>
                            <a class="td_a" href="#">예매취소</a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>A1234</td>
                        <td>탑건/홍대</td>
                        <td>2022-08-23</td>
                        <td>2022-08-23</td>
                        <td>
                            <a class="td_a" href="#">예매취소</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <div class="page_wrap">
            <div class="page_nation">
                <a class="arrow pprev" href="#">&#60;&#60;</a>
                <a class="arrow prev" href="#">&#60;</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a class="arrow next" href="#">&#62;</a>
                <a class="arrow nnext" href="#">&#62;&#62;</a>
            </div>
        </div>

    </div> 

<jsp:include page="/WEB-INF/views/common/footer.jsp" />