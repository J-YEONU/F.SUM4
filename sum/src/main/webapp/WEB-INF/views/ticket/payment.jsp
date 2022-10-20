<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${ path }/resources/css/ticketing/payment.css">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section id="tSection">
	<div id="title">영화예매</div>
		<span id="infospan">영화 예매를 순서대로 진행해주세요.</span>
			<div id="info"><img src="${ path }/resources/image/ticketing/tagbox.png" id="tagbox">
				<span id="step"> 영화 &gt; 좌석 &gt; 결제 3단계로 이루어져 있습니다.</span>
			</div>
	<hr id="hr">
	<div id="tagtitle1"><img src="${ path }/resources/image/ticketing/tag_gray.png" id="tag"> 영화예매</div>
	<div id="tagtitle2"><img src="${ path }/resources/image/ticketing/tag_gray.png" id="tag"> 좌석선택</div>
	<div id="tagtitle3"><img src="${ path }/resources/image/ticketing/tag.png" id="tag"> 결제</div>
		<div id="bottom">
			<div id="tagdiv1"></div>
			<div id="tagdiv2"></div>
			<div id="tagdiv3"></div>
		</div>

	<div id="subtitle"><img src="${ path }/resources/image/ticketing/tag.png" id="tag"> 할인 정보</div>
	<span id="infospan"><img src="${ path }/resources/image/ticketing/mark.png" id="mark"> 포인트 사용시 결제금액에서 할인 됩니다.</span>
	<hr id="hr">

	<!-- JavaScript 사용할 것 !!!@@@@@@@@-->
	<div id="saletag">
    	<table class="tbl_edit01">
			<colgroup>
				<col width="90px"/>
				<col width="*"   />
			</colgroup>
		<tbody>
			<tr>
				<th> 포인트 </th>
				<td>
					사용가능 포인트 :
					<span name="left_pnt"></span>10000 p <span>
						<input type="checkbox" id="chk_use" onclick=""> 포인트 전부 사용</span>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<span>
						<input type="image" src="${ path }/resources/image/ticketing/sigma_ico.png" 
							align="absmiddle" id="sigma"><input type="number" name="use_pnt" id="" min="" max="" onchange="changePoint()"></span> p 
						<span id="left_pnt"> ( 남은포인트 : </span><span name="left_pnt" id=""></span>p )
				</td>
			</tr>
		</tbody>
		</table>

	<div id="subtitle"><img src="${ path }/resources/image/ticketing/tag.png" id="tag"> 결제 금액</div>
	</div>

	<hr id="hr">

	<div id="paymenttag">    
		<div>티켓 수량 : <span id="ticket"> 11 </span></div>
		<div>할인 가격 : <span> </span></div>
		<div>최종 결제 금액 : <span id="payment"> &#8361; 500,000</span></div>
	</div>

	<div id="btn">
		<button type="submit" class="btn1" onclick="location.href='${ path }/ticket/approve'" id="final-submit">결제</button>
		<button type="submit" class="btn2">취소</button>
	</div>
</section>

<script>
	$(document).ready(() => {
		$(".btn2").on("click", () => {
			if(confirm("이전 단계로 돌아가시겠습니까?")) {
				location.replace("${ path }/ticket/seat");
			}
		});
	});
</script>

<!-- iamport 테스트 결제 스크립트(카카오) -->
<script type="text/javascript">
// 카카오 결제 API
var IMP = window.IMP; // 생략가능
IMP.init('imp77222550'); // 부여받은 가맹점 식별코드
// IMP.request_pay(param, callback) 결제창 호출
IMP.request_pay ({
	pg : 'kakaopay', // pg사 선택 (kakao, kakaopay 가능)
	pay_method: 'card',
	merchant_uid : 'merchant_' + new Date().getTime(), // 주문번호
	name : 'MovieTicket', // 상품명 (영화 티켓)
	amount : amount,
	// customer_uid 파라미터가 있어야 빌링키 발급 시도
	customer_uid : buyer_name + new Date().getTime(),
	buyer_email : email,
	buyer_name : buyer_name,
	buyer_tel : hp,
	buyer_addr : addr,
}, function(rsp) { /callback
	if ( rsp.success ) {
		console.log('빌링키 발급 성공', rsp)
		// 빌링키 발급이 완료되었으므로, 서버에 결제 요청
		alert('예약 결제가 완료되었습니다.');
	} else {
		var msg = '결제에 실패하였습니다.\n';
		msg += rsp.error_msg;
		alert(msg);
		return false;
	}
	$("#final-submit").submit();
});


</script>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" />