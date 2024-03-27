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
    .btn{
      height: 50px;
      margin-top: auto;
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
				<for action="<%= contextPath %>/update.me" method="post" enctype="multipart/form-data" >
			<!-- 프로필사진, 닉네임, 등급, 프로필사진 수정 -->
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
						<button type="button" style="width: 150px; height: 30px;" onclick="changeColor();">프로필색 변경</button>
						<input type="color" name="memColor" id="selectColor" style="width: 50px; height: 30px;">
					</div>
					<input type="file" name="memImgPath" id="input-file" accept="image/*" onchange="loadFile(this)">
					
					<script>
					function loadFile(input) {
						let file = input.files[0]; // 선택한 파일 가져오기
        
						if (file) {
							// 파일이 선택된 경우
							$("#myPageProfile").css("display", "none"); // 프로필 아이콘 숨기기
							$("#myPageProfilePic").css("color", "black"); // 프로필 아이콘 색상 검정색으로 변경하기
            
							let newImage = document.createElement("img"); // 새 이미지 태그 생성
            
							// 이미지 소스 가져오기
				            newImage.src = URL.createObjectURL(file);
				            newImage.style.width = "100%"; // div에 꽉 차게 넣기
				            newImage.style.height = "100%";
				            newImage.style.objectFit = "cover"; // div에 맞추어 이미지 보여주기
            
				            // 이미지를 mypage_profile_pic div에 추가하기 전에 기존 내용을 비우기
				            let container = document.getElementById('myPageProfilePic');
				            container.innerHTML = ''; // 기존 내용 지우기
				            
				            // 이미지를 mypage_profile_pic div에 추가
				            container.appendChild(newImage);
        				} else {
				            // 파일이 선택되지 않은 경우
				            $("#myPageProfile").css("display", "block"); // 프로필 아이콘 표시하기
				            $("#myPageProfilePic").css("color", "#F72798"); // 프로필 아이콘 색상 원래대로 변경하기
				            
				            // 이미지를 mypage_profile_pic div에서 제거하기
				            let container = document.getElementById('myPageProfilePic');
				            container.innerHTML = ''; // 이미지 삭제
				            // 아이콘을 mypage_profile_pic div에 추가
				            container.innerHTML = '<i class="fa-solid fa-user fa-4x" id="myPageProfile" style="color: <%=loginMember.getMemColor()%>; display: block;"></i>';
						}
					}
				</script>
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
  
			<br><br>
		

					<table class="table">
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
							<td><input type="password" class="form-control" placeholder="특수문자 포함 8~15자리 비밀번호를 입력하세요" name="memPwd" value="<%=loginMember.getMemPwd()%>" required></td>
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
							<select name="genre" id="prefGenre" required>
							<option value="">* 선호장르를 선택하세요</option>
							<%for(int i=0; i<prefGenre.size(); i++){ %>
							<option value="<%=prefGenre.get(i)%>" <%= loginMember.getPrefGenre() != null ? (loginMember.getPrefGenre().equals(prefGenre.get(i)) ? "selected" : "") : ""%>><%=prefGenre.get(i)%></option>
							<%} %>
							</select>
							</td>
						</tr>
					</table>
			  
			  
					<div class="mypage_footer" style="display: flex; justify-content: center;">
						<button type="submit" class="btn" onclick="updateMember()">정보변경</button>
						<button type="button" class="btn" data-toggle="modal"data-target="#changePwdModal">비밀번호 변경</button>
						<button type="reset" class="btn">초기화</button>
						<button type="button" class="btn" onclick="deleteMember()">회원탈퇴</button>
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
	  	<div class="modal-content">
	  	
			<!-- Modal Header -->
	  		<div class="modal-header">
	  		<h4 class="modal-title">비밀번호 변경</h4>
	  		<button type="button" class="close" data-dismiss="modal">&times;</button>
	  		</div>
	  		
	  		<!-- Modal Body -->
	  		<div class="modal-body">
	  			<form action="<%=contextPath%>/updatePwd.me" method="post">
					<table align="center">
	  					<tr>
	  						<th style="width: 200px;">* 현재 비밀번호</th>
	  						<td><input type="password" class="form-control" name="memPwd"></td>
	  					</tr>
	  					<tr>
	  						<th style="width: 200px;">* 변경할 비밀번호</th>
	  						<td><input type="password" class="form-control" name="newPwd" id="newPwd"></td>
	  					</tr>
	  					<tr>
	  						<th style="width: 200px;">* 변경할 비밀번호 재입력</th>
	  						<td><input type="password" class="form-control"></td>
	  					</tr>
	  					<tr>
	  						<td colspan="2" style="text-align:center; padding-top: 10px;">
								<button type="submit" class="btn btn-outline-warning btn-sm" style="width: 150px;" id="newPwdCheck">비밀번호 변경</button>
	  						</td>
						</tr>
					</table>
				</form>
			</div>  
			<script>
			function changePwd(){
				const regExpPassword = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d@$!%*#?&]{8,15}$/;	  
				if(regExpPassword.test($(".signup_content input[name=newPwd]").val())){
					passValidationCheck = true;
				}
				
				const memPwd = document.getElementById("newPwd").value;
				const checkPwd = document.getElementById("newPwdCheck").value; 
				if(memPwd == checkPwd){
					passCollCheck = true;	  
				}
			}	
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