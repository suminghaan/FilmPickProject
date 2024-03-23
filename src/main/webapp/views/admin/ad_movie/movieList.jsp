<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.fp.common.model.vo.Attachment" %>
<%@ page import="com.fp.common.model.vo.PageInfo" %>
<%@ page import="com.fp.movie.model.vo.Movie" %>
<%@ page import="java.util.List" %>
    
<% List<Movie> list = (List<Movie>)request.getAttribute("list"); %>
<% PageInfo pi = (PageInfo)request.getAttribute("pi"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 영화 조회</title>

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
        <h1>등록된 영화 조회</h1>
        <hr>
        
        <div class="d-flex justify-content-center container">
	        <span>검색</span>&nbsp;&nbsp;&nbsp;
	        <input type="text" id="searchInput" class="input" placeholder="제목으로 검색어를 입력해주세요" name="keyword">
	        <button type="button" onclick="search();">
	            <img src="<%=contextPath %>/views/admin/img/icon_search.png">
	        </button>
    	</div>
        
        <br><br>

        <div>
            <table class="table table-hover" id="movieList">
                <thead class="thead-dark">
                    <tr>
                        <th>번호</th>
                        <th>등록일</th>
                        <th>관람등급</th>
                        <th>영화제목</th>
                        <th>개봉일</th>
                        <th>장르</th>
                        <th>관리</th>
                    </tr>
                </thead>
                
                <tbody>
                    <!-- case1. 조회된 영화 없을 경우 -->
                    <% if(list.isEmpty()) { %>
                    <tr>
                        <td colspan="7" style="text-align: center;">존재하는 게시글이 없습니다.</td>
                    </tr>
					<% }else {%>

                    <!-- case2. 조회된 영화 있을 경우  -->
	                    <% for(Movie m : list){ %>
	                    <tr>
	                        <td><%=m.getMvNo() %></td>
	                        <td><%=m.getMvRegistDate() %></td>
	                        <td><%=m.getViewRating() %></td>
	                        <td><%=m.getMvName() %></td>
	                        <td><%=m.getMvOpenDate() %></td>
	                        <td><%=m.getCategoryNames() %></td>
	                        <td>
	                        	<button type="button" class="btn btn-outline-secondary" onclick="movieListDetail();">관리</button>
	                        	<a href="<%=contextPath %>/delete.admo?mvNo=<%=m.getMvNo() %>" class="btn btn-outline-danger" onclick="deleted();">삭제</a>
	                        </td>
	                    </tr>
	                    <%} %>
	                <%} %>

                </tbody>

            </table>
            <br>
            
             </div>
    	</div>  

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
		                <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.admopage=<%=pi.getCurrentPage() -1%>">Previous</a></li>
		                <% } %>
		                
		                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
		                	<% if(p == pi.getCurrentPage()) { %>
		                	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
		                	<%}else { %>
		                	<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.admo?page=<%=p%>"><%= p %></a></li>
		                	<% } %>
		                <% } %>
		                
		                <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
		                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
		                <% }else { %>
		                <li class="page-item">
		                <a class="page-link" href="<%=contextPath %>/list.admo?page=<%=pi.getCurrentPage() +1 %>" aria-label="Next">
		                    <span aria-hidden="true">&raquo;</span>
		                </a>
		                </li>
		                <% } %>
		            </ul>
		        </nav>
		    </div>
             
             
       
    
    <script>
    
    // 검색 ajax 
    function search(){
    		$.ajax({
    			type:'post',
    			url : "<%=contextPath%>/movieSearch.admo",
    			data:{
    				keyword:$("#searchInput").val()
    			},
    			success:function(list){
    				
    				let value = ""
    				
    				if(list.length > 0){
    					for(let i=0; i<list.length; i++){
    						value += "<tr>"
    								+ "<td>" + list[i].mvNo + "</td>"
    								+ "<td>" + list[i].mvRegistDate + "</td>"
    								+ "<td>" + list[i].viewRating + "</td>"
    								+ "<td>" + list[i].mvName + "</td>"
    								+ "<td>" + list[i].mvOpenDate + "</td>"
    								+ "<td>" + list[i].categoryNames + "</td>"
    		                        +"</tr>";
    					}
    				}else{
    					value += "<tr><td colspan='6'>해당하는 영화가 없습니다,</td></tr>";
    				}
    				
    				$("#movieList tbody").html(value);
    			},
    			error:function(){
    				console.log("목록 조회 ajax 실패");
    			}
    		})
    	}

    	// 영화 삭제 알람창
    	function deleted(){
    		let d = prompt("등록된 영화를 삭제하시겠습니까? \n 삭제를 희망하시면 삭제라고 입력해주세요");
    		
    		if(d=="삭제"){
                alert("해당영화를 삭제하겠습니다.")
            }else{
                alert("잘못입력하셨습니다. 다시 확인해주세요")
            }
    	}
    
    	// 영화 상세조회
   		function movieListDetail(){
   			location.href = "<%=contextPath %>/movieListDetail.admo";
   		}
   		
   		
   </script>
	
	<!-- section end -->

</body>
</html>