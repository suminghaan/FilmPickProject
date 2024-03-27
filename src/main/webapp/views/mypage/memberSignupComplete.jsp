<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	String userNickname = (String)request.getAttribute("nickname");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.joincomplete{
      border: 1px solid lightgrey;
      width: 500px;
      height: 300px;
      border-radius: 0.7em;
    }
</style>
</head>
<body>


    <%@ include file="/views/common/header.jsp" %>

    <div class="content_wrap" style="background-color: black;">
      <div class="content">
        <div class="joincomplete" style="background-color: white; color:black;">
            <div class="container">
                <img src="<%= contextPath %>/resources/img/logo.png" width="150px" height="50px" id="logo">
                <br>
                <br>
                <h4><%= userNickname %>님, 가입을 환영합니다!</h4>
                <br>
    			<p> 가입이 완료되었습니다.<br> 로그인 후 FILMPICK에서 더 많은 즐거움을 느껴보세요!</p>
                <br>
                   	<a href="<%= contextPath %>/loginForm.me" type="submit" class="btn btn-outline-light" style="width: 300px;
                                                                                  --bs-btn-border-color: RGB(247, 39, 140);
                                                                                  --bs-btn-color:RGB(247, 39, 140);
                                                                                  --bs-btn-hover-color: #ffffff;
                                                                                  --bs-btn-hover-bg: RGB(247, 39, 140);
                                                                                  --bs-btn-hover-border-color: #ffffff;">로그인하러가기</a>
                <br>
                <br>
            </div>
        </div>
      </div>
    </div>

    <%@ include file="/views/common/footer.jsp" %>


  </main>
  <script src="../../resources/assets/dist/js/bootstrap.bundle.min.js"></script>
  
</body>
</html>