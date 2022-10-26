<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="ci">
    <a href="${ path }/">
      <img width="200px" src="${ path }/resources/image/member/the-sum-of11.png">
    </a>
  </div>
  <h1>아이디 찾기</h1>
    <hr>
  <div id="findId-container">     
        <form name="findId_Form" id="findId_form" method="post">
            <table style="margin-left:auto;margin-right:auto;">
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
                        <input type="button" id="checkDuplicateE" value="중복확인" >                      
                    </td>       
                </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
                <tr>
          <th>핸드폰 번호</th>
          <td>
            <input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required>
            <input type="button" id="checkDuplicateP" value="중복확인" >                
          </td>       
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">영문, 한글이 아닌 숫자만 입력해 주세요.</td>
                    
                </tr>
            </table>
          </td>       
                </tr>
            </table>
            <div class="join">
      <input type="button" class="findId_button" id="findId_button" value="아이디 찾기">  
            <input type="reset" value="취소">  
      </div>
    </form>
    </div>
</body>
	<script>
		$(document).ready(function(){
			//회원가입 버튼(회원가입 기능 작동)
			$(".findId_button").click(function(){
				$("#findId_form").attr("action", "${ path }/member/findId");
				$("#findId_form").submit();
						
			});
		});
	</script>
	
</html>