<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	 /* 컨텐츠부분 */
    .background{
        margin: 100px;
        background-color: rgb(39, 39, 39);
    }

    .content_link{
        display: flex;
        padding-top: 50px;
        padding-left: 120px;
    }

    .content_link>a{
        text-decoration: none;
        letter-spacing: 5px;
    }

    .division{
        margin-left: 20px;
        margin-right: 20px;
    }

    .tableback{
        background: white;
        width: 80% !important; 
        margin: auto;
    }

    th{background-color:rgb(240, 234, 234);}

    tbody{text-align: center;}

    .notice_search{
        margin: auto;
        display: flex;
        justify-content: center;
    }

    tbody>tr{cursor: pointer;}

    .pagination{
        margin-top: 250px;
    }
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
	<!-- Section start -->
    <div class="content_wrap" style="background-color: black; min-height: 1000px;">
      <div class="content">
        <div class="background">
            <div class="content_link"">
            	<!-- 추후 링크 수정 @@@@@@@@@@ -->
                <a href="noticeList.jsp" style="color: rgb(255, 255, 255);"><h2>공지사항</h2></a> <h2 class="division" style="color: rgb(158, 158, 158);">|</h2>
                <a href="../serviceCenter/inquiryList.jsp" style="color: rgb(158, 158, 158);"><h2>고객센터</h2></a>
            </div>
            <br>
            <table class="tableback table table-hover" id="notice_list">
                <thead>
                    <tr align="center">
                        <th>번호</th>
                        <th>구분</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2</td>
                        <td>일반</td>
                        <td>공지사항제목</td>
                        <td>2024/02/22</td>
                        <td>21</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>일반</td>
                        <td>공지사항제목</td>
                        <td>2024/02/20</td>
                        <td>36</td>
                    </tr>
                </tbody>
            </table>

            <br><br><br><br>
            <ul class="pagination justify-content-center">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>

            <div class="notice_search">
                <form action="" method="">
                    <input type="text" class="notice_search_input" style="width: 400px; height: 40px;  margin-bottom: 50px;">
                    <button type="image" class="notice_search_btn" alt="검색">검색</button>
                </form>
            </div>
          </div> <br><br>
        </div>

    </div>
    <!-- Section end -->
      
    <!-- Section Script start-->
    <script>

      $(function(){
        $("#notice_list>tbody>tr").click(function(){
          location.href="noticeContent.jsp" // 추후 수정
        })
      })

    </script>
    <!-- Section Script end-->
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>