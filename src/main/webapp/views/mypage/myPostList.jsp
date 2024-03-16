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


        
    <div class="container">

        <h3>작성글조회</h3>

        <table class="table">
          <thead>
            <tr>
              <th>번호</th>
              <th>제목</th>
              <th>작성일</th>
              <th>조회수</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>10</td>
              <td>제목</td>
              <td>2024-02-06</td>
              <td>50</td>
            </tr>
            <tr>
                <td>10</td>
                <td>제목</td>
                <td>2024-02-06</td>
                <td>50</td>
            </tr>
            <tr>
                <td>10</td>
                <td>제목</td>
                <td>2024-02-06</td>
                <td>50</td>
            </tr>
          </tbody>
        </table>
      </div>


      <div class="container">
  
        <ul class="pagination">
          <li class="page-item"><a class="page-link" href="#">Previous</a></li>
          <li class="page-item active"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item"><a class="page-link" href="#">4</a></li>
          <li class="page-item"><a class="page-link" href="#">5</a></li>
          <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
      </div>




      </div>
    </div>

    <%@ include file="/views/common/footer.jsp" %>


  </main>
  <script src="../../resources/assets/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>