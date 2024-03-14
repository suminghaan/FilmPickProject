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

/* 헤더부분 */
#header {
  height: 100px;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
}

.content_wrap {
  padding-top: 100px;
  margin:auto;
  height: 1500px;
  width: 1500px;
}

.content {
  height: 100%;
}

#footer {
  height: 100px;
}

.bd-placeholder-img {
  font-size: 1.125rem;
  text-anchor: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
}

.search_bar {
  width: 400px;
}

@media (min-width: 768px) {
  .bd-placeholder-img-lg {
    font-size: 3.5rem;
  }
}
@media (max-width: 990px) {
  #header {
    height: 250px;
  }
  .content_wrap {
    padding-top: 250px;
  }
  .search_bar {
    width: 600px;
  }
}

.b-example-divider {
  width: 100%;
  height: 3rem;
  background-color: rgba(0, 0, 0, .1);
  border: solid rgba(0, 0, 0, .15);
  border-width: 1px 0;
  box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
}

.b-example-vr {
  flex-shrink: 0;
  width: 1.5rem;
  height: 100vh;
}

.bi {
  vertical-align: -.125em;
  fill: currentColor;
}

.nav-scroller {
  position: relative;
  z-index: 2;
  height: 2.75rem;
  overflow-y: hidden;
}

.nav-scroller .nav {
  display: flex;
  flex-wrap: nowrap;
  padding-bottom: 1rem;
  margin-top: -1px;
  overflow-x: auto;
  text-align: center;
  white-space: nowrap;
  -webkit-overflow-scrolling: touch;
}

.btn-bd-primary {
  --bd-violet-bg: #712cf9;
  --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

  --bs-btn-font-weight: 600;
  --bs-btn-color: var(--bs-white);
  --bs-btn-bg: var(--bd-violet-bg);
  --bs-btn-border-color: var(--bd-violet-bg);
  --bs-btn-hover-color: var(--bs-white);
  --bs-btn-hover-bg: #6528e0;
  --bs-btn-hover-border-color: #6528e0;
  --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
  --bs-btn-active-color: var(--bs-btn-hover-color);
  --bs-btn-active-bg: #5a23c8;
  --bs-btn-active-border-color: #5a23c8;
}

.bd-mode-toggle {
  z-index: 1500;
}

.bd-mode-toggle .dropdown-menu .active .bi {
  display: block !important;
}

.menu_buttons {
  margin-left: 20px;
}

.menu_buttons:hover {
  transform: scale(1.3);
}

.menu_buttons_co {
  margin-left: 10px;
  display: none;
}

.menu_buttons:hover + .menu_buttons_co {
  display: block;
}

.search {
  position: relative;
}

.searchBtn {
  position: absolute;
  margin: auto;
  top: 0;
  right: 0;
}

.search-info {
  margin-top: 200px;
  height: 5%;
  background-color: gray;
}

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
                        <td><button type="button" class="btn btn-outline-secondary">관리</button></td>
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
	
	<!-- section end -->

</body>
</html>