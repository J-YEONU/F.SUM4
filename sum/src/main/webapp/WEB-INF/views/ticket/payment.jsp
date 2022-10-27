<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

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
		<button type="submit" class="btn1" id="final-submit">결제</button>
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
<!-- pay js -->
<script type="text/javascript">

	var pay = '영화표';
	console.log(pay);
	
	var IMP = window.IMP;
	IMP.init('imp77222550');
	
	$("#final-submit").click(function(e){
	//결제요청
	IMP.request_pay({
	    pg : 'kakaopay', // pg사 선택 (kakao, kakaopay)
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 10000, //판매 가격
	    buyer_email : '4sum@sum.com',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
});
		});

</script>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" />