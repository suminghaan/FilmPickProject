<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.fp.common.model.vo.Attachment" %>
<%@ page import="com.fp.common.model.vo.PageInfo" %>
<%@ page import="com.fp.board.model.vo.Board" %>
<%@ page import="com.fp.board.model.vo.Report" %>
<%@ page import="java.util.List" %>
    
<% List<Board> list = (List<Board>)request.getAttribute("list"); %>
<% List<Report> rlist = (List<Report>)request.getAttribute("rlist"); %>
<% PageInfo pi = (PageInfo)request.getAttribute("pi"); %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고된 게시글 목록</title>

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
	
    .reportContent {
        text-align: center; /* 텍스트를 가운데로 정렬 */
    }

    .reportDetail {
        margin: 0 auto; /* 가운데 정렬을 위해 좌우 마진을 자동으로 설정 */
    }

	
</style>


</head>
<body>

	<!-- Header start -->
	<%@ include file="/views/admin/common/header.jsp" %>
	<!-- Header end -->
	
	<!-- section start -->
	<div class="bodyBox">
		<h1>신고된 게시글 목록</h1>
	    <hr>
	
	    <div class="d-flex justify-content-center container">
	        <span>검색</span>&nbsp;&nbsp;&nbsp;
	        <input type="text" id="searchInput" class="input" placeholder="제목으로 검색어를 입력해주세요" name="keyword">
	        <button type="button" onclick="search();">
	            <img src="<%=contextPath %>/views/admin/img/icon_search.png">
	        </button>
    	</div>
	    <br>
	    
	    <br>
	    
	    <table class="table" id="reportBoardList">
            <thead class="thead-dark">
                <tr>
                    <th>번호</th>
                    <th>등록일</th>
                    <th>등록자 아이디</th>
                    <th>게시글 제목</th>
                    <th>조회수</th>
                    <th>신고수</th>
                    <th>구분</th>
                    <th>관리</th>
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
	                <tr class="reportList">
	                    <td><%=bo.getbNo() %></td>
	                    <td><%=bo.getbRegistDate() %></td>
	                    <td><%=bo.getMemId() %></td>
	                    <td><%=bo.getbTitle() %></td>
	                    <td><%=bo.getbReadCount() %></td>
	                    <td><%=bo.getReportCount() %></td>
	                    <td><%=bo.getbCategory() %></td>
	                    <td><button type="button" class="btn btn-outline-warning" onclick="reportBoard();">신고회원관리</button></td>
	                </tr>
	
	                <!-- 글(.reportList)를 누르면 나오는 세부 내용  -->
	                <tr class="reportContent">
	                    <td colspan="2"></td>
	                    <td colspan="4"><div>
	                        <table class="reportDetail">
	                            <tr>
	                                <th width="100px">제목</th>
	                                <td colspan="3"><%=bo.getbTitle() %></td>
	                            </tr>
	                            <tr>
	                                <th>게시글 내용</th>
	                                <td colspan="3">
	                                    <p style="min-height: 200px;">
	                                        <%=bo.getbContent() %>
	                                    </p>
	                                </td>
	                            </tr>	     
	                            <% if(bo.getFileOriginName() != null){ %>                       
	                            <tr>
	                                <th>게시글에 등록된 첨부파일</th>
	                                <td colspan="3">
	                                    <a href="<%=contextPath %>/<%=bo.getFilePath() + bo.getFileChangeName() %>" download="<%=bo.getFileOriginName()%>"><%=bo.getFileOriginName() %></a>
	                                </td>
	                            </tr>
	        					<%} %>
	        					
	        					<% for(Report r :rlist) { %>
	        						<% if(bo.getbNo() == r.getReportBoardNo()) {%>
		                            <tr>
		                                <th>신고 내용</th>
		                                <td colspan="3">                            
		                                    <div>
		                                        <p>신고자 회원번호 : <%=r.getReportMemNo() %></p>
		                                        <p>신고 내용 : <%=r.getReportContent() %></p>
		        
		                                    </div>                                  
		                                </td>
		                            </tr>
		                            <% } %>
	                            <% } %>
	                            <tr>
	                                <td colspan="3"></td>
	                                <td>
	                                <% if((bo.getbStatus()).equals("N")) {%>
	                                    <a href="<%=contextPath %>/reportBlind.co?bno=<%=bo.getbNo() %>" class="btn btn-outline-danger btn-sm" onclick="alert('해당 게시글을 블라인드 처리합니다.')">블라인드처리</a>
	                                <%}else{ %>
	                                	<button class="btn btn-outline-danger btn-sm" disabled>블라인드처리</button>
	                                <%} %>
	                                
	                                
	                                </td>
	                            </tr>
	                        </table>
	                    </div></td>
	                </tr>
					<%} %>
	          <%} %>
            </tbody>

        </table>
    
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
	                <li class="page-item"><a class="page-link" href="<%=contextPath%>/reportBoardList.co?page=<%=pi.getCurrentPage() -1%>">Previous</a></li>
	                <% } %>
	                
	                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
	                	<% if(p == pi.getCurrentPage()) { %>
	                	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                	<%}else { %>
	                	<li class="page-item"><a class="page-link" href="<%=contextPath%>/reportBoardList.co?page=<%=p%>"><%= p %></a></li>
	                	<% } %>
	                <% } %>
	                
	                <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
	                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                <% }else { %>
	                <li class="page-item">
	                <a class="page-link" href="<%=contextPath %>/reportBoardList.co?page=<%=pi.getCurrentPage() +1 %>" aria-label="Next">
	                    <span aria-hidden="true">&raquo;</span>
	                </a>
	                </li>
	                <% } %>
		            </ul>
		        </nav>
		    </div>
	    </div>
    
    

    <script>
    
	  //검색기능 ajax
		function search(){
	    		$.ajax({
	    			type:'post',
	    			url : "<%=contextPath%>/reportBoardSearch.co",
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
	    								+ "<td>" + list[i].MemId + "</td>"
	    								+ "<td>" + list[i].bTitle + "</td>"
	    								+ "<td>" + list[i].bReadCount + "</td>"
	    								+ "<td>" + list[i].ReportCount + "</td>"
	    								+ "<td>" + list[i].bCategory + "</td>"
	    								+ "<td>" 
	    								+ "<button type='button' class='btn btn-outline-warning' onclick='reportBoard();'>신고회원관리</button>"
	    		                        + "</td>"
	    								+"</tr>";
	    					}
	    				}else{
	    					value += "<tr><td colspan='7'>신고된 게시글이 없습니다.</td></tr>";
	    				}
	    				
	    				
	    				$("#reportBoardList tbody").html(value);
	    			},
	    			error:function(){
	    				console.log("목록 조회 ajax 실패");
	    			}
	    		})
	    	}
  
  
	  // 신고회원관리 버튼 지우가 페이지 구현하면 링크 연결 예정 
        function reportBoard(){
   			location.href = "<%=contextPath%>/rplist.me?page=1";
   		}
    </script>

	<!-- 게시글 눌렀을때 나오는 상세 내용 -->
    <script>
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