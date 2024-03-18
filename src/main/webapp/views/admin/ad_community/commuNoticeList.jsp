<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
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
	
	.table *{
	    align-items: center;
	    text-align: center;
	}


</style>
</head>
<body>

	<!-- Header start -->
	<%@ include file="/views/admin/common/header.jsp" %>
	<!-- Header end -->
	
	<!-- section start -->
	<div class="bodyBox">
		<h1>공지사항 목록</h1>
    <hr>

    <div class="d-flex justify-content-center container">
        <span>검색</span>&nbsp;&nbsp;&nbsp;
        <input type="text" placeholder="검색어를 입력해주세요">
        <button type="button">
            <img src="../img/icon_search.png">
        </button>          
    </div>
    
    <br>
    
    <div class="list">
        <a href="<%= contextPath %>/enrollForm.co" class="btn btn-outline-secondary listBtn" onclick="noticeEnroll();">신규등록</a>
    </div>
    
    <br><br>
    
    <div>
        <table class="table table-hover" >
            <thead class="thead-dark">
                <tr>
                    <th>번호</th>
                    <th>등록일</th>
                    <th>등록자</th>
                    <th>공지사항제목</th>
                    <th>상단고정여부</th>
                    <th>관리</th>                   
                </tr>
            </thead>
            
            <tbody>
                <tr>
                    <td>3</td>
                    <td>2024-02-02</td>
                    <td>admin1</td>
                    <td>공지사항 제목 3</td>
                    <td>Y</td>
                    <td>
                        <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#changeNotice">수정</button>
                        <button type="button" class="btn btn-outline-danger" onclick="deleted();">삭제</button>
                    </td>
                </tr>

                <tr>
                    <td>2</td>
                    <td>2024-01-22</td>
                    <td>admin2</td>
                    <td>공지사항 제목 2</td>
                    <td>Y</td>
                    <td>
                        <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#changeNotice">수정</button>
                        <button type="button" class="btn btn-outline-danger" onclick="deleted();">삭제</button>
                    </td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>2024-01-09</td>
                    <td>admin1</td>
                    <td>공지사항 제목 1</td>
                    <td>N</td>
                    <td>
                        <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#changeNotice">수정</button>
                        <button type="button" class="btn btn-outline-danger" onclick="deleted();">삭제</button>
                    </td>
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
    </div>
    
    
    
    <!-- 공지사항수정 Modal -->
    <div class="modal" id="changeNotice">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">공지사항 수정</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="" method="post">
			            <table>
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
			            </table>
			        </form>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary modifyBtn" style="float: right;" data-dismiss="modal">수정</button>
                </div>
            </div>

            
        </div>
    </div>
    
    
    <script>

    	function deleted(){
    		let d = prompt("등록된 영화를 삭제하시겠습니까? \n 삭제를 희망하시면 삭제라고 입력해주세요");
    		
    		if(d=="삭제"){
                alert("영화가 삭제되었습니다.")
            }else{
                alert("잘못입력하셨습니다. 다시 확인해주세요")
            }
    	}
    	
    	function noticeEnroll(){
    		location.href = "../ad_community/commuNoticeEnroll.jsp";
    	}
    
   		
   		
   		
   </script>

</body>
</html>