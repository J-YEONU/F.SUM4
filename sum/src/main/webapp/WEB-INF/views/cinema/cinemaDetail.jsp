<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/cinema/cinemaDetail.css">

	    <div class="container">

        <div class="name">
            <h1>${cinemaDetail.cinemaName}</h1>
            <h2>${cinemaDetail.cinemaAddress}</h2>
            <hr>
        </div>
        
        <div id="map" style="width:600px;height:400px; margin:auto; margin-top:10px;">
        </div>

    
        <hr>
        <div class="plot_div">
            <h3><img id="tag" src="${ path }/resources/image/cinema/car.jpg">주차안내</h3>
            <div>${ cinemaDetail.cinemaContent }</div>
        </div>
        <hr>

        <div class="button_area">
            <button onclick="location.href='${ path }/cinema/cinema'" style="width: 116px; height: 36px; background-color: rgb(233, 233, 233); border-radius: 5px; outline: none; border: 0;">목록</button>
        </div>
    </div>
    
		<script src="${ path }/js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef9253c9324411ab650e427187b3f273&libraries=services"></script>
        <script>
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
             mapOption = { 
                 center: new kakao.maps.LatLng("${cinemaDetail.mapX}","${cinemaDetail.mapY}"), // 지도의 중심좌표
                 level: 3 // 지도의 확대 레벨
             };

         var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

         // 마커가 표시될 위치입니다 
         var markerPosition  = new kakao.maps.LatLng("${cinemaDetail.mapX}","${cinemaDetail.mapY}"); 

         // 마커를 생성합니다
         var marker = new kakao.maps.Marker({
             position: markerPosition
         });

         // 마커가 지도 위에 표시되도록 설정합니다
         marker.setMap(map);

         // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
         // marker.setMap(null);
         </script>
         
         
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />