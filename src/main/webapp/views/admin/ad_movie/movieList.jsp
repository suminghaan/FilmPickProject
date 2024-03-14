<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 영화 조회</title>

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

</style>
</head>
<body>

	<!-- Header start -->
	<%@ include file="/views/admin/common/header.jsp" %>
	<!-- Header end -->
	
	
	<!-- section start -->		
	
	<div class="bodyBox">
        <h1>등록된 영화 조회</h1>

        
        <hr>

		
        
        <div class="d-flex justify-content-center container">
            <span>검색</span>&nbsp;&nbsp;&nbsp;
            <input type="text" placeholder="검색어를 입력해주세요">
            <button type="button">
                <img src="../img/icon_search.png">
            </button>          
        </div>
        
        <br><br>
        

        <div>
            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>번호</th>
                        <th>등록일</th>
                        <th>등록자 아이디</th>
                        <th>영화제목</th>
                        <th>감독</th>
                        <th>장르</th>
                        <th>관리</th>
                    </tr>
                </thead>
                
                <tbody>

                    <!-- case1. 조회된 영화 없을 경우 -->
                                <!--
                                <tr>
                                    <td colspan="7" style="text-align: center;">존재하는 게시글이 없습니다.</td>
                                </tr>
                                -->

                    <!-- case2. 조회된 영화 있을 경우  -->
                    <tr>
                        <td>3</td>
                        <td>2024.03.08</td>
                        <td>user01</td>
                        <td>제목3</td>
                        <td>감독명3</td>
                        <td>장르</td>
                        <td><button type="button" class="btn btn-outline-secondary" onclick="movieListDetail();">관리</button></td>
                    </tr>

                    <tr>
                        <td>2</td>
                        <td>2024.03.08</td>
                        <td>user02</td>
                        <td>제목2</td>
                        <td>감독명2</td>
                        <td>장르</td>
                        <td><button type="button" class="btn btn-outline-secondary">관리</button></td>
                    </tr>

                </tbody>

            </table>
            <br>

			<!-- 
            <ul class="pagination justify-content-center">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <!-- <li class="page-item"><a class="page-link1" href="#">2</a></li> 
                <!-- 글자색 수정= class에서 수정 가능 /안먹힐때는 !important로 최우선순위로 둬보기 
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
             -->
             
             <div class="d-flex justify-content-center container">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                    </li>
                </ul>
            </nav>
        </div>
             
             
        </div>
    </div>  
    
    <script>
   		function movieListDetail(){
   			location.href = "../ad_movie/movieListDetail.jsp";
   		}
   </script>
	
	<!-- section end -->

</body>
</html>