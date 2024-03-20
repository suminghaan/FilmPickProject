<%@page import="com.fp.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.fp.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	List<Board> pageList = (List<Board>) request.getAttribute("pageList");
	List<Board> userProfile = (List<Board>) request.getAttribute("userProfile");
	String memId = null; // 회원 아이디
	String memNo = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원활동내역 조회</title>
<style>
table{
    margin-top: 20px;
}
.title>h1{
    font-weight: bold;
}
.user-info{
    height: 200px;
    border: 2px solid lightgray;
    margin-top: 80px;
    display: flex;
}
.userprofile1{
    width: 20%;
    display: flex;
    justify-content: center; 
    align-items: center; 
    height: 100%; 
}
.userprofile2{
    width: 80%;
    display: flex;
    flex-direction: column;
    margin-top: 45px;
    margin-bottom: 45px;
}

.user-profile-nickname, .user-profile-totalWrite{
    height: 50%;
    padding: 0px;
}

/* .user-profile-totalWrite{
    height: 50%;
    padding: 0px;
} */

.user-profile2-text{
    margin-right: 10px;
}
#table-body >  tr > td{
        border-top: 1px solid black;
}
#table-head > tr > th{
    border-top: 1px solid rgb(67, 58, 58);
    border-bottom: 1px solid black;
    background-color: rgba(239, 239, 239, 0.58);
}
.board-content{
    margin-top: 5px;
    color: lightgray;
}
</style>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
    <div class="container-fluid">
    	<div class="container">
        <div class="container user-info">
         <% if(userProfile.isEmpty()){ %>
         	<span style="font-weight: bold; font-size: 50px;">회원 정보가 조회되지 않습니다.</span>            
         <% } else { %>
         <% for(Board b : userProfile){ 
        	 memNo = b.getMemNo();
     		 memId = b.getMemId();
         %>
         <div class="userprofile1">
                <img src="<%=contextPath%>/views/admin/ad_resources/img/profile_person.png" style="width: 70%;">
            </div>
            <div class="userprofile2">
                <div class="container user-profile-nickname">
                    <span class="user-profile2-text" style="font-weight: bold;"><%=b.getMemNickname() %></span>
                    <span class="user-profile2-text">|</span>
                    <span><%= b.getMemLevel() == 1? "Level 1" : b.getMemLevel() == 2? "Level 2" : b.getMemLevel() == 3? "Level 3" : b.getMemLevel() == 4? "Level 4" : b.getMemLevel() == 5? "Level 5" : "없음" %></span>
                </div>
                <div class="container user-profile-totalWrite">
                    <span>총 게시글 개수 <b><%= b.getBoardCount() %></b>개</span>
                </div>
            </div><%-- 
             <% memId = b.getMemId(); // 회원 아이디 저장 
             	memNo = b.getMemNo();
             %>--%>
            <% } %>
            <% } %> 
        </div>
        <div class="container">
            <div class="container" style="margin-top: 15px; padding-left: 0px;">
                <button type="button" class="btn btn-outline-dark rounded-0 shadow" onclick="location.href='<%=contextPath%>/list.bo?memId=<%=memId%>&page=1'">게시글</button><button type="button" class="btn btn-dark rounded-0 shadow" onclick="location.href='<%=contextPath%>/list.re?page=1&memNo=<%=memNo%>&memId=<%=memId%>'">댓글</button><button type="button" class="btn btn-outline-dark rounded-0 shadow" onclick="location.href='/film/views/admin/ad_member/memberReviewPostView.jsp'">리뷰</button>
                <hr style="margin: 0px;">
                <div style="margin-top: 10px; margin-bottom: 10px;"><b>댓글 단 게시글</b></div>
            </div>
            <table class="table table" style="margin-top: 0px;">
                <thead id="table-head">
                    <tr class="table-active">
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody id="table-body">
                	<% if(pageList.isEmpty()){ %>
                	<tr><td colspan="5" style="text-align: center;">존재하는 게시글이 없습니다.</td></tr>
                	<% } else { %>
                	<% for(Board b : pageList){ %>
                    <tr>
                        <td><%= b.getbNo() %></td>
                        <td>
                            <%=b.getbTitle()%> [<%=b.getReplyCount() %>]&nbsp;
                                <span class="board-content">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16" style="color: black;">
                                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"/>
                                    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1z"/>
                                  </svg>
                                </span>
                        </td>
                        <td><%=b.getMemNo() %></td>
                        <td><%=b.getbRegistDate() %></td>
                        <td><%=b.getbReadCount() %></td>
                    </tr>
                    <% } %>
                    <% } %>
                    <!-- <tr>
                        <td>552</td>
                        <td>넷플릭스 볼만한 거 추천 부탁드려요 [7]
                        </td>
                        <td>닉네임투</td>
                        <td>24.02.05</td>
                        <td>27</td>
                    </tr>
                    <tr>
                        <td>166</td>
                        <td>넷플릭스 볼만한 거 추천 부탁드려요 [7] </td>
                        <td>닉네임쓰리</td>
                        <td>24.02.05</td>
                        <td>27</td>
                    </tr>
                    <tr>
                        <td>231</td>
                        <td>넷플릭스 볼만한 거 추천 부탁드려요 [7]</td>
                        <td>닉네임포</td>
                        <td>24.02.05</td>
                        <td>27</td>
                    </tr>
                    <tr>
                        <td>643</td>
                        <td>
                            넷플릭스 볼만한 거 추천 부탁드려요 [7]&nbsp;
                                <span class="board-content">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16" style="color: black;">
                                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"/>
                                    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1z"/>
                                  </svg>
                                </span>
                        </td>
                        <td>닉네임파이브</td>
                        <td>24.02.05</td>
                        <td>27</td>
                    </tr>
                    <tr>
                        <td>123</td>
                        <td>넷플릭스 볼만한 거 추천 부탁드려요 [7]</td>
                        <td>닉네임식스</td>
                        <td>24.02.05</td>
                        <td>27</td>
                    </tr>
                    <tr>
                        <td>333</td>
                        <td>넷플릭스 볼만한 거 추천 부탁드려요 [7]</td>
                        <td>닉네임세븐</td>
                        <td>24.02.05</td>
                        <td>27</td>
                    </tr>
                    <tr>
                        <td>555</td>
                        <td>넷플릭스 볼만한 거 추천 부탁드려요 [7]</td>
                        <td>닉네임에잇</td>
                        <td>24.02.05</td>
                        <td>27</td>
                    </tr>
                    <tr>
                        <td>231</td>
                        <td>
                            넷플릭스 볼만한 거 추천 부탁드려요 [7]&nbsp;
                            <span class="board-content">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16" style="color: black;">
                                <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"/>
                                <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1z"/>
                              </svg>
                            </span>
                        </td>
                        <td>닉네임나인</td>
                        <td>24.02.05</td>
                        <td>27</td>
                    </tr>
                    <tr style="border-bottom: 1px solid black;">
                        <td>987</td>
                        <td>넷플릭스 볼만한 거 추천 부탁드려요 [7]</td>
                        <td>닉네임텐</td>
                        <td>24.02.05</td>
                        <td>27</td>
                    </tr> -->
                </tbody>
            </table>
        </div>
        <div class="d-flex justify-content-center container">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
	                <% if(pi.getCurrentPage() == 1){ %>
	                	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                <% } else { %>
	                    <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.re?page=<%=pi.getCurrentPage() - 1%>&memNo=<%=memNo%>">Previous</a></li>
	                <% } %>    
                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                    <% if(p == pi.getCurrentPage()){ %>
	                    	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                    <% } else { %>
	                    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.bo?memId=<%=memId%>&page=<%= p %>&memNo=<%=memNo%>&memId=<%=memId%>"><%= p %></a></li>
	                    <% } %>
                    <% } %>
                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    <% } else { %>
                    	<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.bo?page=<%= pi.getCurrentPage() + 1%>&memNo=<%=memNo%>&memId=<%=memId%>">Next</a></li>
                  	<% } %>
                  </ul>
            </nav>
        </div>
    </div>
    </div>
</body>
</html>