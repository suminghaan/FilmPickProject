<%@page import="com.fp.inquiry.model.vo.Inquiry"%>
<%@page import="java.util.List"%>
<%@page import="com.fp.common.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	List<Inquiry> pageList = (List<Inquiry>) request.getAttribute("pageList");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 확인</title>
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

#table-head > tr > th{
    border-top: 1px solid rgb(67, 58, 58);
    border-bottom: 1px solid black;
    background-color: rgba(239, 239, 239, 0.58);
}

#table-body >  tr > td{
    border-top: 1px solid black;
}

tr[class*='reply']{
    display: none;
}

tr[class^='inquiry']:hover{
    cursor: pointer;
}

#modify-reply1, #modify-reply2{
    display: none;
    white-space: pre-wrap;
}
</style>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
    	<div class="container-fluid">
    		<div class="container">
        <div id="title" class="title">
            <h1 id="select-user-title">1:1문의 확인</h1>
        </div>
        <hr>
            <div class="container">
            <table class="table ">
                <thead id="table-head">
                <tr class="table-active">
                    <th>번호</th>
                    <th>제목</th>
                    <th>상태</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <tbody id="table-body">
                <% if(pageList.isEmpty()){ %>
                <tr>
                	<td colspan="5" style="text-align: center;">문의글이 존재하지 않습니다.</td>
                </tr>
                	<% } else { %>
	                	<% for(int i = 0; i < pageList.size(); i++){ 
						    Inquiry in = pageList.get(0);
						%>
						<!-- 제목행 -->
						<tr class="inquiry3">
						    <td><%=pageList.get(i).getInqryNo()%></td>
						    <td><%=pageList.get(i).getInqryTitle()%></td>
						    <td>
						        <% if(pageList.get(i).getInqryStatus().equals("답변대기")){ %>
						            <button type="button" class="btn btn-outline-primary btn-sm disabled">답변대기</button>
						        <% } else { %>
						            <button type="button" class="btn btn-primary btn-sm disabled">답변완료</button>
						        <% } %>
						    </td>
						    <td><%=pageList.get(i).getInqryDate()%></td>
						</tr>
						<!-- 문의행 -->
						<tr class="write-reply1">
						    <td colspan="5" rowspan="1" style="height: 100px;">
						        <div class="container" style="margin-top: 25px;">
						            <%=pageList.get(i).getInqryContent()%><br><br>
						            
						            <%if(pageList.get(i).getOriginName() != null){ %>
						                <img style="width: 300px; height: 300px;" src="<%=contextPath+ "/" + pageList.get(i).getAtUrl()%>">
						                <a href="<%=contextPath+ "/" + pageList.get(i).getAtUrl()%>" download="<%= pageList.get(i).getOriginName() %>"><br><%= pageList.get(i).getOriginName() %></a>
						            <%} %>
						            
						        </div>
						    </td>
						</tr>
						
						<% if(pageList.get(i).getInqryStatus().equalsIgnoreCase("답변대기")) { %>  
						<tr class="write-reply1">
							<form action="<%= contextPath %>/adupdate.iq" method="post">
						        <input type="hidden" value="<%= pageList.get(i).getInqryNo() %>" name="inqryNo">
						        <td colspan="5" rowspan="1" style="height: 100px;">
						            <div class="container">
						                <textarea id="modify-reply1" class="form-control" name="inquiryAnswer" rows="6" placeholder="답변을 작성해주세요" style="resize: none;" id="inquiryAnswer"></textarea>
						            </div>
						            <div class="d-flex justify-content-end container">
						                <button type="submit" class="btn btn-secondary btn-sm" style="margin-top: 10px;" id="updateInQuiry">작성</button>
						            </div>
						        </td>
						    </form>
						</tr>
						<% } else { %>
						<tr class="reply">
						    <td colspan="5" rowspan="1" style="height: 100px;">
						        <div class="container">
						            <p style="color: rgb(41, 128, 185); font-weight: bold;">답변</p>
					            <form action="<%= contextPath %>/adupdate.iq" method="post">
						            <input type="hidden" value="<%= pageList.get(i).getInqryNo() %>" name="inqryNo">
						            <p id="reply-text1" class="reply-text<%=i%>"><%= pageList.get(i).getInqryAContent() %><br><br></p>
						            <textarea id="modify-reply2" name="inquiryAnswer" class="form-control modify-reply<%=i%>" style="height: 300px;"></textarea>
						        </div>
						        <div class="d-flex justify-content-end container">
						            <button type="button" class="btn btn-secondary btn-sm modifyBtn<%=i%>" style="margin-top: 10px; margin-right: 20px;" id="modifyBtn1">수정</button>
						            <button type="submit" class="btn btn-secondary btn-sm registBtn<%=i%>" style="margin-top: 10px; margin-right: 20px; display: none;" id="registBtn1" onclick="confirm('답변을 수정하시겠습니까?')">등록</button> 
						            <button type="button" class="btn btn-secondary btn-sm deleteBtn<%=i%>" style="margin-top: 10px;" id="deleteBtn1" onclick="confirm('답변을 삭제하시겠습니까?')">삭제</button>
						        </div>
						        </form>	
						    </td>
						</tr>
						<% } %> 
						<script>
						    $(function(){
						        $('.modifyBtn<%=i%>').click(function(){
						            const replyText = $('.reply-text<%=i%>').html().replace(/<br\s*\/?>/g,"\n");
						            $('.reply-text<%=i%>').hide();
						            $('.modify-reply<%=i%>').show();
						            $('.modify-reply<%=i%>').val(replyText);
						            
						            $(this).hide();
						            $('.registBtn<%=i%>').show();
						            $('.deleteBtn<%=i%>').hide();
						        });
						    });
						    $(function(){
						    	// location.href = '<%=contextPath%>/xx.xx';
						    });
						</script>
						<% } %>
		                <% } %>
               
                </tbody>
            </table>
            </div>
            <!-- ------------------ 페이징바 --------------------------- -->
            <div class="d-flex justify-content-center container">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
	                <% if(pi.getCurrentPage() == 1){ %>
	                	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                <% } else { %>
	                    <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.iq?page=<%=pi.getCurrentPage() - 1%>">Previous</a></li>
	                <% } %>    
                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                    <% if(p == pi.getCurrentPage()){ %>
	                    	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                    <% } else { %>
	                    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.iq?page=<%= p %>"><%= p %></a></li>
	                    <% } %>
                    <% } %>
                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    <% } else { %>
                    	<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.iq?page=<%= pi.getCurrentPage() + 1%>">Next</a></li>
                  	<% } %>
                  </ul>
            </nav>
        </div>
    </div>

    <script>
        
		 $(function(){
			    $('.inquiry3').click(function(){
			        const $writeReply = $(this).next(); // 문의내용
			        const $reply = $(this).next().next(); // 답변내용 또는 답변작성textarea
			        
			        const buttonText = $(this).find('.btn').text().trim(); // 버튼의 텍스트 가져오기
			        
			        $writeReply.slideToggle(); // 슬라이드 토글
			        $reply.slideToggle();
			        
			    });
			});

        
        
        
    </script>
    	</div>
</body>
</html>