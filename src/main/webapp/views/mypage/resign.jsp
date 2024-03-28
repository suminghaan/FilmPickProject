<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.deleteUser{
      border: 1px solid lightgrey;
		width: 500px;
		height: 350px;
		border-radius: 0.7em;
		color: black;
		margin: auto;
    }
</style>
</head>
<body>

  <main>
    

	<%@ include file="/views/common/header.jsp" %>

    <div class="content_wrap" style="background-color: black; color: black;">
        <div class="content">
        <!-- 탈퇴하기 누르면 나오는 페이지 / 
             비밀번호 입력 받고 탈퇴하기 누르면 정말로 탈퇴할건지 물어보는 alert창 띄우고 확인 누르면 탈퇴 완료되게  -->
            <div class="deleteUser" style="background-color: white; color: black;">
                <div class="container">
                <br>
    
                <form action="<%=contextPath%>/delete.me?memNo=<%= loginMember.getMemNo() %>" method="post" id="deleteUser">
					<img src="<%= contextPath %>/resources/img/logo.png" width="150px" height="50px" id="logo">
					<br><br>
                    <div class="form-group" style="color: black;">
                        <input type="text" class="form-control" id="memid" value="<%=loginMember.getMemId() %>" name="memId" style="width: 400px; background-color:transparent; color: black; margin: auto;" required>
                        <input type="password" class="form-control" name="memPwd" id="memPwd" placeholder="비밀번호를 입력하세요" style="width: 400px; background-color:transparent; color: black; margin: auto;" required>
                        <input type="password" class="form-control" name="memPwdCheck"id="memPwdCheck" placeholder="비밀번호를 다시 입력하세요" style="width: 400px; background-color:transparent; color: black; margin: auto;" required>    
                    </div>
                    <br>
                	<p>본인확인을 위해 비밀번호를 입력하시고 <br>탈퇴 버튼을 누르면 탈퇴가 완료됩니다.</p>
                </div>
        		<div class="buttonArea" style="text-align: center;"> 
                    <button type="submit" class="btn btn-outline-light" style="width: 300px;
                                                                                        --bs-btn-border-color: RGB(247, 39, 140);
                                                                                        --bs-btn-color:RGB(247, 39, 140);
                                                                                        --bs-btn-hover-color: #ffffff;
                                                                                        --bs-btn-hover-bg: RGB(247, 39, 140);
                                                                                        --bs-btn-hover-border-color: #ffffff;">탈퇴하기</button>
				</div>
                    <br>
                    <br>
                    <br>
                </form>
            </div>
        </div>
      </div>
		<script>
			$("#deleteUser").submit(function() {
				event.preventDefault();
				
				var passValidationCheck = false;
				var passCollCheck = false;
				
				
				const regExpPassword = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d@$!%*#?&]{8,15}$/;	  
				if(regExpPassword.test($(".deleteUser input[name=memPwd]").val())){
					passValidationCheck = true;
				}
				
				const memPwd = document.getElementById("memPwd").value;
				const checkPwd = document.getElementById("memPwdCheck").value; 
				if(memPwd == checkPwd){
					passCollCheck = true;	  
				}
				
				if(!passValidationCheck) {
					alert("유효한 비밀번호의 형식이 아닙니다. 다시 입력해주세요");
				}
				
				if(!passCollCheck) {
					alert("비밀번호가 일치하지 않습니다.");
				}
				
				if( passValidationCheck && passCollCheck) {
					this.submit();
				}
			})	
			</script>	
      
    </div>

    <%@ include file="/views/common/footer.jsp" %>


  </main>
  <script src="../../resources/assets/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>