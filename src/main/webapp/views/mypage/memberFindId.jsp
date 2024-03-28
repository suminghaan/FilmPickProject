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
	div.search-id {
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

     <div class="content_wrap" style="background-color: black; margin-top: 100px;">
      <div class="content">

        <div class="search-id" style="background-color: white; color: black;">
          <div class="container">
           <br><br>
            <form action="">
            <h6>아이디 찾기</h6>
            <br>
            <input type="text" name="memName"placeholder="* 이름" style="width: 300px; border: 1px solid lightgray;"><br>
            <input type="text" name="memPhone" placeholder="* 휴대전화번호(-제외)" style="width: 300px; border: 1px solid lightgray;"><br>
            <br><br>

            <button type="submit" href="" class="btn btn-outline-light" style="width: 300px;
                                                                             --bs-btn-border-color: RGB(247, 39, 140);
                                                                             --bs-btn-color:RGB(247, 39, 140);
                                                                             --bs-btn-hover-color: #ffffff;
                                                                             --bs-btn-hover-bg: RGB(247, 39, 140);
                                                                             --bs-btn-hover-border-color: #ffffff;">확인</button>
            </form>
            
            <div>
            <%= m.getMemId() != null ? m.getMemId() : " " %>
            
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