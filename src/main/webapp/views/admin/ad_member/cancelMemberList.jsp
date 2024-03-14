<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴회원 조회</title>
<style>
#select-user-title{
    margin-top: 50px;
}
table{
    margin-top: 20px;
}
.title>h1{
    font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
    <div class="container-fluid">
    	<div class="container">
        <div id="title" class="title">
            <h1 id="select-user-title">탈퇴회원 조회</h1>
        </div>
        <hr>
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="table-active"><span style="font-weight: bold;">아이디</span></th>
                        <td><input type="text" placeholder="아이디를 입력해주세요"></td>
                    </tr>
                </thead>
                    <tbody>
                        <th class="table-active">탈퇴일</th>
                        <td>
                            <input type="date">  -  <input type="date">&nbsp;&nbsp;&nbsp;
                            <div class="btn-group">
                                <button type="button" class="btn btn-outline-dark date">오늘</button>
                                <button type="button" class="btn btn-outline-dark date">일주일</button>
                                <button type="button" class="btn btn-outline-dark date">한달</button>
                                <button type="button" class="btn btn-outline-dark date">3개월</button>
                                <button type="button" class="btn btn-outline-dark date">전체</button>
                            </div>
                        </td>
                    </tbody>
            </table>
        </div>
        <div class="d-flex justify-content-center container">
            <button type="button" class="btn btn-secondary btn-lg" style="margin-bottom: 10px;">검색</button>
        </div>
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr class="table-active">
                        <th>번호</th>
                        <th>아이디</th>
                        <th>사유</th>
                        <th>탈퇴일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>999</td>
                        <td>user999</td>
                        <td>사유1</td>
                        <td>2024-01-22</td>
                    </tr>
                    <tr>
                        <td>998</td>
                        <td>user999</td>
                        <td>사유1</td>
                        <td>2024-01-22</td>
                    </tr>
                    <tr>
                        <td>997</td>
                        <td>user999</td>
                        <td>사유1</td>
                        <td>2024-01-22</td>
                    </tr>
                    <tr>
                        <td>996</td>
                        <td>user999</td>
                        <td>사유1</td>
                        <td>2024-01-22</td>
                    </tr>
                    <tr>
                        <td>995</td>
                        <td>user999</td>
                        <td>사유1</td>
                        <td>2024-01-22</td>
                    </tr>
                    <tr>
                        <td>994</td>
                        <td>user999</td>
                        <td>사유1</td>
                        <td>2024-01-22</td>
                    </tr>
                    <tr>
                        <td>993</td>
                        <td>user999</td>
                        <td>사유1</td>
                        <td>2024-01-22</td>
                    </tr>
                    <tr>
                        <td>992</td>
                        <td>user999</td>
                        <td>사유1</td>
                        <td>2024-01-22</td>
                    </tr>
                    <tr>
                        <td>991</td>
                        <td>user999</td>
                        <td>사유1</td>
                        <td>2024-01-22</td>
                    </tr>
                    <tr>
                        <td>990</td>
                        <td>user999</td>
                        <td>사유1</td>
                        <td>2024-01-22</td>
                    </tr>
                </tbody>
            </table>
        </div>
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
    	$(function(){
    		$('.date').click(function(){
    			 $(this).removeClass('btn-outline-dark').addClass('btn-dark');
    	         $('.date').not($(this)).removeClass('btn-dark').addClass('btn-outline-dark');
    		});
    	});
    </script>
</body>
</html>