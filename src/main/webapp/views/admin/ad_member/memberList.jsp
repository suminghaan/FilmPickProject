<%@page import="com.fp.member.model.vo.Member"%>
<%@page import="com.fp.common.model.vo.PageInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	List<Member> pageList = (List<Member>) request.getAttribute("pageList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
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
.userId:hover{
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
    <div class="container-fluid">
		    <div class="container">
        <div id="title" class="title">
            <h1 id="select-user-title">회원 조회</h1>
        </div>
        <hr>
        <div class="d-flex justify-content-center container">
            <span>아이디</span>&nbsp;&nbsp;&nbsp;
            <input type="text" placeholder="아이디를 입력해주세요">
            <button type="button">
                <img src="<%=contextPath%>/views/admin/ad_resources/img/icon_search.png">
            </button>          
        </div>
        <div class="d-flex justify-content-end container" style="margin: 20px;">
            <img src="<%=contextPath%>/views/admin/ad_resources/img/icon_filter.png" style="margin-right: 10px;">
            <div class="custom-control custom-switch">
			  <input type="checkbox" class="custom-control-input" id="humanSwitch">
			  <label class="custom-control-label" for="humanSwitch" style="margin-right: 50px;">휴면회원만 조회</label>
			</div>
			
			<div class="custom-control custom-switch">
			  <input type="checkbox" class="custom-control-input" id="level1">
			  <label class="custom-control-label" for="level1" style="margin-right: 50px;">Level 1</label>
			</div>
			
			<div class="custom-control custom-switch">
			  <input type="checkbox" class="custom-control-input" id="level2">
			  <label class="custom-control-label" for="level2" style="margin-right: 50px;">Level 2</label>
			</div>
			
			<div class="custom-control custom-switch">
			  <input type="checkbox" class="custom-control-input" id="level3">
			  <label class="custom-control-label" for="level3" style="margin-right: 50px;">Level 3</label>
			</div>
			
			<div class="custom-control custom-switch">
			  <input type="checkbox" class="custom-control-input" id="level4">
			  <label class="custom-control-label" for="level4" style="margin-right: 50px;">Level 4</label>
			</div>
			
			<div class="custom-control custom-switch">
			  <input type="checkbox" class="custom-control-input" id="level5">
			  <label class="custom-control-label" for="level5" style="margin-right: 50px;">Level 5</label>
			</div>
        </div>
     <form action="<%=contextPath%>/updateLevel.me">
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr class="table-active">
                        <th>번호</th>
                        <th>아이디</th>
                        <th>회원등급</th>
                        <th>리뷰횟수</th>
                        <th>별점평균</th>
                        <th>선호장르</th>
                        <th>휴면여부</th>
                    </tr>
                </thead>
                <tbody>
                	<% if(pageList.isEmpty()){ %>
                	<tr>
                		<td colspan="7" style="text-align: center;">존재하는 회원이 없습니다.</td>
                	</tr>
                	<% } else { %>
                	<% for(Member m : pageList){ %>
                    <tr>
                        <td><%= m.getMemNo() %></td>
                        <td class="userId" onclick="viewMemberPostsPage();" id="userId" name="userId"><%= m.getMemId() %></td>
                        <td>
	                        <select class="form-control" name="userLevel" onchange="updateuserLevel();">
		                    <option value="1" <%= m.getMemLevel() == 1 ? "selected" : "" %>>Level 1</option>
		                    <option value="2" <%= m.getMemLevel() == 2 ? "selected" : "" %>>Level 2</option>
		                    <option value="3" <%= m.getMemLevel() == 3 ? "selected" : "" %>>Level 3</option>
		                    <option value="4" <%= m.getMemLevel() == 4 ? "selected" : "" %>>Level 4</option>
		                    <option value="5" <%= m.getMemLevel() == 5 ? "selected" : "" %>>Level 5</option>
	                        </select>
                    	</td>
                         <td><%= m.getReviewContentCnt() %></td>
                        <td><%= m.getAvgLikePoint() %></td>
                        <td><%= m.getPrefGenre() %></td>
                        <td><%= m.getDormantStatus() %></td>
                    </tr>
                    <% } %>
                    <% } %>
                </tbody>
            </table>
        </div><!-- 
        <div class="d-flex justify-content-end container">
            <button type="submit" class="btn btn-secondary btn-sm" style="margin-bottom: 10px;" onclick="alert('user999의 회원등급 수정이 완료되었습니다.')">수정</button>
        </div> -->
        </form>
        <div class="d-flex justify-content-center container">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
	                <% if(pi.getCurrentPage() == 1){ %>
	                	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                <% } else { %>
	                    <li class="page-item"><a class="page-link" href="<%= contextPath %>/selectList.me?page=<%=pi.getCurrentPage() - 1%>">Previous</a></li>
	                <% } %>    
                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                    <% if(p == pi.getCurrentPage()){ %>
	                    	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                    <% } else { %>
	                    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/selectList.me?page=<%= p %>"><%= p %></a></li>
	                    <% } %>
                    <% } %>
                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    <% } else { %>
                    	<li class="page-item"><a class="page-link" href="<%= contextPath %>/selectList.me?page=<%= pi.getCurrentPage() + 1%>">Next</a></li>
                  	<% } %>
                  </ul>
            </nav>
        </div>
    </div>
   </div>
   
   <script>
   
   		function viewMemberPostsPage(){
   			location.href = "memberBoardPostView.jsp";
   		};
   		
   		function updateuserLevel(){
   	        // select 태그내에 onchange 이벤트 발생시 실행될 함수
   		 
   		}; 
   		
   		document.addEventListener('DOMContentLoaded', function() { // 휴면회원 조회용 스크립트
   			const customSwitch = document.getElementById('humanSwitch');
   			let tableBody = document.querySelector('tbody');
            const originalTable = tableBody.innerHTML;
            
   		    customSwitch.addEventListener('change', function() {
            tableBody.innerHTML = ''; // 테이블 내용 초기화
   		        if (this.checked) {
   		        	$.ajax({
   		   		 		url: '<%=contextPath%>/filter.me',
   		   		 		success: function(list){
   		   		 			for(let i = 0; i < list.length; i++){
   		   		 				let row = '<tr>'
   		   		 							+ '<td>' + list[i].memNo + '</td>'
   		   		 							+ '<td>' + list[i].memId + '</td>'
   		   		 							+ '<td>' 
	   		   		 						+ '<select class="form-control" name="userLevel" onchange="updateuserLevel();">' 
		   		                            + '<option value="1"' + (list[i].memLevel === 1 ? ' selected' : '') + '>Level 1</option>' 
		   		                            + '<option value="2"' + (list[i].memLevel === 2 ? ' selected' : '') + '>Level 2</option>' 
		   		                            + '<option value="3"' + (list[i].memLevel === 3 ? ' selected' : '') + '>Level 3</option>' 
		   		                            + '<option value="4"' + (list[i].memLevel === 4 ? ' selected' : '') + '>Level 4</option>' 
		   		                            + '<option value="5"' + (list[i].memLevel === 5 ? ' selected' : '') + '>Level 5</option>' 
		   		                            + '</select>' 
		   		                            + '</td>'
			   		                        + '<td>' + list[i].reviewContentCnt + '</td>' 
			   	                            + '<td>' + list[i].avgLikePoint + '</td>' 
			   	                            + '<td>' + list[i].prefGenre + '</td>' 
			   	                            + '<td>' + list[i].dormantStatus + '</td>'
			   	                            + '</tr>';
   		   		 			tableBody.innerHTML += row;
   		   		 			};
   			   		 		
   		   		 		},
   		   		 		error: function(){
   		   		 			console.log('ajax 통신 실패');
   		   		 		}
   		   		 	});
   		        } else {
   		            tableBody.innerHTML = originalTable;
   		        }
   		    });
   		});
   </script>
</body>
</html>