<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${ path }/resources/css/ticketing/seat.css">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section id="tSection">
	<div id="title">영화예매</div>
		<span id="infospan">영화 예매를 순서대로 진행해주세요.</span>
			<div id="info"><img src="${ path }/resources/image/tagbox.png" id="tagbox">
				<span id="step"> 영화 &gt; 좌석 &gt; 결제 3단계로 이루어져 있습니다.</span>
			</div>
		<hr id="hr">
		<div id="tagtitle1"><img src="${ path }/resources/image/tag_gray.png" id="tag"> 영화예매</div>
		<div id="tagtitle2"><img src="${ path }/resources/image/tag.png" id="tag"> 좌석선택</div>
			<div id="bottom">
				<div id="tagdiv1"></div>
				<div id="tagdiv2"></div>
				<div id="tagdiv3"></div>
			</div>
			
	<div id="screen"><img src="${ path }/resources/image/screen.png"></div>
		<div align="center" id="seat">
			<form >		
				&nbsp;&nbsp;
				<% for(char c = 'A' ; c <= 'T' ; c++) { %>
					<small><%=c %></small>&nbsp;&nbsp;
				<% } %>
				
				<br>
				<% for(int i = 1; i <= 6; i++) { %>
					<%=i %>
					<% for(char c = 'A'; c <= 'T' ; c++) { %>
						<input type="checkbox" name="seat" class="check" value="<%=c %>-<%=i %>">
					<% } %>
					<br>
					
					<%= i == 3 ? "<br/>" : "" %>
				<% } %>
			
				<br>
				<input type="submit" value="좌석선택">
				<input type="reset" value="초기화">
			</form>
		</div>
		
	<div id="seatinfo">
		<div><img src="${ path }/resources/image/box_gray.png">예매완료</div>
		<div><img src="${ path }/resources/image/box_choice.png">선택가능</div>
		<div><img src="${ path }/resources/image/box_check.png" id="checkbox">선택좌석</div>
	</div>

	<div id="choice">
		<p>선택하신 좌석 : 
			<p type="text" id="result1">
		</p>
	</div>

	<div id="btn">
		<button type="submit" id="btn1" class="btn" onclick="location.href='${ path }/ticket/ticketing'">
			<p id="p1">PREV STEP</p>
			<p id="p2"><span id="p3"><</span>-------------------------------</p>
			<em id="p2">chosee a movie</em>
		</button>
		<button type="submit" class="btn" onclick="location.href='${ path }/ticket/payment'">
			<p id="p1">NEXT STEP</p>
			<p id="p2">-------------------------------<span id="p3">> </span></p>
			<em id="p2">chosee a payment</em>
		</button>
	</div>
</section>

<script>
	$(document).ready(() => {
		$("#btn1").on("click", () => {
			if(confirm("처음 단계로 돌아가시겠습니까?")) {
				location.replace("${ path }/ticket/ticketing");
			}
		});
	});
</script>

<script>
$(document).ready(() => {
    $('#choice').onclick(function() {
        let value = $('input[type=checkbox][name=seat]:checked').val();

        console.log(value);

        $('#result1').val(value);
    });
});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />