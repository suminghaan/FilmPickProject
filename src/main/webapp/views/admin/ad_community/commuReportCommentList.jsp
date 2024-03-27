<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.fp.common.model.vo.Attachment" %>
<%@ page import="com.fp.common.model.vo.PageInfo" %>
<%@ page import="com.fp.board.model.vo.Reply" %>
<%@ page import="com.fp.board.model.vo.Report" %>
<%@ page import="java.util.List" %>
    
<% List<Reply> list = (List<Reply>)request.getAttribute("list"); %>
<% List<Report> rlist = (List<Report>)request.getAttribute("rlist"); %>
<% PageInfo pi = (PageInfo)request.getAttribute("pi"); %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고된 댓글 목록</title>

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

    .reportContent{
        display: none;
    }

    .reportList:hover{
        background-color: lightcoral;

    }

    .reportDetail{
        text-align: left !important;
    }
	
</style>


</head>
<body>

	<!-- Header start -->
	<%@ include file="/views/admin/common/header.jsp" %>
	<!-- Header end -->
	
	<!-- section start -->
	<div class="bodyBox">
		<h1>신고된 댓글 목록</h1>
	    <hr>
	
	    <div class="d-flex justify-content-center container">
	        <span>검색</span>&nbsp;&nbsp;&nbsp;
	        <input type="text" id="searchInput" class="input" placeholder="제목으로 검색어를 입력해주세요" name="keyword">
	        <button type="button" onclick="search();">
	            <img src="<%=contextPath %>/views/admin/img/icon_search.png">
	        </button>
    	</div>
	    
	    <br>
	    
	    <table class="table" id="reportReplyList">
            <thead class="thead-dark">
                <tr>
                    <th>번호</th>
                    <th>등록일</th>
                    <th>등록자 아이디</th>
                    <th>댓글내용</th>
                    <th>신고수</th>
                    <th>블라인드여부</th>
                    <th>관리</th>
                </tr>
            </thead>
            
            <tbody>

                <!-- case1. 조회된 게시글 없을 경우 -->
                <% if(list.isEmpty()){ %>
                     <tr>
                         <td colspan="7" style="text-align: center;">존재하는 댓글이 없습니다.</td>
                     </tr>
				<% }else { %>

                <!-- case2. 조회된 게시글 있을 경우  -->
                <% for(Reply re: list) { %>
                <tr class="reportList">
                    <td><%=re.getReplyNo() %></td>
                    <td><%=re.getEnrollDate() %></td>
                    <td><%=re.getReMemNo() %></td>
                    <td><%=re.getReplyContent() %></td>
                    <td><%=re.getReport() %></td>
                    <td><%=re.getbStatus() %></td>
                    <td><button type="button" class="btn btn-outline-warning" onclick="reportBoard();">신고회원관리</button></td>
                </tr>

                <!-- 글(.reportList)를 누르면 나오는 세부 내용  -->
                <tr class="reportContent">
                    <td colspan="2"></td>
                    <td colspan="4"><div>
                        <table class="reportDetail">
                            <tr>
                                <th>댓글 내용</th>
                                <td colspan="3">
                                    <p style="min-height: 200px;">
                                        <%=re.getReplyContent() %>
                                    </p>
                                </td>
                            </tr>
                            <% for(Report r : rlist) { %>
                            <% if(re.getReplyNo() == r.getReportBoardNo()) { %>
                            <tr>
                                <th>신고 내용</th>
                                <td colspan="3">                            
                                    <div>
                                        <p>신고자 아이디 : <%=r.getReportMemNo() %></p>
                                        <p>신고 내용 : <%=r.getReportContent() %></p>
        
                                    </div>                                
                                </td>
                            </tr>
                            	<% } %>
                            <% } %>
                            <tr>
                                <td colspan="3"></td>
                                <td>
                                <% if((re.getbStatus()).equals("N")) {%>
                                    <a href="<%=contextPath %>/reportCommentBlind.co?rno=<%=re.getReplyNo() %>" class="btn btn-outline-danger btn-sm" onclick="alert('해당 게시글을 블라인드 처리합니다.')">블라인드처리</a>
                                <%}else{ %>
                                	<button class="btn btn-outline-danger btn-sm" disabled>블라인드처리</button>
                                <%} %>	
                                </td>
                            </tr>
            		</tbody>

        		</table>
        		<%} %>
	          <%} %>
    
    <!-- section end -->
    
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
	                <li class="page-item"><a class="page-link" href="<%=contextPath%>/reportCommentList.co?page=<%=pi.getCurrentPage() -1%>">Previous</a></li>
	                <% } %>
	                
	                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
	                	<% if(p == pi.getCurrentPage()) { %>
	                	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                	<%}else { %>
	                	<li class="page-item"><a class="page-link" href="<%=contextPath%>/reportCommentList.co?page=<%=p%>"><%= p %></a></li>
	                	<% } %>
	                <% } %>
	                
	                <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
	                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                <% }else { %>
	                <li class="page-item">
	                <a class="page-link" href="<%=contextPath %>/reportCommentList.co?page=<%=pi.getCurrentPage() +1 %>" aria-label="Next">
	                    <span aria-hidden="true">&raquo;</span>
	                </a>
	                </li>
	                <% } %>
		            </ul>
		        </nav>
		    </div>
	    </div>
    
    

    <script>
        function reportBoard(){
   			location.href = "<%=contextPath%>/rplist.me?page=1";
   		}
    </script>

    <script>
  //검색기능 ajax
	function search(){
    		$.ajax({
    			type:'post',
    			url : "<%=contextPath%>/reportCommentSearch.co",
    			data:{
    				keyword:$("#searchInput").val()
    			},
    			success:function(list){
    				
    				let value = ""
    				
    				console.log(list);
    				
    				if(list.length > 0){
    					for(let i=0; i<list.length; i++){
    						value += "<tr>"
    								+ "<td>" + list[i].replyNo + "</td>"
    								+ "<td>" + list[i].enrollDate + "</td>"
    								+ "<td>" + list[i].reMemNo + "</td>"
    								+ "<td>" + list[i].replyContent + "</td>"
    								+ "<td>" + list[i].report + "</td>"
    								+ "<td>" + list[i].boCategory + "</td>"
    		                        +"</tr>";
    					}
    				}else{
    					value += "<tr><td colspan='6'>신고된 게시글이 없습니다.</td></tr>";
    				}
    				
    				
    				$("#reportReplyList tbody").html(value);
    			},
    			error:function(){
    				console.log("목록 조회 ajax 실패");
    			}
    		})
    	}

  		// 댓글 눌렀을때 나오는 상세 내용 
        $(function(){
            $(".reportList").click(function(){
                const $r = $(this).next();

                if($r.css("display") == "none"){
                    $r.siblings(".reportContent").hide();
                    $r.show();
                }else{
                    $r.hide();
                }
            })
        })
    </script>


</body>
</html>