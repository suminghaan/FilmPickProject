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
	.mypage{
		border: 1px solid lightgray;
		background-color: white;
		color: black;
		width: 800px;
		height:800px;
		margin: auto;
		margin-top: 50px;
		margin-bottom: 50px;
		min-height: 400px;
		padding: 50px; 
		border-radius: 0.7em;
    }
    .mypage_header{
		height: 200px;
		display: flex;
    }
    .mypage_header1, .mypage_header4{
		width: 20%;
    }
    .mypage_header2, .mypage_header3{
      width: 30%;
      margin: auto;
    }
    .mypage_profile_pic{
		width: 150px;
		height: 150px;
		border: 2px solid;
		border-radius: 10.0em;
		overflow: hidden;
		margin: auto;
    }
    .profile_thumbnail{
		width: 100%;
		height: 100%;
		object-fit: cover;
    }
    
    .mypage_content{
		height: 500px;
    }
    .mypage_footer{
		height: 100px;
    }
    .btn btn-outline-light{
		height: 30px;
		width: 130px;
		margin: auto;
	}						
</style>
</head>
<body>

	<main>
  
    <%@ include file="/views/common/header.jsp" %>

    <div class="content_wrap" style="background-color: black;">
		<div class="content">
		<section class="main_content">
			<div class="mypage">
			<h2>회원정보</h2>
  			<div class="mypage_content">
			<!-- 회원정보 -->
			<form action="<%= contextPath %>/update.me" method="post" >
			<!-- 닉네임, 등급, 프로필사진 수정 -->
			<div class="mypage_header">
				<div class="mypage_header1"></div>     
				<div class="mypage_header2" id="mypage_header2">
					<div class="mypage_profile_pic" id="myPageProfilePic" style="display: flex; align-items: center; justify-content: center; color:<%=loginMember.getMemColor()%>">
						<i class="fa-solid fa-user fa-4x" id="myPageProfile" style="color: <%=loginMember.getMemColor()%>; display: block;"></i>
					</div>
				</div>
				<div class="mypage_header3">
				<h6>Level.<%=loginMember.getMemLevel()%></h6>
				<h2><%=loginMember.getNickname()%></h2>
				<div id="btnWrap1">
					<div id="btnWrap2" style="display: flex">
						<input type="color" name="memColor" id="selectColor" style="width: 50px; height: 30px;" value="<%= loginMember.getMemColor() %>">
						<button type="button" style="background-color:RGB(235, 235, 235); color: black; border:none; width: 150px; height: 30px; border-radius:10px;" onclick="changeColor();">프로필색 변경</button>			
					</div>					
				</div>
				<script>
				function changeColor(){
					document.getElementById("myPageProfilePic").style.color=document.getElementById("selectColor").value;
					document.getElementById("myPageProfile").style.color=document.getElementById("selectColor").value;
				}
				</script>
				</div>
				<div class="mypage_header4"></div>         
			</div>
		
					<table class="table">
						<tr>
						<th></th>
						<td></td>
						</tr>
						<tr>
							<th>* 아이디</th>
							<td><input type="text" class="form-control" placeholder="아이디를 입력하세요" name="memId" value="<%=loginMember.getMemId()%>"readonly></td>
						</tr>
						<tr>
							<th>* 이름</th>
							<td><input type="text" class="form-control" placeholder="이름을 입력하세요" name="memName" value="<%=loginMember.getMemName()%>" required></td>
						</tr>
						<tr>
							<th>* 닉네임</th>
							<td><input type="text" class="form-control" placeholder="닉네임을 입력하세요" name="nickname" value="<%=loginMember.getNickname()%>" required></td>
						</tr>
						<tr>
							<th>* 비밀번호</th>
							<td><input type="password" class="form-control" placeholder="특수문자 포함 8~15자리 비밀번호를 입력하세요" name="memPwd" value="<%=loginMember.getMemPwd()%>" readonly></td>
						</tr> 
						<tr>
							<th>* 휴대전화번호</th>
							<td><input type="text" class="form-control" placeholder="휴대전화번호를 입력하세요(-제외)" name="memPhone" value="<%=loginMember.getMemPhone()%>" required></td>
						</tr>
						<tr>
							<th>* 이메일</th>
							<td><input type="email" class="form-control" placeholder="이메일을 입력하세요(@포함)" name="memEmail" value="<%=loginMember.getMemEmail()%>" required></td>
						</tr>
				  
						<tr>
							<th>* 선호장르</th>
							<td>
							<select name="prefGenre" id="prefGenre" required>
							<option value=""></option>
							<%for(int i=0; i<prefGenre.size(); i++){ %>
							<option value="<%=prefGenre.get(i)%>" <%= loginMember.getPrefGenre() != null ? (loginMember.getPrefGenre().equals(prefGenre.get(i)) ? "selected" : "") : ""%>><%=prefGenre.get(i)%></option>
							<%} %>
							</select>
							</td>
						</tr>
					</table>
			  
			  
					<div class="mypage_footer" style="display: flex; justify-content: center;">

						<button type="submit" class="btn btn-outline-light" style="width: 130px; height: 30px; margin: auto;
																						--bs-btn-border-color: RGB(247, 39, 140);
																						--bs-btn-color:RGB(247, 39, 140);
																						--bs-btn-hover-color: RGB(247, 39, 140);
																						--bs-btn-hover-bg: #ffffff;
																						--bs-btn-hover-border-color: RGB(247, 39, 140);">정보변경</button>
																						
																						
						<button type="button" class="btn btn-outline-light" data-toggle="modal"data-target="#changePwdModal"
																						  style="width: 130px; height: 30px; margin: auto;
																						--bs-btn-border-color: RGB(247, 39, 140);
																						--bs-btn-color:RGB(247, 39, 140);
																						--bs-btn-hover-color: RGB(247, 39, 140);
																						--bs-btn-hover-bg: #ffffff;
																						--bs-btn-hover-border-color: RGB(247, 39, 140);">비밀번호 변경</button>																
						
						
						
						<button type="reset" class="btn btn-outline-light" style="width: 130px; height: 30px; margin: auto;
																						--bs-btn-border-color: RGB(247, 39, 140);
																						--bs-btn-color:RGB(247, 39, 140);
																						--bs-btn-hover-color: RGB(247, 39, 140);
																						--bs-btn-hover-bg: #ffffff;
																						--bs-btn-hover-border-color: RGB(247, 39, 140);">초기화</button>
						
						<button type="button" class="btn btn-outline-light" id="newPwdCheck" onclick="deleteMember()"
																						  style="width: 130px; height: 30px; margin: auto;
																						--bs-btn-border-color: RGB(247, 39, 140);
																						--bs-btn-color:RGB(247, 39, 140);
																						--bs-btn-hover-color: RGB(247, 39, 140);
																						--bs-btn-hover-bg: #ffffff;
																						--bs-btn-hover-border-color: RGB(247, 39, 140);">회원탈퇴</button>
						
					</div>
				</form>	
					<script>
					function deleteMember() {
						location.href="<%=contextPath%>/deleteForm.me";
					}       
					</script>
			</div>	
			</div>
		</section>
      
      
		<!-- 비밀번호 변경용 모달창 -->
		<div class="modal" id="changePwdModal">
	  	<div class="modal-dialog">
	  	<div class="modal-content" style="color:black">
	  	
			<!-- Modal Header -->
	  		<div class="modal-header">
	  		<h5 class="modal-title">비밀번호 변경</h5>
	  		<button type="button" class="close" data-dismiss="modal" style="background-color:white; border:none;">&times;</button>
	  		</div>
	  		
	  		<!-- Modal Body -->
	  		<div class="modal-body">
	  			<form action="<%=contextPath%>/updatePwd.me" method="post" id="updatePwd">
	  				<input type="hidden" name="userId" value="<%=loginMember.getMemId()%>">
					<table align="center">
	  					<tr>
	  						<th style="width: 200px;">* 현재 비밀번호</th>
	  						<td><input type="password" class="form-control" name="memPwd" id="memPwd""></td>
	  					</tr>
	  					<tr>
	  						<th style="width: 200px;">* 변경할 비밀번호</th>
	  						<td><input type="password" class="form-control" name="newPwd" id="newPwd" ></td>
	  					</tr>
	  					<tr>
	  						<th style="width: 200px;">* 변경할 비밀번호 재입력</th>
	  						<td><input type="password" class="form-control" name="checkNewPwd" id="checkNewPwd"></td>
	  					</tr>
	  					<tr>
	  						<td colspan="3" style="text-align:center; padding-top: 10px;">
	  							<button type="submit" class="btn btn-outline-light" id="newPwdCheck" style="width: 150px; height: 40px; margin: auto;
																						--bs-btn-border-color: RGB(247, 39, 140);
																						--bs-btn-color:RGB(247, 39, 140);
																						--bs-btn-hover-color: RGB(247, 39, 140);
																						--bs-btn-hover-bg: #ffffff;
																						--bs-btn-hover-border-color: RGB(247, 39, 140);">비밀번호 변경</button>
	  						</td>
						</tr>
					</table>
				</form>
			</div>  
			<script>
			$("#updatePwd").submit(function() {
				event.preventDefault();
				
				var passValidationCheck = false;
				var passCollCheck = false;
				
				
				const regExpPassword = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d@$!%*#?&]{8,15}$/;	  
				if(regExpPassword.test($(".modal-content input[name=newPwd]").val())){
					passValidationCheck = true;
				}
				
				const memPwd = document.getElementById("newPwd").value;
				const checkPwd = document.getElementById("checkNewPwd").value; 
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
		</div>
		</div>
      
		</div>
	</div>

    <%@ include file="/views/common/footer.jsp" %>

  </main>

</body>
</html>