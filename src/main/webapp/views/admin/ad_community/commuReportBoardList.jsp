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
	                                <td colspan="3">현재 조회하고 있는 신고글 제목</td>
	                            </tr>
	                            <tr>
	                                <th>게시글 내용</th>
	                                <td colspan="3">
	                                    <p style="min-height: 200px;">
	                                        현재 조회하고 있는 게시글의 내용
	                                    </p>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>게시글에 등록된 첨부파일</th>
	                                <td colspan="3">
	                                    <input type="file">
	                                </td>
	                            </tr>
	        
	                            <tr>
	                                <th>신고 내용</th>
	                                <td colspan="3">                            
	                                    <div>
	                                        <p>신고자 아이디 : 아이디보여지는공간</p>
	                                        <p>신고 내용 : </p>
	        
	                                    </div>
	        
	                                    <div>
	                                        <p>신고자 아이디 : 아이디보여지는공간</p>
	                                        <p>신고 내용 : </p>                                          
	                                    </div>                                   
	                                </td>
	                            </tr>
	                            <tr>
	                                <td colspan="3"></td>
	                                <td>
	                                    <button type="button" class="btn btn-outline-danger btn-sm" onclick="alert('블라인드 게시글로 처리되었습니다.')">블라인드처리</button>
	                                </td>
	                            </tr>
	                        </table>
	                    </div></td>
	                </tr>
					<%} %>
	          <%} %>
	          <!--  
                <tr class="reportList">
                    <td>2</td>
                    <td>2024.03.08</td>
                    <td>user02</td>
                    <td>제목2</td>
                    <td>10</td>
                    <td>1</td>
                    <td>잡담</td>
                    <td><button type="button" class="btn btn-outline-warning" onclick="reportBoard();">신고회원관리</button></td>
                </tr>

                <!-- 글(.reportList)를 누르면 나오는 세부 내용  
                <tr class="reportContent">
                    <td colspan="2"></td>
                    <td colspan="4">
                        <div>
                            <table class="reportDetail">
                                <tr>
                                    <th width="100px">제목</th>
                                    <td colspan="3">현재 조회하고 있는 신고글 제목</td>
                                </tr>
                                <tr>
                                    <th>게시글 내용</th>
                                    <td colspan="3">
                                        <p style="min-height: 200px;">
                                            현재 조회하고 있는 게시글의 내용
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <th>게시글에 등록된 첨부파일</th>
                                    <td colspan="3">
                                        <input type="file">
                                    </td>
                                </tr>
            
                                <tr>
                                    <th>신고 내용</th>
                                    <td colspan="3">                            
                                        <div>
                                            <p>신고자 아이디 : 아이디보여지는공간</p>
                                            <p>신고 내용 : </p>
            
                                        </div>
            
                                        <div>
                                            <p>신고자 아이디 : 아이디보여지는공간</p>
                                            <p>신고 내용 : </p>                                          
                                        </div>                                   
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
				-->
            </tbody>

        </table>
    
    <!-- section end -->
    
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
  
  
        function reportBoard(){
   			location.href = "../ad_member/reportMemberList.jsp";
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