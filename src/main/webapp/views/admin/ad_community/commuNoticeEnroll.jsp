<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록페이지</title>

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
		<h1>공지사항 등록</h1>
    <hr>
    
    	<form action="" method="post">
            <table class="table">
                <tr>
                    <th><label for="title">제목</label></th>
                    <td colspan="3"><input type="text" id="title" class="form-control" required name="noticeTitle"></td>
                </tr>
                <tr>
                	<th><label for="noticeSection">구분</label></th>
                	<td colspan="3">
                		<select class="form-control" id="noticeSection">
		                    <option>일반</option>
		                    <option>이벤트</option>
		                </select>
                	</td>
                	
                </tr>
                <tr>
                    <th><label for="noticeContent">공지내용</label></th>
                    <td colspan="3"><textarea cols="30" rows="10" class="form-control" style="resize: none;" required name="noticeContent"></textarea></td>
                	
                </tr>
                <tr>
                	<td colspan="4"><input type="file"></td>
				</tr>
				<tr>
                	<td colspan="4">
                		<input type="checkbox" id="fix">
                		<label for="fix">상단고정</label>
                	</td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <button type="submit" class="btn btn-outline-secondary btn-sm">등록하기</button>
                        <button type="reset" class="btn btn-outline-danger btn-sm">초기화</button>
                        <button type="button" class="btn btn-outline-warning btn-sm" onclick="history.back();">뒤로가기</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
	<!-- section end -->

</body>
</html>