<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.login {
		border: 1px solid lightgrey;
		width: 500px;
		height: 350px;
		border-radius: 0.7em;
		color: black;
		margin: auto;
	}

    #btn-login {
		border-radius: 0.3em;
		margin: auto;
		display: block;
    }

	.btn-search-pass, .btn-search-id,.btn-join {
		background-color: white;
		width: 130px;
		height: 38px;
		display :inline-block;
    }
    
    #id, #pwd{
		background-color: white;
      	border-color: lightgray;
      	color: gray;
    }
</style>
</head>
<body>

<main>

	<%@ include file="/views/common/header.jsp" %>

	<div class="content_wrap" style="margin-top: 100px;">
	<div class="content">
		<div class="login" style="background-color: white;">
		<div class="container">
			<form action="<%= contextPath%>/login.me" method="post">
				<br>
				<img src="<%= contextPath %>/resources/img/logo.png" width="150px" height="50px" id="logo">
				<br><br>			
				<div class="form-group">
					<input type="text" class="form-control" id="id" placeholder="아이디를 입력하세요" name="memId" style="width: 400px; background-color:white; margin: auto;">
				</div>
				
				<div class="form-group">
					<input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요" name="memPwd" style="width: 400px; background-color:white; margin: auto;">
				</div>
				<div class="form-group form-check" style="float: right;"></div>
				<br>
				<button type="submit" class="btn btn-outline-light" id="btn-login" style="width: 300px; margin: auto;
																						--bs-btn-border-color: RGB(247, 39, 140);
																						--bs-btn-color:RGB(247, 39, 140);
																						--bs-btn-hover-color: #ffffff;
																						--bs-btn-hover-bg: RGB(247, 39, 140);
																						--bs-btn-hover-border-color: #ffffff;">로그인</button>
					              
				<br>
				<div class="buttonArea" style="text-align: center;">    
				<button type="button" class="btn btn-search-pass" onclick="location.href='<%=contextPath%>/findPwd.me'">비밀번호찾기</button>|
				<button type="button" class="btn btn-search-id" onclick="location.href='<%= contextPath%>/findId.me'">아이디찾기</button>|
				<button type="button" class="btn btn-join" onclick="location.href='<%= contextPath%>/signupCheckForm.me'">회원가입</button> 
				</div> 
				<br>
				<br>
				<br>
			
			</form>
		</div>
		</div>
	</div>
	</div>

<%@ include file="/views/common/footer.jsp" %>


</main>
<script src="../../resources/assets/dist/js/bootstrap.bundle.min.js"></script>
  
  
  
  
  
  
</body>
</html>