<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.fp.common.model.vo.Attachment" %>
<%@ page import="com.fp.common.model.vo.PageInfo" %>
<%@ page import="com.fp.board.model.vo.Board" %>
<%@ page import="java.util.List" %>
    
<% List<Board> list = (List<Board>)request.getAttribute("list"); %>
<% PageInfo pi = (PageInfo)request.getAttribute("pi"); %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블라인드처리된 게시글 리스트</title>
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

	.blindDetail{
		display: none;
	}
</style>

</head>
<body>

	<!-- Header start -->
	<%@ include file="/views/admin/common/header.jsp" %>
	<!-- Header end -->
	
	<!-- section start -->
	<div class="bodyBox">
		<h1>블라인드 처리된 게시글 목록</h1>
	    <hr>
	
	    <div class="d-flex justify-content-center container">
	        <span>검색</span>&nbsp;&nbsp;&nbsp;
	        <input type="text" id="searchInput" class="input" placeholder="제목으로 검색어를 입력해주세요" name="keyword">
	        <button type="button" onclick="search();">
	            <img src="<%=contextPath %>/views/admin/img/icon_search.png">
	        </button>
    	</div>
	    <br>
	    
	    <div>
		    <table class="table table-hover" id="blindBoardList">
	            <thead class="thead-dark">
	                <tr>
	                    <th>번호</th>
	                    <th>등록일</th>
	                    <th>등록자 아이디</th>
	                    <th>게시글 제목</th>
	                    <th>조회수</th>
	                    <th>댓글수</th>
	                    <th>구분</th>
	                    <th>해제</th>
	                </tr>
	            </thead>
	            
	            <tbody>
				
	                <!-- case1. 조회된 게시글 없을 경우 -->
	                <% if(list.isEmpty()){ %>
	               
	                <tr>
	                    <td colspan="7" style="text-align: center;">존재하는 게시글이 없습니다.</td>
	                </tr>
	                <% }else { %>            
	
	                <!-- case2. 조회된 게시글 있을 경우  -->
	                <% for(Board bo: list) { %>
		                <tr class="blindContent">
		                    <td><%=bo.getbNo() %></td>
		                    <td><%=bo.getbRegistDate() %></td>
		                    <td><%=bo.getMemId() %></td>
		                    <td><%=bo.getbTitle() %></td>
		                    <td><%=bo.getbReadCount() %></td>
		                    <td><%=bo.getReplyCount() %></td>
		                    <td><%=bo.getbCategory() %></td>
		                    <td>                      	
	                        	<a href="<%=contextPath %>/removeBlind.co?bNo=<%=bo.getbNo() %>" class="btn btn-outline-warning" onclick="removeBlind();">블라인드해제</button>
	                    	</td>
		                </tr>
		                <%} %>
	                <%} %>
					<!-- 글(.blindContent)를 누르면 나오는 해당 게시글 내용 -->
					<% for(Board board: list) { %>
					<tr class="blindDetail">
						<td colspan="6">
							<div class="form-group">
								<label for="content"><h6>게시글 내용</h6></label>
								<textarea class="form-control" name="borderContent" id="content" cols="50" rows="8"><%=board.getbContent() %></textarea>
							</div>
							<div>
								<label for="comment"><h6>댓글</h6></label>
								<%%>
								<input type="text" class="form-control-plaintext" id="comment" value="">								
							<!--  	<input type="text" class="form-control-plaintext" id="comment" placeholder="달려있는 댓글">		-->											
								<%  %>
							</div>
						</td>
					</tr>
					<% } %>
				<!--  
	                <tr class="blindContent">
	                    <td>2</td>
	                    <td>2024.03.08</td>
	                    <td>user02</td>
	                    <td>제목2</td>
	                    <td>10</td>
	                    <td>7</td>
	                    <td>잡담</td>
	                    <td>                      	
                        	<button type="button" class="btn btn-outline-warning" onclick="alert('블라인드처리를 해제하시겠습니까? \n해지시 다시 사용자에게 보여지게됩니다.')">블라인드해제</button>
                    	</td>
	                </tr>
					<!-- 글(.blindContent)를 누르면 나오는 해당 게시글 내용 
					<tr class="blindDetail">
						<td colspan="6">
							<div class="form-group">
								<label for="content"><h6>게시글 내용</h6></label>
								<textarea class="form-control" name="borderContent" id="content" cols="50" rows="8">작성되어있는 게시글 내용</textarea>
							</div>
							<div>
								<label for="comment"><h6>댓글</h6></label>
								<input type="text" class="form-control-plaintext" id="comment" placeholder="달려있는 댓글">								
								<input type="text" class="form-control-plaintext" id="comment" placeholder="달려있는 댓글">													
							</div>
						</td>
					</tr>
						-->
	            </tbody>
	
	        </table>
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
	                <li class="page-item"><a class="page-link" href="<%=contextPath%>/blindList.co?page=<%=pi.getCurrentPage() -1%>">Previous</a></li>
	                <% } %>
	                
	                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
	                	<% if(p == pi.getCurrentPage()) { %>
	                	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                	<%}else { %>
	                	<li class="page-item"><a class="page-link" href="<%=contextPath%>/blindList.co?page=<%=p%>"><%= p %></a></li>
	                	<% } %>
	                <% } %>
	                
	                <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
	                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                <% }else { %>
	                <li class="page-item">
	                <a class="page-link" href="<%=contextPath %>/blindList.co?page=<%=pi.getCurrentPage() +1 %>" aria-label="Next">
	                    <span aria-hidden="true">&raquo;</span>
	                </a>
	                </li>
	                <% } %>
		            </ul>
		        </nav>
		    </div>
	    </div>
	    
	    
    </div>
  
	<!-- section end -->

	<script>
	
	//검색기능 ajax
		function search(){
	    		$.ajax({
	    			type:'post',
	    			url : "<%=contextPath%>/blindBoardSearch.co",
	    			data:{
	    				keyword:$("#searchInput").val()
	    			},
	    			success:function(list){
	    				
	    				let value = ""
	    				
	    				console.log(list);
	    				
	    				if(list.length > 0){
	    					for(let i=0; i<list.length; i++){
	    						value += "<tr>"
	    								+ "<td>" + list[i].bNo + "</td>"
	    								+ "<td>" + list[i].bRegistDate + "</td>"
	    								+ "<td>" + list[i].MemId() + "</td>"
	    								+ "<td>" + list[i].bTitle() + "</td>"
	    								+ "<td>" + list[i].bReadCount() + "</td>"
	    								+ "<td>" + list[i].ReplyCount() + "</td>"
	    								+ "<td>" + list[i].bCategory() + "</td>"
	    		                        +"</tr>";
	    					}
	    				}else{
	    					value += "<tr><td colspan='7'>해당하는 블라인드 게시글이 없습니다.</td></tr>";
	    				}
	    				
	    				
	    				$("#blindBoardList tbody").html(value);
	    			},
	    			error:function(){
	    				console.log("목록 조회 ajax 실패");
	    			}
	    		})
	    	}
	
	
	
		$(function(){
			$(".blindContent").click(function(){
				const $c = $(this).next();

				if($c.css("display") == "none"){
					$c.siblings(".blindDetail").hide();
					//$c.slideDown();
					//$c.css("display", "table-row");
					$c.show();
				}else{
					$c.hide();
				}
			})
		})
		
		// 블라인드 해제
		function removeBlind(){
			alert("해당 게시글 블라인드처리를 해제합니다.")
		}
	</script>

</body>
</html>