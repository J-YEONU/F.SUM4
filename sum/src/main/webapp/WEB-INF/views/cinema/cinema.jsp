<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${ path }/resources/css/cinema/cinema.css">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section id="cinemaSection">
   <div id="title">영화관</div>
      <span id="infospan">내 집같은 편안함, 영화관의 새로운 표준을 제시합니다.</span>
          <hr id="hr">
      <div><img src="${ path }/resources/image/cinema.png"></div>

      <div id="tagtitle"><img src="${ path }/resources/image/tag.png" id="tag"> 영화관 선택</div>

   <nav>
      <ul id="navi">
         <li><a href="#">서울</a></li>
         <li><a href="#">경기</a></li>
         <li><a href="#">인천</a></li>
         <li><a href="#">강원</a></li>
         <li><a href="#">대전/충청</a></li>
      </ul>
   </nav>

   <div class="cinema">
      <div class="cinemaInfo">
         <span><img src="${ path }/resources/image/cinema/cinema1.jpg"></span>   
         <strong class="cInfo">강남</strong>
      </div>
      <div class="cinemaInfo">
         <span><img src="${ path }/resources/image/cinema/cinema2.jpg"></span>   
         <strong class="cInfo">코엑스</strong>
      </div>
      <div class="cinemaInfo">
         <span><img src="${ path }/resources/image/cinema/cinema3.jpg"></span>   
         <strong class="cInfo">분당</strong>
      </div>
      <div class="cinemaInfo">
         <span><img src="${ path }/resources/image/cinema/cinema4.jpg"></span>   
         <strong class="cInfo">일산</strong>
      </div>
      <div class="cinemaInfo">
         <span><img src="${ path }/resources/image/cinema/cinema5.png"></span>   
         <strong class="cInfo">인천아시아드</strong>
      </div>
      <div class="cinemaInfo">
         <span><img src="${ path }/resources/image/cinema/cinema6.jpg"></span>   
         <strong class="cInfo">인천터미널</strong>
      </div>
   </div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />