<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고회원 관리</title>
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

.modal-text{
    margin-right: 10px;
    font-weight: bold;
}
.modal-content{
	height: 500px;
}
</style>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
    <div class="container-fluid">
    <div class="container">
        <div id="title" class="title">
        <h1 id="select-user-title">신고회원 관리</h1>
    </div>
    <hr>
    <div class="container">
        <table class="table table-bordered">
            <thead>
            <tr class="table-active">
                <td colspan="7">
                    <input type="checkbox" style="margin-right: 10px;" checked>
                    <span style="margin-right: 30px;">선택한 회원</span>
                    <button type="button" class="btn btn-secondary" style="margin-right: 10px;" data-toggle="modal" data-target="#suspendModal">활동중지</button>
                    <button type="button" class="btn btn-secondary" onclick="withdrawal();">강제탈퇴</button></td>
                <td>
            </tr>
            <tr class="table-active">
                <th>   </th>
                <th>아이디</th>
                <th>닉네임</th>
                <th>신고받은횟수</th>
                <th>가입일</th>
                <th>게시글수</th>
                <th>댓글수</th>
                <th>신고내역 확인</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><div class="form-check"><input type="checkbox"></div></td>
                <td>user999</td>
                <td id="userName">익명원</td>
                <td>1</td>
                <td>2024-01-11</td>
                <td>22</td>
                <td>52</td>
                <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#reportModal">확인</button></td>
            </tr>
            <tr>
                <td><div class="form-check"><input type="checkbox"></div></td>
                <td>user999</td>
                <td>익명원</td>
                <td>1</td>
                <td>2024-01-11</td>
                <td>22</td>
                <td>52</td>
                <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#reportModal">확인</button></td>
            </tr>
            <tr>
                <td><div class="form-check"><input type="checkbox"></div></td>
                <td>user999</td>
                <td>익명원</td>
                <td>1</td>
                <td>2024-01-11</td>
                <td>22</td>
                <td>52</td>
                <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#reportModal">확인</button></td>
            </tr>
            <tr>
                <td><div class="form-check"><input type="checkbox"></div></td>
                <td>user999</td>
                <td>익명원</td>
                <td>1</td>
                <td>2024-01-11</td>
                <td>22</td>
                <td>52</td>
                <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#reportModal">확인</button></td>
            </tr>
            <tr>
                <td><div class="form-check"><input type="checkbox"></div></td>
                <td>user999</td>
                <td>익명원</td>
                <td>1</td>
                <td>2024-01-11</td>
                <td>22</td>
                <td>52</td>
                <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#reportModal">확인</button></td>
            </tr>
            <tr>
                <td><div class="form-check"><input type="checkbox"></div></td>
                <td>user999</td>
                <td>익명원</td>
                <td>1</td>
                <td>2024-01-11</td>
                <td>22</td>
                <td>52</td>
                <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#reportModal">확인</button></td>
            </tr>
            <tr>
                <td><div class="form-check"><input type="checkbox"></div></td>
                <td>user999</td>
                <td>익명원</td>
                <td>1</td>
                <td>2024-01-11</td>
                <td>22</td>
                <td>52</td>
                <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#reportModal">확인</button></td>
            </tr>
            <tr>
                <td><div class="form-check"><input type="checkbox"></div></td>
                <td>user999</td>
                <td>익명원</td>
                <td>1</td>
                <td>2024-01-11</td>
                <td>22</td>
                <td>52</td>
                <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#reportModal">확인</button></td>
            </tr>
            <tr>
                <td><div class="form-check"><input type="checkbox"></div></td>
                <td>user999</td>
                <td>익명원</td>
                <td>1</td>
                <td>2024-01-11</td>
                <td>22</td>
                <td>52</td>
                <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#reportModal">확인</button></td>
            </tr>
            <tr>
                <td><div class="form-check"><input type="checkbox"></div></td>
                <td>user999</td>
                <td>익명원</td>
                <td>1</td>
                <td>2024-01-11</td>
                <td>22</td>
                <td>52</td>
                <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#reportModal">확인</button></td>
            </tr>
            </tbody>
        </table>
        </div>
        <!-- Modal -->
    <div class="modal fade" id="suspendModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">활동중지</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body">
                <div class="container" style="margin-bottom: 20px;">
                    <span class="modal-text">닉네임</span>
                    <span>익명원</span>
                </div>
                <div class="container" style="margin-bottom: 20px;">
                    <span class="modal-text">신고사유</span>
                    <span>욕설</span>
                </div>
                <div class="container" style="margin-bottom: 20px;">
                    <span class="modal-text">활동중지 기간</span>
                    <span>
                        <select>
                            <option value="">3일</option>
                            <option value="">7일</option>
                            <option value="">15일</option>
                            <option value="">30일</option>
                        </select>
                    </span>
                </div>
            </div>
            <div class="modal-footer d-flex justify-content-center ">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">수정</button>
            </div>
        </div>
        </div>
    </div>

    <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">신고내역 확인</h4>
            </div>
            <div class="modal-body">
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">닉네임</span>
                    <span>익명원</span>
                </div>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">신고사유</span>
                    <span>욕설</span>
                </div>
                <hr>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">닉네임</span>
                    <span>익명원</span>
                </div>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">신고사유</span>
                    <span>욕설</span>
                </div>
                <hr>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">닉네임</span>
                    <span>익명원</span>
                </div>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">신고사유</span>
                    <span>욕설</span>
                </div>
                <hr>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">닉네임</span>
                    <span>익명원</span>
                </div>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">신고사유</span>
                    <span>욕설</span>
                </div>
                <hr>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">닉네임</span>
                    <span>익명원</span>
                </div>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">신고사유</span>
                    <span>욕설</span>
                </div>
                <hr>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">닉네임</span>
                    <span>익명원</span>
                </div>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">신고사유</span>
                    <span>욕설</span>
                </div>
                <hr>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">닉네임</span>
                    <span>익명원</span>
                </div>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">신고사유</span>
                    <span>욕설</span>
                </div>
                <hr>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">닉네임</span>
                    <span>익명원</span>
                </div>
                <div class="container" style="margin-bottom: 10px;">
                    <span class="modal-text">신고사유</span>
                    <span>욕설</span>
                </div>
            </div>
            <div class="modal-footer d-flex justify-content-center">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
        </div>
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

<script>
    function withdrawal(){
        const userName = $('#userName').text();

        if(confirm(userName + '님의 회원탈퇴를 진행하시겠습니까?')) {
            alert(userName + '님의 회원탈퇴가 완료되었습니다.');
        } else {
            alert(userName + '님의 회원탈퇴가 취소되었습니다.');
        }
    };
</script>
    </div>
</body>
</html>