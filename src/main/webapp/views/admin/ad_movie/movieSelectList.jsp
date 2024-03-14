<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 리스트 목록</title>

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
		
        	<table class="table table-hover">
            	<thead class="thead-dark">
	                <tr>
	                    <th style="width:125px">첫페이지 화면</th>
	                    <th>등록일</th>
	                    <th>조회수</th>
	                    <th>영화제목</th>
	                    <th>감독</th>
	                    <th>장르</th>
	                    <th>관리</th>
	                </tr>
            	</thead>
            	<tbody>
	                <tr>
	                    <td>1</td>
	                    <td>2024.03.08</td>
	                    <td>999</td>
	                    <td>제목3</td>
	                    <td>감독명3</td>
	                    <td>장르</td>
	                    <td>
	                    	<button type="button" class="btn btn-outline-warning">△</button>
	                    	<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#mainMovieDelete" onclick="alert('화면노출에서 삭제되었습니다.')">삭제</button>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <td>2</td>
	                    <td>2024.03.08</td>
	                    <td>999</td>
	                    <td>제목3</td>
	                    <td>감독명3</td>
	                    <td>장르</td>
	                    <td>
	                    	<button type="button" class="btn btn-outline-warning">△</button>
	                    	<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#mainMovieDelete" onclick="alert('화면노출에서 삭제되었습니다.')">삭제</button>
	                    </td>
	                </tr>
                </tbody>
            </table>
            
            <table class="table table-hover">
            	<thead class="thead-dark">
	                <tr>
	                    <th style="width:125px">메인화면</th>
	                    <th>등록일</th>
	                    <th>조회수</th>
	                    <th>영화제목</th>
	                    <th>감독</th>
	                    <th>장르</th>
	                    <th>관리</th>
	                </tr>
            	</thead>
            	<tbody>
	                <tr>
	                    <td>1</td>
	                    <td>2024.03.08</td>
	                    <td>999</td>
	                    <td>제목3</td>
	                    <td>감독명3</td>
	                    <td>장르</td>
	                    <td>
	                    	<button type="button" class="btn btn-outline-warning">△</button>
	                    	<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#mainMovieDelete" onclick="alert('화면노출에서 삭제되었습니다.')">삭제</button>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <td>2</td>
	                    <td>2024.03.08</td>
	                    <td>999</td>
	                    <td>제목3</td>
	                    <td>감독명3</td>
	                    <td>장르</td>
	                    <td>
	                    	<button type="button" class="btn btn-outline-warning">△</button>
	                    	<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#mainMovieDelete" onclick="alert('화면노출에서 삭제되었습니다.')">삭제</button>
	                    </td>
	                </tr>
                </tbody>
            </table>
            
            <table class="table table-hover">
            	<thead class="thead-dark">
	                <tr>
	                    <th style="width:125px">현재상영작</th>
	                    <th>등록일</th>
	                    <th>조회수</th>
	                    <th>영화제목</th>
	                    <th>감독</th>
	                    <th>장르</th>
	                    <th>관리</th>
	                </tr>
            	</thead>
            	<tbody>
	                <tr>
	                    <td>1</td>
	                    <td>2024.03.08</td>
	                    <td>999</td>
	                    <td>제목3</td>
	                    <td>감독명3</td>
	                    <td>장르</td>
	                    <td>
	                    	<button type="button" class="btn btn-outline-warning">△</button>
	                    	<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#mainMovieDelete" onclick="alert('화면노출에서 삭제되었습니다.')">삭제</button>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <td>2</td>
	                    <td>2024.03.08</td>
	                    <td>999</td>
	                    <td>제목3</td>
	                    <td>감독명3</td>
	                    <td>장르</td>
	                    <td>
	                    	<button type="button" class="btn btn-outline-warning">△</button>
	                    	<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#mainMovieDelete" onclick="alert('화면노출에서 삭제되었습니다.')">삭제</button>
	                    </td>
	                </tr>
                </tbody>
            </table>
            
            <table class="table table-hover">
            	<thead class="thead-dark">
	                <tr>
	                    <th style="width:125px">관리자추천</th>
	                    <th>등록일</th>
	                    <th>조회수</th>
	                    <th>영화제목</th>
	                    <th>감독</th>
	                    <th>장르</th>
	                    <th>관리</th>
	                </tr>
            	</thead>
            	<tbody>
	                <tr>
	                    <td>1</td>
	                    <td>2024.03.08</td>
	                    <td>999</td>
	                    <td>제목3</td>
	                    <td>감독명3</td>
	                    <td>장르</td>
	                    <td>
	                    	<button type="button" class="btn btn-outline-warning">△</button>
	                    	<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#mainMovieDelete" onclick="alert('화면노출에서 삭제되었습니다.')">삭제</button>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <td>2</td>
	                    <td>2024.03.08</td>
	                    <td>999</td>
	                    <td>제목3</td>
	                    <td>감독명3</td>
	                    <td>장르</td>
	                    <td>
	                    	<button type="button" class="btn btn-outline-warning">△</button>
	                    	<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#mainMovieDelete" onclick="alert('화면노출에서 삭제되었습니다.')">삭제</button>
	                    </td>
	                </tr>
                </tbody>
            </table>
            
            <table class="table table-hover">
            	<thead class="thead-dark">
	                <tr>
	                    <th style="width:125px">사용자추천</th>
	                    <th>등록일</th>
	                    <th>조회수</th>
	                    <th>영화제목</th>
	                    <th>감독</th>
	                    <th>장르</th>
	                    <th>관리</th>
	                </tr>
            	</thead>
            	<tbody>
	                <tr>
	                    <td>1</td>
	                    <td>2024.03.08</td>
	                    <td>999</td>
	                    <td>제목3</td>
	                    <td>감독명3</td>
	                    <td>장르</td>
	                    <td>
	                    	<button type="button" class="btn btn-outline-warning">△</button>
	                    	<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#mainMovieDelete" onclick="alert('화면노출에서 삭제되었습니다.')">삭제</button>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <td>2</td>
	                    <td>2024.03.08</td>
	                    <td>999</td>
	                    <td>제목3</td>
	                    <td>감독명3</td>
	                    <td>장르</td>
	                    <td>
	                    	<button type="button" class="btn btn-outline-warning">△</button>
	                    	<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#mainMovieDelete" onclick="alert('화면노출에서 삭제되었습니다.')">삭제</button>
	                    </td>
	                </tr>
                </tbody>
            </table>
	</div>
	
	

</body>
</html>