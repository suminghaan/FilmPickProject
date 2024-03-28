<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>   
<%
ArrayList<String> prefGenre = (ArrayList<String>)request.getAttribute("prefGenre");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.signup_content{
		border: 1px solid lightgray;
		background-color: white;
		width: 580px;
		margin: auto;
		margin-top: 50px;
		margin-bottom: 50px;
		min-height: 400px;
		padding: 5px;
		border-radius: 0.7em;
	}
    .signup_content th, .signup_content td{
		vertical-align: middle;
    }
    .form-control{
		width: 400px;
    }
</style>
</head>
<body>

	<main>
    
    <%@ include file="/views/common/header.jsp" %>

    <div class="content_wrap" style="background-color: black;">
		<div class="content">
			<section class="main_content">
			<div class="signup_content">
			<h2>회원가입</h2>
			<form action="<%= contextPath %>/insert.me" method="post" class="signUpForm">
			<table class="table">
				<tr>
					<td>
						<input type="text" class="form-control" name="memId" id="memId" placeholder="* 아이디" required>
					</td>
					<td>
						<button type="button" class="btn btn-outline-light" onclick="idCheck();"
								style="width: 130px; 
									 --bs-btn-border-color: RGB(247, 39, 140);
									 --bs-btn-color:RGB(247, 39, 140);
									 --bs-btn-hover-color: #ffffff;
									 --bs-btn-hover-bg: RGB(247, 39, 140);
									 --bs-btn-hover-border-color: #ffffff;">중복확인</button>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" class="form-control" name="memPwd" id="memPwd" placeholder="* 비밀번호(영문, 숫자, 특수문자 포함 8~15글자)" style="font-size: smaller;" required>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" class="form-control" name="checkPwd" id="checkPwd" placeholder="* 비밀번호 확인(영문, 숫자, 특수문자 포함 8~15글자)" required>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						<input type="email" class="form-control" name="memEmail" placeholder="* 이메일주소" required>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" class="form-control" name="nickname" placeholder="* 닉네임" required>
					</td>
					<td>
						<button type="button" class="btn btn-outline-light" onclick="nicknameCheck();" 
								style="width: 130px;
									 --bs-btn-border-color: RGB(247, 39, 140);
									 --bs-btn-color:RGB(247, 39, 140);
									 --bs-btn-hover-color: #ffffff;
									 --bs-btn-hover-bg: RGB(247, 39, 140);
									 --bs-btn-hover-border-color: #ffffff;">중복확인</button>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" class="form-control" name="memName" placeholder="* 이름" required>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" class="form-control" name="memBirth" id="memBirth" placeholder="* 생년월일 (ex. 010101)" required>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>&nbsp;
						<input type="radio" name="memGender" id="memGenderM" value="M" required>
						<label for="radioM">&nbsp;남자</label>
						<input type="radio" name="memGender" id="memGenderF" value="F" required>
						<label for="radioF">&nbsp;여자</label>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" class="form-control" name="memPhone" id="memPhone" placeholder="* 휴대전화번호(-제외)" required>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						<select name="prefGenre" id="prefGenre" required>
							<option value="">* 선호장르</option>
							<%for(int i=0; i<prefGenre.size(); i++){ %>
							<option value="<%=prefGenre.get(i)%>"><%=prefGenre.get(i)%></option>
							<%} %>
						</select>
					</td>
					<td>
					</td>
				</tr>
			</table>
                  
				<button type="submit" class="btn btn-outline-light" id="signupButton"
						style="width: 350px;
							 --bs-btn-border-color: RGB(247, 39, 140);
							 --bs-btn-color:RGB(247, 39, 140);
							 --bs-btn-hover-color: #ffffff;
							 --bs-btn-hover-bg: RGB(247, 39, 140);
							 --bs-btn-hover-border-color: #ffffff;" disabled>가입하기</button>
			</form>    
              

		<script>
		function idCheck(){
			
		// 아이디 유효성검사
		const regExp = /^[a-z0-9]{5,12}$/;
			if(!regExp.test($(".signup_content input[name=memId]").val())){
				alert("유효한 아이디의 형식이 아닙니다. 다시 입력해주세요");
				document.getElementById("memId").select();
				return false;
		}
	            
		// 아이디 중복확인
		const $idInput = $(".signup_content input[name=memId]");
		$.ajax({
			url:"<%=contextPath%>/idCheck.me",
			data:{checkId: $idInput.val()},				
			success: function(result){
	              				
						if(result == "NNNNN"){
							// 사용불가능(NNNNN)
							alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
							$idInput.focus();
						}else{
							// 사용가능(NNNNY)
							if(confirm("사용가능한 아이디입니다. 사용하시겠습니까? : ")){
								// 회원가입 버튼 활성화
								//$(".signup_content :submit").removeAttr("disabled");
								// 아이디 입력하는 input요소 수정불가능한 속성 추가
								$idInput.attr("readonly", true);
							}else{
								$idInput.select();
							}
						}
					},
			error: function(){
						console.log("아이디 중복체크용 ajax 통신 실패")
					}
			})            		
		}          
		</script>
                 
                 
		<script>
		// 닉네임 중복확인
		function nicknameCheck(){

			const $nicknameInput = $(".signup_content input[name=nickname]");
			$.ajax({
				url:"<%=contextPath%>/nicknameCheck.me",
				data:{checkNickname: $nicknameInput.val()},
				method:"post",
				success: function(result){
	              				
							if(result == "NNNNN"){
							// 사용불가능(NNNNN)
							alert("이미 존재하는 닉네임입니다.");
							$nicknameInput.focus();
							}else{
							// 사용가능(NNNNY)
								if(confirm("사용가능한 닉네임입니다. 사용하시겠습니까?")){
									// 회원가입 버튼 활성화
									$(".signup_content :submit").removeAttr("disabled");
									// 닉네임 입력하는 input요소 수정불가능한 속성 추가
									$nicknameInput.attr("readonly", true);
								}else{
									$nicknameInput.select();
								}
							}
				},
				error: function(){
							console.log("닉네임 중복체크용 ajax 통신 실패")
						}
			})            		
		}          
		</script>
			
			
		<script>

		
		$(".signUpForm").submit(function(event) {
			
			event.preventDefault();
			
			var passValidationCheck = false;
			var passCollCheck = false;
			var phoneValidationCheck = false;
			var birthValidationCheck = false;
			
			// 비밀번호
			const regExpPassword = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d@$!%*#?&]{8,15}$/;	  
			if(regExpPassword.test($(".signup_content input[name=memPwd]").val())){
				passValidationCheck = true;
			}
			
			const memPwd = document.getElementById("memPwd").value;
			const checkPwd = document.getElementById("checkPwd").value; 
			if(memPwd == checkPwd){
				passCollCheck = true;	  
			}
			
			// 생년월일
			const regExpBirth = /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/; // YYMMDD 형식의 유효한 날짜
    		if (regExpBirth.test($(".signup_content input[name=memBirth]").val())) {
				phoneValidationCheck = true;
    		}
			
			//전화번호 유효성 검사
			const regExpPhone = /^010[2-9][0-9]{7}$/;
			if(regExpPhone.test($(".signup_content input[name=memPhone]").val())){
				birthValidationCheck = true;
			}
			
			if(!passValidationCheck) {
				alert("유효한 비밀번호의 형식이 아닙니다. 다시 입력해주세요");
			}
			
			if(!passCollCheck) {
				alert("비밀번호가 일치하지 않습니다.");
			}
			
			if(!phoneValidationCheck) {
				alert("유효한 생년월일 형식이 아니거나 유효하지 않은 날짜입니다. 다시 입력해주세요.");
			}

			if(!birthValidationCheck) {
				alert("유효한 휴대전화번호 형식이 아닙니다. 다시 입력해주세요");
			}
			
			if( passValidationCheck && passCollCheck && phoneValidationCheck && birthValidationCheck) {
				this.submit();
			}
			
			
		})
		</script>
   		
   		
		</div>
		</section>
		</div>              
		</div> 

 </div>        
</div>


	<%@ include file="/views/common/footer.jsp" %>
    </div>


</body>
</html>