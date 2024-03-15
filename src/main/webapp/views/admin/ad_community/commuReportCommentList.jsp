<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고된 댓글 목록</title>

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
	
	.table *{
	    align-items: center;
	    text-align: center;
	}

    .reportContent{
        display: none;
    }

    .reportList:hover{
        background-color: lightcoral;

    }

    .reportDetail{
        text-align: left !important;
    }
	
</style>


</head>
<body>

	<!-- Header start -->
	<%@ include file="/views/admin/common/header.jsp" %>
	<!-- Header end -->
	
	<!-- section start -->
	<div class="bodyBox">
		<h1>신고된 댓글 목록</h1>
	    <hr>
	
	    <div class="d-flex justify-content-center container">
	        <span>검색</span>&nbsp;&nbsp;&nbsp;
	        <input type="text" placeholder="검색어를 입력해주세요">
	        <button type="button">
	            <img src="../img/icon_search.png">
	        </button>          
	    </div>
	    
	    <br>
	    
	    <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>번호</th>
                    <th>등록일</th>
                    <th>등록자 아이디</th>
                    <th>댓글내용</th>
                    <th>신고수</th>
                    <th>구분</th>
                    <th>관리</th>
                </tr>
            </thead>
            
            <tbody>

                <!-- case1. 조회된 게시글 없을 경우 -->
                            <!--
                            <tr>
                                <td colspan="8" style="text-align: center;">존재하는 게시글이 없습니다.</td>
                            </tr>
                            -->

                <!-- case2. 조회된 게시글 있을 경우  -->
                <tr class="reportList">
                    <td>3</td>
                    <td>2024.03.08</td>
                    <td>user01</td>
                    <td>댓글내용이 보여지는 공간</td>
                    <td>3</td>
                    <td>영화</td>
                    <td><button type="button" class="btn btn-outline-warning" onclick="reportBoard();">신고회원관리</button></td>
                </tr>

                <!-- 글(.reportList)를 누르면 나오는 세부 내용  -->
                <tr class="reportContent">
                    <td colspan="2"></td>
                    <td colspan="4"><div>
                        <table class="reportDetail">
                            <tr>
                                <th>댓글 내용</th>
                                <td colspan="3">
                                    <p style="min-height: 200px;">
                                        현재 조회하고 있는 게시글의 내용
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <th>댓글에 등록된 첨부파일</th>
                                <td colspan="3">
                                    <input type="file">
                                </td>
                            </tr>
        
                            <tr>
                                <th>신고 내용</th>
                                <td colspan="3">                            
                                    <div>
                                        <p>신고자 아이디 : 아이디보여지는공간</p>
                                        <p>신고 내용 : </p>
        
                                    </div>
        
                                    <div>
                                        <p>신고자 아이디 : 아이디보여지는공간</p>
                                        <p>신고 내용 : </p>                                          
                                    </div>                                   
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"></td>
                                <td>
                                    <button type="button" class="btn btn-outline-danger btn-sm" onclick="alert('블라인드 게시글로 처리되었습니다.')">블라인드처리</button>
                                </td>
                            </tr>
                        </table>
                    </div></td>
                </tr>

                <tr class="reportList">
                    <td>2</td>
                    <td>2024.03.08</td>
                    <td>user02</td>
                    <td>댓글내용이 보여지는 공간</td>
                    <td>1</td>
                    <td>잡담</td>
                    <td><button type="button" class="btn btn-outline-warning" onclick="reportBoard();">신고회원관리</button></td>
                </tr>

                <!-- 글(.reportList)를 누르면 나오는 세부 내용  -->
                <tr class="reportContent">
                    <td colspan="2"></td>
                    <td colspan="4">
                        <div>
                            <table class="reportDetail">
                                <tr>
                                    <th>댓글 내용</th>
                                    <td colspan="3">
                                        <p style="min-height: 200px;">
                                            현재 조회하고 있는 댓글의 내용
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <th>댓글에 등록된 첨부파일</th>
                                    <td colspan="3">
                                        <input type="file">
                                    </td>
                                </tr>
            
                                <tr>
                                    <th>신고 내용</th>
                                    <td colspan="3">                            
                                        <div>
                                            <p>신고자 아이디 : 아이디보여지는공간</p>
                                            <p>신고 내용 : </p>
            
                                        </div>
            
                                        <div>
                                            <p>신고자 아이디 : 아이디보여지는공간</p>
                                            <p>신고 내용 : </p>                                          
                                        </div>                                   
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>

            </tbody>

        </table>
    
    <!-- section end -->
    
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
    
    

    <script>
        function reportBoard(){
   			location.href = "../ad_member/reportMemberList.jsp";
   		}
    </script>

    <script>
        $(function(){
            $(".reportList").click(function(){
                const $r = $(this).next();

                if($r.css("display") == "none"){
                    $r.siblings(".reportContent").hide();
                    $r.show();
                }else{
                    $r.hide();
                }
            })
        })
    </script>


</body>
</html>