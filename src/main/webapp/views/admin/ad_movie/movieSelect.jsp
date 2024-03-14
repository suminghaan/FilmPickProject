<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지 노출영화 선택</title>

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
</style>

</head>
<body>

	<!-- Header start -->
	<%@ include file="/views/admin/common/header.jsp" %>
	<!-- Header end -->
	
	
	<!-- section start -->	
	<div class="bodyBox">
		<h1>메인페이지 노출영화 선택</h1>

    	<hr>

    	<div class="d-flex justify-content-center container">
            <span style="color:black; font-weight: bold;">검색</span>&nbsp;&nbsp;&nbsp;
            <input type="text" placeholder="검색어를 입력해주세요">
            <button type="button">
                <img src="../img/icon_search.png">
            </button>          
    	</div>

    
        <div class="list">
        	<button class="btn btn-outline-secondary listBtn" onclick="msList();">등록된 리스트 목록</button>
        </div>
        
        <br>
        <!-- 등록하는 화면에만 영화 조회 필터 나오게하기 -->
        <div class="d-flex justify-content-end container" style="margin: 20px;">                      
            <img src="../img/icon_filter.png" style="margin-right: 10px;">
            <select class="form-control" style="width: 130px">
                <option>최신등록순</option>
                <option>조회순</option>
            </select>
    	</div>

    	<div>
        	<table class="table table-hover">
            	<thead class="thead-dark">
	                <tr>
	                    <th>번호</th>
	                    <th>등록일</th>
	                    <th>조회수</th>
	                    <th>영화제목</th>
	                    <th>감독</th>
	                    <th>장르</th>
	                    <th>관리</th>
	                </tr>
            	</thead>

            <!-- 등록시 보여지는 화면 -->    
	            <tbody>
	                <tr>
	                    <td>3</td>
	                    <td>2024.03.08</td>
	                    <td>999</td>
	                    <td>제목3</td>
	                    <td>감독명3</td>
	                    <td>장르</td>
	                    <td><button type="button" class="btn btn-outline-secondary"  data-toggle="modal" data-target="#mainMovie">관리</button></td>
	                </tr>
	
	                <tr>
	                    <td>2</td>
	                    <td>2024.03.08</td>
	                    <td>888</td>
	                    <td>제목2</td>
	                    <td>감독명2</td>
	                    <td>장르</td>
	                    <td><button type="button" class="btn btn-outline-secondary"  data-toggle="modal" data-target="#mainMovie">관리</button></td>
	                </tr>	
	            </tbody>
	         </table>

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
            
            <!-- Scrollable modal -->
            <div class="modal" id="mainMovie">
                <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content">

                        <!-- modal header -->
                        <div class="modal-header">
                            <h1>메인페이지 노출 선택</h1>
                            <button type="button" class="close" data-dismiss="modal">×</button>
                        </div>

                        <!-- modal body -->
                        <div class="modal-body">
                            <input type="checkbox" id="mainFstd" name="mainView" value="1">
                            <label for="mainFstd"><h5>첫페이지 화면</h5></label>
                            <ol>
                            	<!-- 영화가 등록되어있을땐 선택이 안되게  -->
                                <li>
                                    <label for="mainFrst1">영화제목</label>
                                    <input type="checkbox" id="mainFrst1">
                                </li>
                                <li>
                                    <label for="mainFrst2">영화제목</label>
                                    <input type="checkbox" id="mainFrst2">
                                </li>
                                <li>
                                    <label for="mainFrst3">영화제목</label>
                                    <input type="checkbox" id="mainFrst3">
                                </li>
                                <li>
                                    <label for="mainFrst4">영화제목</label>
                                    <input type="checkbox" id="mainFrst4">
                                </li>
                                <li>
                                    <label for="mainFrst5">영화제목</label>
                                    <input type="checkbox" id="mainFrst5">
                                </li>
                            </ol>

                            <input type="checkbox" id="maind" name="mainView" value="1">
                            <label for="maind"><h5>메인 화면</h5></label>
                            <ol>
                                <li>
                                    <label for="main1">영화제목</label>
                                    <input type="checkbox" id="main1">
                                </li>
                                <li>
                                    <label for="main2">영화제목</label>
                                    <input type="checkbox" id="main2">
                                </li>
                                <li>
                                    <label for="main3">영화제목</label>
                                    <input type="checkbox" id="main3">
                                </li>
                                <li>
                                    <label for="main4">영화제목</label>
                                    <input type="checkbox" id="main4">
                                </li>
                                <li>
                                    <label for="main5">영화제목</label>
                                    <input type="checkbox" id="main5">
                                </li>
                            </ol>

                            <input type="checkbox" id="mainNowd" name="mainView" value="1">
                            <label for="mainNowd"><h5>현재상영작</h5></label>
                            <ol>
                                <li>
                                    <label for="mainNow1">영화제목</label>
                                    <input type="checkbox" id="mainNow1">
                                </li>
                                <li>
                                    <label for="mainNow2">영화제목</label>
                                    <input type="checkbox" id="mainNow2">
                                </li>
                                <li>
                                    <label for="mainNow3">영화제목</label>
                                    <input type="checkbox" id="mainNow3">
                                </li>
                                <li>
                                    <label for="mainNow4">영화제목</label>
                                    <input type="checkbox" id="mainNow4">
                                </li>
                                <li>
                                    <label for="mainNow5">영화제목</label>
                                    <input type="checkbox" id="mainNow5">
                                </li>
                            </ol>

                            <input type="checkbox" id="mainAdmind" name="mainView" value="1">
                            <label for="mainAdmind"><h5>관리자추천</h5></label>
                            <ol>
                                <li>
                                    <label for="mainAdmin1">영화제목</label>
                                    <input type="checkbox" id="mainAdmin1">
                                </li>
                                <li>
                                    <label for="mainAdmin2">영화제목</label>
                                    <input type="checkbox" id="mainAdmin2">
                                </li>
                                <li>
                                    <label for="mainAdmin3">영화제목</label>
                                    <input type="checkbox" id="mainAdmin3">
                                </li>
                                <li>
                                    <label for="mainAdmin4">영화제목</label>
                                    <input type="checkbox" id="mainAdmin4">
                                </li>
                                <li>
                                    <label for="mainAdmin5">영화제목</label>
                                    <input type="checkbox" id="mainAdmin5">
                                </li>
                            </ol>

                            <input type="checkbox" id="mainUserd" name="mainView" value="1">
                            <label for="mainUserd"><h5>사용자추천</h5></label>
                            <ol>
                                <li>
                                    <label for="mainUser1">영화제목</label>
                                    <input type="checkbox" id="mainUser1">
                                </li>
                                <li>
                                    <label for="mainUser2">영화제목</label>
                                    <input type="checkbox" id="mainUser2">
                                </li>
                                <li>
                                    <label for="mainUser3">영화제목</label>
                                    <input type="checkbox" id="mainUser3">
                                </li>
                                <li>
                                    <label for="mainUser4">영화제목</label>
                                    <input type="checkbox" id="mainUser4">
                                </li>
                                <li>
                                    <label for="mainUser5">영화제목</label>
                                    <input type="checkbox" id="mainUser5">
                                </li>
                            </ol>


                        </div>

                        <!-- modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">적용</button>
                        </div>
                    </div>

                </div>
        
        	
		
            </div>
        

			

            
            <!-- 여기서 ajax로 아래에만 나오게 수정하기  -->
       <script>
	       function msList(){
	  			location.href = "../ad_movie/movieSelectList.jsp";
	  		}
       </script>
       
       
       
	

</body>
</html>