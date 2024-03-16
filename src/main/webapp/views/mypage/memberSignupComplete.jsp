<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


    <%@ include file="/views/common/header.jsp" %>

    <div class="content_wrap" style="background-color: black;">
      <div class="content">
        <div class="joincomplete" style="background-color: white;">
            <div class="container">
                <img src= "../../resources/img/logo.png" width="100px" height="50px" id="logo">
                <h2>기본프로필사진</h2>
                <br>
                <br>
                <p>님, 환영합니다!</p>
                <br>
                
                    <center><button type="submit" class="btn btn-outline-light" style="width: 300px;
                                                                                  --bs-btn-border-color: RGB(247, 39, 140);
                                                                                  --bs-btn-color:RGB(247, 39, 140);
                                                                                  --bs-btn-hover-color: #ffffff;
                                                                                  --bs-btn-hover-bg: RGB(247, 39, 140);
                                                                                  --bs-btn-hover-border-color: #ffffff;">로그인하러가기</button></center>
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