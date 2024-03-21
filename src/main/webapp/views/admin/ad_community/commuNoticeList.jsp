<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.fp.common.model.vo.Attachment" %>
<%@ page import="com.fp.common.model.vo.PageInfo" %>
<%@ page import="com.fp.admin.model.vo.Notice" %>
<%@ page import="java.util.List" %>
    
<% List<Notice> list = (List<Notice>)request.getAttribute("list"); %>
<% PageInfo pi = (PageInfo)request.getAttribute("pi"); %>


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
        <input type="text" id="searchInput" class="input" placeholder="제목으로 검색어를 입력해주세요" name="keyword">
        <button type="button" onclick="search();">
            <img src="<%=contextPath %>/views/admin/img/icon_search.png">
        </button>
    </div>
    
    <br>
    
    <div class="list">
        <a href="<%= contextPath %>/enrollForm.co" class="btn btn-outline-secondary listBtn">신규등록</a>
    </div>
    
    <br><br>
    
    <div>
        <table class="table table-hover" id="notice_list">
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
            	<!-- case1. 등록한 공지글이 없을 경우 -->
            	<% if(list.isEmpty()) { %>
            	<tr>
            		<td colspan="6" style="text-align: center;">아직 등록된 공지사항이 없습니다.</td>
            	</tr>
            	<% }else { %>
            	<!-- case2. 등록된 공지글이 있을 경우 -->
	            	<% for(Notice not: list) { %>
	                <tr>
	                    <td><%=not.getNoticeNo() %></td>
	                    <td><%=not.getNoticeDate() %></td>
	                    <td><%=not.getNoticeWriter() %></td>
	                    <td><%=not.getNoticeTitle() %></td>
	                    <td><%=not.getNoticeFix() %></td>
	                    <td>
	                        <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#changeNotice" onclick="update(<%= not.getNoticeNo() %>);">수정</button>
	                        <a href="<%=contextPath %>/delete.co?noticeNo=<%=not.getNoticeNo() %>" class="btn btn-outline-danger" onclick="deleted();">삭제</a>
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
	                <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.co?page=<%=pi.getCurrentPage() -1%>">Previous</a></li>
	                <% } %>
	                
	                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
	                	<% if(p == pi.getCurrentPage()) { %>
	                	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                	<%}else { %>
	                	<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.co?page=<%=p%>"><%= p %></a></li>
	                	<% } %>
	                <% } %>
	                
	                <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
	                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                <% }else { %>
	                <li class="page-item">
	                <a class="page-link" href="<%=contextPath %>/list.co?page=<%=pi.getCurrentPage() +1 %>" aria-label="Next">
	                    <span aria-hidden="true">&raquo;</span>
	                </a>
	                </li>
	                <% } %>
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
                    <form action="<%=contextPath %>/update.aa" method="post" enctype="multipart/form-data" id="update_form">
			            <input type="hidden" id="noticeNo" name="no" value="">
			            <table>
			                <tr>
			                </tr>
			                	<th><label for="title">제목</label></th>
			                    <td colspan="3"><input type="text" id="title" class="form-control" required name="noticeTitle"></td>			                    
			                <tr>
			                	<th><label for="noticeSection">구분</label></th>
			                	<td colspan="3">
			                		<select class="form-control" id="noticeSection" name="category">
					                    <option id="normal" value="1">일반</option>
					                    <option id="event" value="2">이벤트</option>
					                </select>
			                	</td>
			                	
			                </tr>
			                <tr>
			                    <th><label for="noticeContent">공지내용</label></th>
			                    <td colspan="3"><textarea cols="30" rows="10" class="form-control" style="resize: none;" required id="noticeContent" name="noticeContent"></textarea></td>
			                	
			                </tr>
			                <tr>
			                	<th><label for="noticeFile">첨부파일</label></th>
			                	<td colspan="4">
			                		<!-- 기존에 첨부파일 있을 경우 보여지는 기존첨부파일명 -->			                			
			                		<a id="noticeFileOrigin" ></a>
			                		<!-- 새로운 첨부파일 업로드 시 -->
			                		<input type="file" class="form-control-file" id="noticeFile" name="upfile">
			                	</td>
							</tr>
							<tr>
			                	<td colspan="4">
			                		<input type="checkbox" id="fix" name="noticeFix">
			                		<label for="fix">상단고정</label>
			                	</td>
			                </tr>
			            </table>
			        <div>
			        	<button type="submit" class="btn btn-outline-secondary modifyBtn" style="float: right;">수정</button>
			        </div>
			      	</form>
                </div>
        
                <!-- Modal footer -->
               	<!-- 
               	<div class="modal-footer">
                    <button type="submit" class="btn btn-outline-secondary modifyBtn" style="float: right;">수정</button>
                </div>
                </form> -->
            </div>

            
        </div>
    </div>
    
    <script>
    	function search(){
    		$.ajax({
    			type:'post',
    			url : "<%=contextPath%>/noticeSearch.co",
    			data:{
    				keyword:$("#searchInput").val()
    			},
    			success:function(list){
    				
    				let value = ""
    				
    				if(list.length > 0){
    					for(let i=0; i<list.length; i++){
    						value += "<tr>"
    								+ "<td>" + list[i].noticeNo + "</td>"
    								+ "<td>" + list[i].noticeDate + "</td>"
    								+ "<td>" + list[i].noticeWriter + "</td>"
    								+ "<td>" + list[i].noticeTitle + "</td>"
    								+ "<td>" + list[i].noticeFix + "</td>"
    		                        +"</tr>";
    					}
    				}else{
    					value += "<tr><td colspan='5'>해당하는 공지사항이 없습니다,</td></tr>";
    				}
    				
    				$("#notice_list tbody").html(value);
    			},
    			error:function(){
    				console.log("목록 조회 ajax 실패");
    			}
    		})
    	}
    	
    	function update(noticeNo) {
    		console.log("update 함수 실행")
    		$.ajax({
       			type:'post',
       			url: "<%=contextPath%>/noticeDetail.co",
       			data:{
       				notice:noticeNo
       			},
       			success:function(uplist){
       				
       				$("#noticeNo").val(uplist[0].noticeNo);
       				$("#title").val(uplist[0].noticeTitle);

        			if((uplist[0].noticeCategory)== 1){
	   					$("#noticeSection>#normal").attr('selected', true);
	   					console.log($("#normal"));
	   				}else if((uplist[0].noticeCategory)== 2){
	   					$("#noticeSection>#event").attr('selected', true);
	   					console.log($("#event"));
	   				}
 
       				$("#noticeContent").val(uplist[0].noticeContent);
       				
       				
       				if(uplist[0].nfileOriginName != null){
       					$("#noticeFileOrigin").html(uplist[0].nfileOriginName);
       					$("#noticeFileOrigin").attr('download', uplist[0].nfileOriginName);
       					$("#noticeFileOrigin").attr('href', "<%=contextPath%>" + "/" + uplist[0].nfilePath + uplist[0].nfileChangeName);
       				} 
       				
       				
       				if(uplist[0].noticeFix == 'Y'){
       					$("#fix").attr("checked", true);
       				}else {
       					$("#fix").attr("checked", false);
       				}
       				
       				
       			},
       			error:function(){
    				console.log("목록 조회 ajax 실패");
    			}
       		})
   		}
   		
   		
    
    </script>
    
    
    <script>

    	function deleted(){
    		let d = prompt("삭제를 희망하시면 삭제라고 입력해주세요");
    		
    		if(d=="삭제"){
                alert("공지사항을 삭제하겠습니다.")
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