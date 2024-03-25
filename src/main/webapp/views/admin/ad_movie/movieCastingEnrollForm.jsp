<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 인물 관리 _ 인물 등록</title>

<!-- 부트스트랩 기능을 위한 CDN 방식 연결 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!--  -------------------------------------  -->

<style>

	/*body style*/
.bodyBox{
	padding: 5px 5px 5px 5px;
    width: 1100px;
    align-items: center;
    margin: 0 auto;

}

h1{
	font-weight: bold !important;
	color: black;
}

.list{
    position: relative;
}

.listBtn{
    position: absolute;
    top: 0;
    right: 0;
    padding: 20px;
}

.table *{
    align-items: center;
    text-align: center;
}


</style>
</head>
<body>

	<!-- Header start -->
	<%@ include file="/views/admin/common/header.jsp" %>
	<!-- Header end -->
	
	<!-- section start -->
	
    <div class="bodyBox">
        <h4 class="modal-title">인물 추가</h4>
        <hr>
           
      <form action="<%=contextPath %>/insertCasting.admo" method="post" enctype="multipart/form-data">
      <div class="table">
          <table class="addCasting">
              <tr>
                  <th><label for="pName">이름</label></th>
                  <td><input type="text" id="pName" name="pName" required placeholder="인물명을 입력해주세요."></td>
              </tr>
      
              <tr>
                  <th><label for="pFile">사진</label></th>
                  <td><input type="file" id="pFile" name="pFile" required></td>
              </tr>
      
              <tr>
                  <th><label for="pDate">출생연도</label></th>
                  <td><input type="date" id="pDate" name="birth" required></td>
              </tr>
      
              <tr>
                  <th><label for="pNation">국적</label></th>
                  <td><input type="text" id="pNation" name="pNation" required></td>
              </tr>
      
              <tr>
                  <th><label for="pJob">직업</label></th>
                  <td><input type="text" id="pJob" name="pJob" required></td>
              </tr>
              
              <tr>
              	<td colspan='2'>
              		<button type="button" class="btn btn-outline-secondary modifyBtn" style="float: right;" data-dismiss="modal">추가</button>
              	</td>
              </tr>

          </table>
      </div>
	</form>
</div>
    
	<!-- section end -->

</body>
</html>