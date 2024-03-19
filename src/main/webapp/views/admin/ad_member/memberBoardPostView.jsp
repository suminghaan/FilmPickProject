<%@page import="com.fp.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.fp.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	List<Board> pageList = (List<Board>) request.getAttribute("pageList");
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

.user-level{
	display: flex;
	flex-direction: row;
}
</style>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
    <div class="container-fluid">
    	<div class="container">
        <div class="container user-info">
            <div class="userprofile1">
                <img src="<%=contextPath%>/views/admin/ad_resources/img/profile_person.png" style="width: 70%;">
            </div>
            <div class="userprofile2">
                <div class="container user-profile-nickname">
                    <span class="user-profile2-text" style="font-weight: bold;">닉네임</span>
                </div>
                <div class="container user-profile-nickname user-level">
                	<div>
                    	<select class="form-control" style="width: 100px; margin-top: 10px;">
                    		<option value="1">Level 1</option>
                    		<option value="2">Level 2</option>
                    		<option value="3">Level 3</option>
                    		<option value="4">Level 4</option>
                    		<option value="5">Level 5</option>
                    	</select>
                    </div>
                    <div style="display: flex;">    
                    	<button class="btn btn-dark btn-sm" style="align-self: center; margin: 10px;">수정</button>
                    </div>	
                </div>
                <div class="container user-profile-totalWrite" style="margin-top: 20px;">
                    <span>총 게시글 개수 <b>55</b>개</span>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="container" style="margin-top: 15px; padding-left: 0px;">
                <button type="button" class="btn btn-dark rounded-0 shadow" onclick="location.href='/film/views/admin/ad_member/memberBoardPostView.jsp'">게시글</button><button type="button" class="btn btn-outline-dark rounded-0 shadow" onclick="location.href='/film/views/admin/ad_member/memberReplyPostView.jsp'">댓글</button><button type="button" class="btn btn-outline-dark rounded-0 shadow" onclick="location.href='/film/views/admin/ad_member/memberReviewPostView.jsp'">리뷰</button>            </div>
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
                	<tr><td colspan="5" style="text-align: center;">존재하는 회원이 없습니다.</td></tr>
                	<% } else { %>
                	<% for(Board b : pageList){ %>
                    <tr>
                        <td><%= b.getbNo() %></td>
                        <td>
                            <%= b.getbTitle() %>
                            <div class="container" style="margin-top: 10px;"><img src="<%=contextPath%>/views/admin/ad_resources/img/board_content_img.png">
                                <span class="board-content"><%= b.getbConment() %></span>
                            </div>
                        </td>
                        <td><%= b.getMemNo() %></td>
                        <td><%= b.getbRegistDate() %></td>
                        <td><%= b.getbReadCount() %></td>
                    </tr>
                    <% } %>
                	<% } %>
                </tbody>
            </table>
        </div>
        <div class="d-flex justify-content-center container">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
	                <% if(pi.getCurrentPage() == 1){ %>
	                	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                <% } else { %>
	                    <li class="page-item"><a class="page-link" href="<%= contextPath %>/selectlist.me?page=<%=pi.getCurrentPage() - 1%>">Previous</a></li>
	                <% } %>    
                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                    <% if(p == pi.getCurrentPage()){ %>
	                    	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                    <% } else { %>
	                    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/selectlist.me?page=<%= p %>"><%= p %></a></li>
	                    <% } %>
                    <% } %>
                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    <% } else { %>
                    	<li class="page-item"><a class="page-link" href="<%= contextPath %>/selectlist.me?page=<%= pi.getCurrentPage() + 1%>">Next</a></li>
                  	<% } %>
                  </ul>
            </nav>
        </div>
    </div>
    </div>
</body>
</html>