<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.fp.common.model.vo.PageInfo" %>
<%@ page import="com.fp.person.model.vo.Person" %>
<%@ page import="java.util.List" %>
<% List<Person> list = (List<Person>)request.getAttribute("list"); %>
<% PageInfo pi = (PageInfo)request.getAttribute("pi"); %>

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
        <input type="text" id="searchInput" class="input" placeholder="이름으로 검색어를 입력해주세요" name="keyword">
        <button type="button" onclick="search();">
            <img src="<%=contextPath %>/views/admin/img/icon_search.png">
        </button>
    </div>
    
    <br><br>

    <div class="list">
        <a href="<%= contextPath %>/enrollCastingForm.admo" class="btn btn-outline-secondary listBtn">신규등록</a>
    </div>
    
    <br>
   
    <div class="d-flex justify-content-end container" style="margin: 20px;">                      
        <img src="<%=contextPath%>/views/admin/ad_resources/img/icon_filter.png" style="margin-right: 10px;">
        <select class="form-control" style="width: 130px">
            <option>배우</option>
            <option>감독</option>
        </select>
    </div>

    <div>
    
        <table class="table table-hover" id="casting">
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
            	<!-- case1. 등록한 공지글이 없을 경우 -->
            	<% if(list.isEmpty()) {  %>
            	<tr>
            		<td colspan="7" style="text-align: center;">등록된 인물이 없습니다.</td>
            	</tr>
            	<% }else {%>
            	<!-- case2. 등록된 공지글이 있을 경우 -->
	            	<% for(Person p: list) { %>
	                <tr>
                    <td><%=p.getpNo() %></td>
                    <td><%=p.getpName() %></td>
                    <td><%=p.getpJob() %></td>
                    <td><%=p.getpBD() %></td>
                    <td><%=p.getpNation() %></td>
                    <% if(p.getpFile() != null){ %>
                    <td>Y</td>
                    <%} else{ %>
                    <td>Y</td>
                    <%} %>
                    <td>
                        <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#changeCasting">수정</button>
                        <button type="button" class="btn btn-outline-danger" onclick="deleted();">삭제</button>
                    </td>
                </tr>
					<%} %>
				<%} %>
                       
            </tbody>

        </table>
	
    

    <!-- 페이징바 영역 -->
        <div class="d-flex justify-content-center container">
	        <nav aria-label="Page navigation example">
	            <ul class="pagination">
	            	
	            	<% if(pi.getCurrentPage() == 1) { %>
	                <li class="page-item disabled">
	                <a class="page-link" href="#" aria-label="Previous">
	                    <span aria-hidden="true">&laquo;</span>
	                </a>
	                </li>
	                <% }else { %>
	                <li class="page-item"><a class="page-link" href="<%=contextPath%>/movieCastingList.admo?page=<%=pi.getCurrentPage() -1%>">Previous</a></li>
	                <% } %>
	                
	                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
	                	<% if(p == pi.getCurrentPage()) { %>
	                	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                	<%}else { %>
	                	<li class="page-item"><a class="page-link" href="<%=contextPath%>/movieCastingList.admo?page=<%=p%>"><%= p %></a></li>
	                	<% } %>
	                <% } %>
	                
	                <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
	                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                <% }else { %>
	                <li class="page-item">
	                <a class="page-link" href="<%=contextPath %>/movieCastingList.admo?page=<%=pi.getCurrentPage() +1 %>" aria-label="Next">
	                    <span aria-hidden="true">&raquo;</span>
	                </a>
	                </li>
	                <% } %>
	            </ul>
	        </nav>
	    </div>
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
                <form action="" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <table class="addC">
                        <tr>
                            <th><label for="pName">이름</label></th>
                            <td><input type="text" id="pName" name="pName" required placeholder="인물명을 입력해주세요."></td>
                        </tr>
                
                        <tr>
                            <th><label for="pFile">사진</label></th>
                            <td><input type="file" id="pFile"></td>
                        </tr>
                
                        <tr>
                            <th><label for="pDate">출생연도</label></th>
                            <td><input type="date" id="pDate" name="birth" required></td>
                        </tr>
                
                        <tr>
                            <th><label for="pNation">국적</label></th>
                            <td><input type="text" id="pNation" name="pNation" required></td>
                        </tr>
                
                        <tr>
                            <th>직업</th>
                            <td>
                                <input type="checkbox" id="actor" name="casting" value="actor">
                                <label for="actor">배우</label>
                                <input type="checkbox" id="director" name="casting" value="director">
                                <label for="director">연출자</label>
                            </td>
                        </tr>

                    </table>
                </div>
        		</form>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary modifyBtn" style="float: right;" data-dismiss="modal">추가</button>
                </div>
            </div>

            
        </div>
    </div>
    
    <div style="display: none;">
    	<!-- 이미지 파일 -->
    	<input type="file" name="upfile1" onchange="loadImg(0);" required>
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
    
    // 검색기능
    function search(){
    		$.ajax({
    			type:'post',
    			url : "<%=contextPath%>/castingSearch.admo",
    			data:{
    				keyword:$("#searchInput").val()
    			},
    			success:function(list){
    				
    				let value = ""
    				
    				if(list.length > 0){
    					for(let i=0; i<list.length; i++){
    						value += "<tr>"
    								+ "<td>" + list[i].pNo + "</td>"
    								+ "<td>" + list[i].pName + "</td>"
    								+ "<td>" + list[i].pJob + "</td>"
    								+ "<td>" + list[i].pBD + "</td>"
    								+ "<td>" + list[i].pNation + "</td>"
    								+ "<td>" + (list[i].pFile != null ? "Y" : "N")+ "</td>"
    		                        +"</tr>";
    					}
    				}else{
    					value += "<tr><td colspan='5'>해당하는 공지사항이 없습니다,</td></tr>";
    				}
    				
    				$("#casting tbody").html(value);
    			},
    			error:function(){
    				console.log("목록 조회 ajax 실패");
    			}
    		})
    	}

    // 삭제할 경우 
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