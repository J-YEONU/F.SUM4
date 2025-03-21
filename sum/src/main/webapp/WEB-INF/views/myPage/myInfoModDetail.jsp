<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${ path }/resources/css/member/enroll.css">
<meta charset="UTF-8">
<title>SUM 회원정보 수정</title>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="ci">
		<a href="${ path }/">
			<img width="200px" src="${ path }/resources/image/member/the-sum-of11.png">
		</a>
	</div>
	<h1>회원 정보 수정</h1>

    <hr>
    <h3>정보 수정</h3>
	<div id="enroll-container">	 	
        <form id="updateForm"  method="post">
            <table style="margin-left:auto;margin-right:auto;">
                <tr>
					<th>
						비밀번호 변경
					</th>
					<td>
						<input type="password" name="password" id="pass1">
					</td> 			
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">비밀번호는 영문 소문자, 숫자가 조합된 8자리 이상 12자리 이하만 입력 바랍니다.</td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">다른곳에서 사용중이지 않고, 공유성이 없는 비밀번호로 가입해주세요.</td>
                </tr>
                <tr>
					<th>비밀번호확인</th>
					<td>
						<input type="password" id="pass2">
					</td> 			
                </tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
                <tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" id="userName" placeholder="이름을 입력해주세요." value="${ loginMember.name }">				
					</td> 			
                </tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
                <tr>
					<th>생년월일</th>
					<td>
						<input type="date" name="birth" id="userbirth" value="${ loginMember.birth }">				
					</td> 			
                </tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
                <tr>
                    <th>이메일</th>
                    <td>
                        <input type="email" placeholder="abc@abc.com" name="email" id="email" value="${ loginMember.email }">
                        <input type="button" id="checkDuplicateE" value="중복확인" >											
                    </td> 			 
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">가입완료를 위한 이메일 인증이 진행되오니 정확한 이메일 주소를 입력해주시기 바랍니다.</td>
                    
                </tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
                <tr>
					<th>핸드폰 번호</th>
					<td>
						<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" value="${ loginMember.phone }">
						<input type="button" id="checkDuplicateP" value="중복확인" >								
					</td> 			
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">영문, 한글이 아닌 숫자만 입력해 주세요.</td>
                    
                </tr>
                <tr>
					<td colspan="2">
						<table id="favorite">
							<tr>
								<th colspan="4">좋아하는 장르를 선택해 주세요.</th>
							</tr>
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<td>
									<label><input type="checkbox" name="genre" id="genre0" value="SF"
											${ fn:contains(loginMember.genre, 'SF') ? 'checked' : '' }>SF</label>
								</td>
								<td>
									<label><input type="checkbox" name="genre" id="genre1" value="드라마"
											${ fn:contains(loginMember.genre, '드라마') ? 'checked' : '' }>드라마</label>
								</td>
								<td>
									<label><input type="checkbox" name="genre" id="genre2" value="멜로/로맨스"
											${ fn:contains(loginMember.genre, '멜로/로맨스') ? 'checked' : '' }>멜로/로맨스</label>
								</td>
								<td>
									<label><input type="checkbox" name="genre" id="genre3" value="코메디"
											${ fn:contains(loginMember.genre, '코메디') ? 'checked' : '' }>코메디</label>
								</td>
							</tr>
							<tr>
								<td>
									<label><input type="checkbox" name="genre" id="genre4" value="스릴러"
											${ fn:contains(loginMember.genre, '스릴러') ? 'checked' : '' }>스릴러</label>
								</td>
								<td>
									<label><input type="checkbox" name="genre" id="genre5" value="애니메이션"
											${ fn:contains(loginMember.genre, '애니매이션') ? 'checked' : '' }>애니매이션</label>
								</td>
								<td>
									<label><input type="checkbox" name="genre" id="genre6" value="스포츠"
											${ fn:contains(loginMember.genre, '스포츠') ? 'checked' : '' }>스포츠</label>
								</td>
								<td>
									<label><input type="checkbox" name="genre" id="genre7" value="액션"
											${ fn:contains(loginMember.genre, '액션') ? 'checked' : '' }>액션</label>
								</td>
							</tr>
						</table>
					</td> 			
                </tr>
            </table>
            <div class="join">
			<input type="button" class="join_button" id="enrollSubmit" value="수정">	
            <input type="button" id="btnDelete" value="탈퇴">	
			</div>
		</form>
    </div>

 	<script>
		$(document).ready(() => {
			$("#btnDelete").on("click", () => {
				if(confirm("정말로 탈퇴하시겠습니까?")) {
					location.replace("${ path }/member/delete");
				}			
			});
		});
	</script>
	
	<script>
		// 이메일 중복 확인
		$(document).ready(() => {
			$("#checkDuplicateE").on("click", () => {
				let userEmail = $("#email").val().trim();			
				
				$.ajax({
					type: "POST",
					url: "${ path }/member/emailCheck1",
					dataType: "json",
					data: {
						userEmail // "userEmail": userEmail
					},
					success: (obj) => {
						console.log(obj);
						
						if(obj.duplicate === true) {
							if(obj.dupLoginM === true){
								// 로그인멤버랑 같으면 사용가능 이메일
								$('#checkDuplicateE').attr('value','검사완료');	
							}else {	
								// 로그인멤버랑 다르면 이미 사용중인 이메일
								alert("이미 사용중인 이메일 입니다.");
							}							
						} else {
							$('#checkDuplicateE').attr('value','검사완료');
							
							alert("사용 가능한 이메일 입니다.");
						}
					}, 
					error: (error) => {
						console.log(error);
					}
				});
			});
		});
	</script>
	
	<script>
		// 전화번호 중복 확인
		$(document).ready(() => {
			$("#checkDuplicateP").on("click", () => {
				let userPhone = $("#phone").val().trim();			
				
				$.ajax({
					type: "POST",
					url: "${ path }/member/phoneCheck1",
					dataType: "json",
					data: {
						userPhone
					},
					success: (obj) => {
						console.log(obj);
						
						if(obj.duplicate === true) {
							if(obj.dupLoginMP){
								// 로그인 멤버랑 같으면 사용가능 폰번호
								$('#checkDuplicateP').attr('value','검사완료');
							}else{
								// 로그인 멤버랑 다르면 이미 사용중인 폰번호							
								alert("이미 사용중인 전화번호 입니다.");
							}
						} else {
							$('#checkDuplicateP').attr('value','검사완료');
							
							alert("사용 가능한 전화번호 입니다.");
						}
					}, 
					error: (error) => {
						console.log(error);
					}
				});
			});
		});
	</script>
	
	<script>
	// 폰에 숫자만 넣기
	$("#phone").on("keyup", function() {
		$("#phone").val($("#phone").val().replace(/[^0-9]/g,""));
	});
	
	</script>
	<script>
		$(document).ready(function(){
			$('#email').keyup(function(){
				$('#checkDuplicateE').attr('value','중복확인');
			});
		});
	</script>
	<script>
		$(document).ready(function(){
			$('#phone').keyup(function(){
				$('#checkDuplicateP').attr('value','중복확인');
			});
		});
	</script>
 	<script>
		$(document).ready(function(){
			//회원가입 버튼(회원가입 기능 작동)
			$(".join_button").click(function(){
				if($("#pass1").val() == $("#pass2").val()) {
					if($("#checkDuplicateE").val() == "검사완료"){
						if($("#checkDuplicateP").val() == "검사완료"){
						//마지막에 이 아래를 작동시키면 회원가입 내용이 전송된다. 
							$("#updateForm").attr("action", "${ path }/member/update");
							$("#updateForm").submit();
						}else{
							alert("핸드폰 번호 중복검사를 해주세요.")
						}					
					}else{
						alert("이메일 중복검사를 해주세요.")
					}
				}else{
					alert("비밀번호가 일치하지 않습니다.")
				}	
			});
		});
	</script>
</body>
</html>