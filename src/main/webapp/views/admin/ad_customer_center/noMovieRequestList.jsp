<%@page import="com.fp.noMovie.model.vo.NoMovie"%>
<%@page import="java.util.List"%>
<%@page import="com.fp.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	List<NoMovie> pageList = (List<NoMovie>) request.getAttribute("pageList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>없는영화 신청 목록</title>
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

.no-movie-list{
    width: 100%;
    height: 260px;
    box-shadow: 0 0 7px;
    margin-bottom: 40px;
    display: flex;
    flex-direction: column;
    padding: 17px;
    cursor: pointer;
}

.title{
    font-weight: bold;
}

.all-list{
    display: flex;
    flex-direction: row;
}

.item1, .item2{
    flex: 1;
}

.item1 img {
    width: 100%;
    height: auto;
}

.item2{
    margin-top: 5px;
}

.story{
    margin-top: 15px;
    color: rgb(127, 127, 127);
    height: 155px;
}

.item1{
    width: 30px;
}

.item2{
    width: 70%;
    padding: 0px;
    margin-left: 10px;
}

.no-check{
    color: gray;
}

.regist-date{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}

.writer{
    padding: 0px;
}

/* ---------------------- */
<style>
    .approval {
        font-weight: bold;
        color: black;
    }

    /* 승인일 때의 색상 */
    .approval[data-approval="승인"] {
        color: rgb(41, 128, 185);
    }

    /* 거절일 때의 색상 */
    .approval[data-approval="거절"] {
        color: red;
    }

    /* 미확인일 때의 색상 */
    .approval[data-approval="미확인"] {
        color: gray;
    }
</style>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
    <div class="container-fluid">
    	 <div class="container">
        <div id="title" class="title">
            <h1 id="select-user-title">없는영화 신청 목록</h1>
        </div>
        <hr>
        <div class="d-flex justify-content-end container" style="margin: 20px;">
            <img src="<%=contextPath%>/views/admin/ad_resources/img/icon_filter.png" style="margin-right: 10px;">
            <select class="form-control" style="width: 100px">
                <option>승인</option>
                <option>거절</option>
                <option>미확인</option>
            </select>
        </div>
        <div class="container">
            <div class="container">
                	<% if(pageList.isEmpty()){ %>
                		<b>신청 목록이 존재하지 않습니다.</b>
                	<% } else {  %>
                	<% for(NoMovie nm : pageList){ %>
                <div class="no-movie-list all-list" onclick="moveWrite();">
                    <div class="container item1">
                        <h4 class="title"><%= nm.getNmTitle() %></h4>
                        <img src="<%= contextPath + "/" + nm.getNmPoster() %>" class="img-fluid" style="width: 130px;">
                    </div>
                    <div class="container item2">
                        <div class="regist-date">
                            <span style="font-size: 15px;"><span class="title">작성일&nbsp;</span><%= nm.getNmEnrollDate() %></span>
                            <span class="no-check approval" style="justify-content: end;" id="approval" data-approval="<%= 
							    nm.getNmApproval() == null ? " " : 
							    nm.getNmApproval().equals("Y") ? "승인" : 
							    nm.getNmApproval().equals("N") ? "거절" : 
							    nm.getNmApproval().equals("D") ? "미확인" : " " 
							%>">
                            <b>
                            <%= 
	                            nm.getNmApproval() == null ? " " : 
							    nm.getNmApproval().equals("Y") ? "승인" : 
							    nm.getNmApproval().equals("N") ? "거절" : 
							    nm.getNmApproval().equals("D") ? "미확인" : " " 
						    %>
						    </b>
						    </span>
                        </div>
                        <div class="story-writer">
                            <div class="container story">
                                <%= nm.getNmStory() %>
                            </div>
                            <div class="container writer" style="text-align: right;">
                                <b>작성자</b> <%= nm.getMemNickname() %>
                            </div>
                        </div>
                    </div>
                </div>
                    <% } %>
                	<% } %>
            </div>
        </div>
        <div class="container">
            <div class="d-flex justify-content-center container">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
	                <% if(pi.getCurrentPage() == 1){ %>
	                	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                <% } else { %>
	                    <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.nm?page=<%=pi.getCurrentPage() - 1%>">Previous</a></li>
	                <% } %>    
                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                    <% if(p == pi.getCurrentPage()){ %>
	                    	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                    <% } else { %>
	                    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.nm?page=<%= p %>"><%= p %></a></li>
	                    <% } %>
                    <% } %>
                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    <% } else { %>
                    	<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.nm?page=<%= pi.getCurrentPage() + 1%>">Next</a></li>
                  	<% } %>
                  </ul>
            </nav>
        </div>
        </div>
    </div>
   </div>	
   <script>
   		function moveWrite(){
   			location.href = "../ad_customer_center/noMovieRequestList.jsp";
   		}
   </script>
</body>
</html>