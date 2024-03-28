<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.fp.member.model.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("m");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.search-pwd {
      border: 1px solid lightgrey;
      width: 500px;
      height: 350px;
      border-radius: 0.7em;
      margin: auto;
    }

    .certify{
      border: 1px solid lightgray;
      width: 300px;
      height: 30px;
      border-radius: 0.3em;
      cursor: pointer;
    }

    .form-group{
      border: 1px solid lightgray;
      width: 300px;
      height: 200px;
      border-radius: 10px;
      margin-top: 5px;
      padding: 10px;
      box-sizing: border-box;
      display: none;
    }
</style>
</head>
<body>

  <main>
    
    <%@ include file="/views/common/header.jsp" %>
    

     <div class="content_wrap" style="background-color: black; margin-top: 100px;" >
      <div class="content">

        <div class="search-pwd" style="background-color: white; color: black;">
          <div class="container">
           <br>
            <form action="">
            <h4 style="text-align: center;">비밀번호 찾기</h4>
            <br>
            <input type="text" class="form-control" name="memId" placeholder="* 아이디" style="width: 400px; margin: auto;">
            <input type="text" class="form-control" name="memName" placeholder="* 이름" style="width: 400px; margin: auto;">
            <input type="text" class="form-control" name="memPhone" placeholder="* 휴대전화번호 (- 제외)" style="width: 400px; margin: auto;">
            <br>
            <div class="buttonArea" style="text-align: center;"> 
            <a href="<%=contextPath %>/loginForm.me" class="btn btn-outline-light" style="width: 198px;
                                                                             --bs-btn-border-color: RGB(247, 39, 140);
                                                                             --bs-btn-color:RGB(247, 39, 140);
                                                                             --bs-btn-hover-color: #ffffff;
                                                                             --bs-btn-hover-bg: RGB(247, 39, 140);
                                                                             --bs-btn-hover-border-color: #ffffff;">뒤로가기</a>
                                                                             
            <button type="submit" href="" class="btn btn-outline-light" style="width: 198px;
                                                                             --bs-btn-border-color: RGB(247, 39, 140);
                                                                             --bs-btn-color:RGB(247, 39, 140);
                                                                             --bs-btn-hover-color: #ffffff;
                                                                             --bs-btn-hover-bg: RGB(247, 39, 140);
                                                                             --bs-btn-hover-border-color: #ffffff;">확인</button>
            </div>
            </form>
            
            <div>
            <br>
            <input type="text" class="form-control" name="" value="비밀번호 : <%= m.getMemPwd() != null ? m.getMemPwd() : " " %>" style="width: 400px; margin: auto;">
            </div>
            <br>
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