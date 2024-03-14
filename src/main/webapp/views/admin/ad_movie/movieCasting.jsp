<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인물관리</title>

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
		<h1>인물 관리</h1>
    <hr>

    <div class="d-flex justify-content-center container">
        <span>검색</span>&nbsp;&nbsp;&nbsp;
        <input type="text" placeholder="검색어를 입력해주세요">
        <button type="button">
            <img src="../img/icon_search.png">
        </button>          
    </div>
    
    <br><br>

    <div class="list">
        <button class="btn btn-outline-secondary listBtn" data-toggle="modal" data-target="#addCasting">신규등록</button>
    </div>
    
    <br>
   
    <div class="d-flex justify-content-end container" style="margin: 20px;">                      
        <img src="../img/icon_filter.png" style="margin-right: 10px;">
        <select class="form-control" style="width: 130px">
            <option>배우</option>
            <option>감독</option>
        </select>
    </div>

    <div>
        <table class="table table-hover" >
            <thead class="thead-dark">
                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>직업</th>
                    <th>출생연도</th>
                    <th>국적</th>
                    <th>사진등록여부</th>
                    <th>관리</th>                   
                </tr>
            </thead>
            
            <tbody>
                <tr>
                    <td>3</td>
                    <td>류준열</td>
                    <td>배우</td>
                    <td>1988.02.30</td>
                    <td>한국</td>
                    <td>Y</td>
                    <td>
                        <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#changeCasting">수정</button>
                        <button type="button" class="btn btn-outline-danger" onclick="deleted();">삭제</button>
                    </td>
                </tr>

                <tr>
                    <td>2</td>
                    <td>김태리</td>
                    <td>배우</td>
                    <td>1999.07.22</td>
                    <td>한국</td>
                    <td>Y</td>
                    <td>
                        <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#changeCasting">관리</button>
                        <button type="button" class="btn btn-outline-danger" onclick="deleted();">삭제</button>
                    </td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>최동훈</td>
                    <td>감독</td>
                    <td>1976.06.04</td>
                    <td>한국</td>
                    <td>Y</td>
                    <td>
                        <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#changeCasting">관리</button>
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

    <!-- 인물추가 Modal -->
    <div class="modal" id="addCasting">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">인물 추가</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <table class="addC">
                        <tr>
                            <th><label for="pName">이름</label></th>
                            <td><input type="text" id="pName" placeholder="인물명을 입력해주세요."></td>
                        </tr>
                
                        <tr>
                            <th><label for="pFile">사진</label></th>
                            <td><input type="file" id="pFile"></td>
                        </tr>
                
                        <tr>
                            <th><label for="pDate">출생연도</label></th>
                            <td><input type="date" id="pDate"></td>
                        </tr>
                
                        <tr>
                            <th><label for="pNation">국적</label></th>
                            <td><input type="text" id="pNation"></td>
                        </tr>
                
                        <tr>
                            <th>직업</th>
                            <td>
                                <input type="checkbox" id="actor">
                                <label for="actor">배우</label>
                                <input type="checkbox" id="director">
                                <label for="director">연출자</label>
                            </td>
                        </tr>

                    </table>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary modifyBtn" style="float: right;" data-dismiss="modal">추가</button>
                </div>
            </div>

            
        </div>
    </div>

    <!-- 인물수정 Modal -->
    <div class="modal" id="changeCasting">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">등록된 내용 수정</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <table class="changeC">
                        <tr>
                            <th><label for="pName">이름</label></th>
                            <td><input type="text" id="pName" placeholder="입력되어있는 인물명"></td>
                        </tr>
                
                        <tr>
                            <th><label for="pFile">사진</label></th>
                            <td><input type="file" id="pFile"></td>
                        </tr>
                
                        <tr>
                            <th><label for="pDate">출생연도</label></th>
                            <td><input type="date" id="pDate"></td>
                        </tr>
                
                        <tr>
                            <th><label for="pNation">국적</label></th>
                            <td><input type="text" id="pNation"></td>
                        </tr>
                
                        <tr>
                            <th>직업</th>
                            <td>
                                <input type="checkbox" id="actor">
                                <label for="actor">배우</label>
                                <input type="checkbox" id="director">
                                <label for="director">연출자</label>
                            </td>
                        </tr>

                    </table>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary modifyBtn" style="float: right;" data-dismiss="modal">수정</button>
                </div>
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
    
   		
   		
   		
   </script>

</body>
</html>