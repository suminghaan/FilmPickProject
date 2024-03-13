<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
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
.userId:hover{
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
    <div class="container-fluid">
		    <div class="container">
        <div id="title" class="title">
            <h1 id="select-user-title">회원 조회</h1>
        </div>
        <hr>
        <div class="d-flex justify-content-center container">
            <span>아이디</span>&nbsp;&nbsp;&nbsp;
            <input type="text" placeholder="아이디를 입력해주세요">
            <button type="button">
                <img src="../img/icon_search.png">
            </button>          
        </div>
        <div class="d-flex justify-content-end container" style="margin: 20px;">
            <img src="../img/icon_filter.png" style="margin-right: 10px;">
            <select class="form-control" style="width: 130px">
                <option>휴면회원만 조회</option>
                <option>Level 1</option>
                <option>Level 2</option>
                <option>Level 3</option>
                <option>Level 4</option>
                <option>Level 5</option>
            </select>
        </div>
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr class="table-active">
                        <th>번호</th>
                        <th>아이디</th>
                        <th>회원등급</th>
                        <th>리뷰횟수</th>
                        <th>별점평균</th>
                        <th>선호장르</th>
                        <th>휴면여부</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>999</td>
                        <td class="userId" onclick="viewMemberPostsPage();">user999</td>
                        <td>
                        <select class="form-control">
                            <option value="1">Level 1</option>
                            <option value="2">Level 2</option>
                            <option value="3">Level 3</option>
                            <option value="4">Level 4</option>
                            <option value="5">Level 5</option>
                        </select>
                    </td>
                        <td>199</td>
                        <td>3.2</td>
                        <td>스릴러</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>998</td>
                        <td class="userId" onclick="viewMemberPostsPage();">user999</td>
                        <td>
                            <select class="form-control">
                                <option value="1">Level 1</option>
                                <option value="2">Level 2</option>
                                <option value="3">Level 3</option>
                                <option value="4">Level 4</option>
                                <option value="5">Level 5</option>
                            </select>
                        </td>
                        <td>199</td>
                        <td>3.2</td>
                        <td>스릴러</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>997</td>
                        <td class="userId" onclick="viewMemberPostsPage();">user999</td>
                        <td>
                            <select class="form-control">
                                <option value="1">Level 1</option>
                                <option value="2">Level 2</option>
                                <option value="3">Level 3</option>
                                <option value="4">Level 4</option>
                                <option value="5">Level 5</option>
                            </select>
                        </td>
                        <td>199</td>
                        <td>3.2</td>
                        <td>스릴러</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>996</td>
                        <td class="userId" onclick="viewMemberPostsPage();">user999</td>
                        <td>
                            <select class="form-control">
                                <option value="1">Level 1</option>
                                <option value="2">Level 2</option>
                                <option value="3">Level 3</option>
                                <option value="4">Level 4</option>
                                <option value="5">Level 5</option>
                            </select>
                        </td>
                        <td>199</td>
                        <td>3.2</td>
                        <td>스릴러</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>995</td>
                        <td class="userId" onclick="viewMemberPostsPage();">user999</td>
                        <td>
                            <select class="form-control">
                                <option value="1">Level 1</option>
                                <option value="2">Level 2</option>
                                <option value="3">Level 3</option>
                                <option value="4">Level 4</option>
                                <option value="5">Level 5</option>
                            </select>
                        </td>
                        <td>199</td>
                        <td>3.2</td>
                        <td>스릴러</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>994</td>
                        <td class="userId" onclick="viewMemberPostsPage();">user999</td>
                        <td>
                            <select class="form-control">
                                <option value="1">Level 1</option>
                                <option value="2">Level 2</option>
                                <option value="3">Level 3</option>
                                <option value="4">Level 4</option>
                                <option value="5">Level 5</option>
                            </select>
                        </td>
                        <td>199</td>
                        <td>3.2</td>
                        <td>스릴러</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>993</td>
                        <td class="userId" onclick="viewMemberPostsPage();">user999</td>
                        <td>
                            <select class="form-control">
                                <option value="1">Level 1</option>
                                <option value="2">Level 2</option>
                                <option value="3">Level 3</option>
                                <option value="4">Level 4</option>
                                <option value="5">Level 5</option>
                            </select>
                        </td>
                        <td>199</td>
                        <td>3.2</td>
                        <td>스릴러</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>992</td>
                        <td class="userId" onclick="viewMemberPostsPage();">user999</td>
                        <td>
                            <select class="form-control">
                                <option value="1">Level 1</option>
                                <option value="2">Level 2</option>
                                <option value="3">Level 3</option>
                                <option value="4">Level 4</option>
                                <option value="5">Level 5</option>
                            </select>
                        </td>
                        <td>199</td>
                        <td>3.2</td>
                        <td>스릴러</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>991</td>
                        <td class="userId" onclick="viewMemberPostsPage();">user999</td>
                        <td>
                            <select class="form-control">
                                <option value="1">Level 1</option>
                                <option value="2">Level 2</option>
                                <option value="3">Level 3</option>
                                <option value="4">Level 4</option>
                                <option value="5">Level 5</option>
                            </select>
                        </td>
                        <td>199</td>
                        <td>3.2</td>
                        <td>스릴러</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>990</td>
                        <td class="userId" onclick="viewMemberPostsPage();">user999</td>
                        <td>
                            <select class="form-control">
                                <option value="1">Level 1</option>
                                <option value="2">Level 2</option>
                                <option value="3">Level 3</option>
                                <option value="4">Level 4</option>
                                <option value="5">Level 5</option>
                            </select>
                        </td>
                        <td>199</td>
                        <td>3.2</td>
                        <td>스릴러</td>
                        <td>Y</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="d-flex justify-content-end container">
            <button type="button" class="btn btn-secondary btn-sm" style="margin-bottom: 10px;" onclick="alert('user999의 회원등급 수정이 완료되었습니다.')">수정</button>
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
   		function viewMemberPostsPage(){
   			location.href = "";
   		};
   </script>
</body>
</html>