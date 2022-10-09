<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUM 회원가입</title>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="ci">
		<a href="https://www.naver.com/">
			<img width="200px" src="../파이널/이미지/the-sum-of.png">
		</a>
	</div>
	<h1>회원 가입</h1>
    <h2>회원가입에 필요한 정보를 입력해 주세요.</h2>
    <h3 id="required">* 는 필수 입력사항입니다.</h3>
    <hr>
    <h3>정보입력</h3>
	<div id="enroll-container">	 	
        <form name="memberEnrollFrm" action="${ path }/member/enroll" method="post">
            <table style="margin-left:auto;margin-right:auto;">
                <tr>
					<th>
						아이디
						<span class="check">*</span>
					</th>
					<td>
						<input type="text" name="id" id="newId" placeholder="아이디(4글자이상)" required>
						<input type="button" id="checkDuplicate" value="중복검사" >
					</td> 			
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">아이디는 숫자, 소문자만 입력 가능합니다.</td>
                    
                </tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
                <tr>
					<th>
						비밀번호
					</th>
					<td>
						<input type="password" name="password" id="pass1" required>
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
						<input type="text" name="name" id="userName" placeholder="이름을 입력해주세요." required>				
					</td> 			
                </tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
                <tr>
					<th>생년월일</th>
					<td>
						<input type="date" name="birth" id="userbirth" required>				
					</td> 			
                </tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
                <tr>
                    <th>이메일</th>
                    <td>
                        <input type="email" placeholder="abc@abc.com" name="email" id="email" required>												
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
						<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required>								
					</td> 			
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">영문, 한글이 아닌 숫자만 입력해 주세요.</td>
                    
                </tr>
                <tr>
					<td colspan="2">
						<table id="favorite" >
							<tr>
								<th colspan="4">좋아하는 장르를 선택해 주세요.</th>
							</tr>
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<td>
									<label><input type="checkbox" name="genre" id="genre0" value="SF">SF</label>
								</td>
								<td>
									<label><input type="checkbox" name="genre" id="genre1" value="드라마">드라마</label>
								</td>
								<td>
									<label><input type="checkbox" name="genre" id="genre2" value="멜로/로맨스">멜로/로맨스</label>
								</td>
								<td>
									<label><input type="checkbox" name="genre" id="genre3" value="코메디">코메디</label>
								</td>
							</tr>
							<tr>
								<td>
									<label><input type="checkbox" name="genre" id="genre4" value="스릴러">스릴러</label>
								</td>
								<td>
									<label><input type="checkbox" name="genre" id="genre5" value="애니메이션">애니매이션</label>
								</td>
								<td>
									<label><input type="checkbox" name="genre" id="genre6" value="스포츠">스포츠</label>
								</td>
								<td>
									<label><input type="checkbox" name="genre" id="genre7" value="액션">액션</label>
								</td>
							</tr>
						</table>
					</td> 			
                </tr>
            </table>
            <div class="join">
			<input type="submit" id="enrollSubmit" value="회원가입">	
            <input type="reset" value="취소">	
			</div>
		</form>
    </div>

    <script>
		// 아이디 중복 확인
		$(document).ready(() => {
			$("#checkDuplicate").on("click", () => {
				let userId = $("#newId").val().trim();			
				
				$.ajax({
					type: "POST",
					url: "${ path }/member/idCheck",
					dataType: "json",
					data: {
						userId // "userId": userId
					},
					success: (obj) => {
						console.log(obj);
						
						if(obj.duplicate === true) {
							alert("이미 사용중인 아이디 입니다.");
						} else {
							alert("사용 가능한 아이디 입니다.");
						}
					}, 
					error: (error) => {
						console.log(error);
					}
				});
			});
		});
	</script>
</body>
</html>