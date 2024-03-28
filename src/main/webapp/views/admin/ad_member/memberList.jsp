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
            <input type="text" placeholder="아이디를 입력해주세요" id="searchUserId">
            <button type="button" id="btnSearch">
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
			  <input type="checkbox" class="custom-control-input levelSwitch" id="level1Switch" value="1">
			  <label class="custom-control-label" for="level1Switch" style="margin-right: 50px;">Level 1</label>
			</div>
			
			<div class="custom-control custom-switch">
			  <input type="checkbox" class="custom-control-input levelSwitch" id="level2Switch" value="2">
			  <label class="custom-control-label" for="level2Switch" style="margin-right: 50px;">Level 2</label>
			</div>
			
			<div class="custom-control custom-switch">
			  <input type="checkbox" class="custom-control-input levelSwitch" id="level3Switch" value="3">
			  <label class="custom-control-label" for="level3Switch" style="margin-right: 50px;">Level 3</label>
			</div>
			
			<div class="custom-control custom-switch">
			  <input type="checkbox" class="custom-control-input levelSwitch" id="level4Switch" value="4">
			  <label class="custom-control-label" for="level4Switch" style="margin-right: 50px;">Level 4</label>
			</div>
			
			<div class="custom-control custom-switch">
			  <input type="checkbox" class="custom-control-input levelSwitch" id="level5Switch" value="5">
			  <label class="custom-control-label" for="level5Switch" style="margin-right: 50px;">Level 5</label>
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
                <tbody id="selectUserTable">
                	<% if(pageList.isEmpty()){ %>
                	<tr>
                		<td colspan="7" style="text-align: center;">존재하는 회원이 없습니다.</td>
                	</tr>
                	<% } else { %>
                	<% for(Member m : pageList){ %>
                    <tr>
                        <td><%= m.getMemNo() %></td>
                        <td class="userId" id="userId" name="userId"><%= m.getMemId() %></td>
                        <td>
	                        <%-- <select class="form-control" name="userLevel" onchange="updateuserLevel();">
		                    <option value="1" <%= m.getMemLevel() == 1 ? "selected" : "" %>>Level 1</option>
		                    <option value="2" <%= m.getMemLevel() == 2 ? "selected" : "" %>>Level 2</option>
		                    <option value="3" <%= m.getMemLevel() == 3 ? "selected" : "" %>>Level 3</option>
		                    <option value="4" <%= m.getMemLevel() == 4 ? "selected" : "" %>>Level 4</option>
		                    <option value="5" <%= m.getMemLevel() == 5 ? "selected" : "" %>>Level 5</option>
	                        </select> --%>
	                        <%= m.getMemLevel() == 1? "Level 1" : m.getMemLevel() == 2? "Level 2" : m.getMemLevel() == 3? "Level 3" : m.getMemLevel() == 4? "Level 4" : m.getMemLevel() == 5? "Level 5" : "" %>
	                        
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
        </div>
        </form>
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
   
   <script>
   
   		$(function(){ // 회원 아이디 클릭시 회원 게시글 작성 페이지로 이동
   			$('.userId').click(function(){
   				location.href = '<%=contextPath%>/list.bo?memId=' + $(this).text() + '&page=1';
   			});
   		});
   		
   		document.addEventListener('DOMContentLoaded', function() { // 휴면회원 필터
   			const customSwitch = document.getElementById('humanSwitch');
   			let tableBody = document.getElementById('selectUserTable');
            const originalTable = tableBody.innerHTML;
            
   		    customSwitch.addEventListener('change', function() {
            tableBody.innerHTML = ''; // 테이블 내용 초기화
   		        if (this.checked) {
   		        	$.ajax({
   		   		 		url: '<%=contextPath%>/humanfilter.me',
   		   		 		success: function(list){
   		   		 			for(let i = 0; i < list.length; i++){
   		   		 				let row = '<tr>'
   		   		 							+ '<td>' + list[i].memNo + '</td>'
   		   		 							+ '<td>' + list[i].memId + '</td>'
   		   		 							+ '<td>' 
	   		   		 						+ 'Level ' + list[i].memLevel
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
   
   	<script> // level 1 ~ level 5 필터
   		$(function(){
	   		 $('.custom-control-input').click(function(){  // 클릭된 스위치를 제외한 나머지 스위치 비활성화
	   			 $('.custom-control-input').not(this).prop('checked', false);
	   	     });
	   		 
 	  		 let $originalTable;
	   		 $('.levelSwitch').click(function(){
	            
	   			 if($(this).prop('checked')) {

	 	   			$originalTable =  $('#selectUserTable').html();
	 	            $('#selectUserTable').html(''); // 테이블 내용 초기화
		   			 const $value = $(this).val();
		   			 
		   			$.ajax({
		   				url: '<%=contextPath%>/levelfilter.me',
		   				data: {level: $value},
		   				success: function(list){
		   					for(let i = 0; i < list.length; i++){
	   		   		 				let row = '<tr>'
	   		   		 							+ '<td>' + list[i].memNo + '</td>'
	   		   		 							+ '<td>' + list[i].memId + '</td>'
	   		   		 							+ '<td>' 
		   		   		 						+ 'Level ' + list[i].memLevel
			   		                            + '</td>'
				   		                        + '<td>' + list[i].reviewContentCnt + '</td>' 
				   	                            + '<td>' + list[i].avgLikePoint + '</td>' 
				   	                            + '<td>' + list[i].prefGenre + '</td>' 
				   	                            + '<td>' + list[i].dormantStatus + '</td>'
				   	                            + '</tr>';
	   		   		 		  		$('#selectUserTable').html($('#selectUserTable').html() + row);
   		   		 			};
		   				},
		   				error: function(){
		   					console.log('ajax 통신 실패');
		   				}
		   			});
	   			 } else {
	   				 console.log($originalTable);
	   				 $('tbody').html($originalTable);
	   			 }
	   		 });
   			
   		});
   	</script>
   	
   	<script>
   		$(function(){
   			let $originalTable;
   			
   			$('#btnSearch').click(function(){
   				let $searchIdValue = $('#searchUserId').val(); 
   				$originalTable =  $('#selectUserTable').html();
 	            $('#selectUserTable').html(''); // 테이블 내용 초기화
   				
   				$.ajax({
   					url: '<%=contextPath%>/searchuser.me',
   					data: {memId: $searchIdValue},
   					success: function(list){
   						for(let i = 0; i < list.length; i++){
		   		 				let row = '<tr>'
		   		 							+ '<td>' + list[i].memNo + '</td>'
		   		 							+ '<td>' + list[i].memId + '</td>'
		   		 							+ '<td>' 
	   		   		 						+ 'Level ' + list[i].memLevel
		   		                            + '</td>'
			   		                        + '<td>' + list[i].reviewContentCnt + '</td>' 
			   	                            + '<td>' + list[i].avgLikePoint + '</td>' 
			   	                            + '<td>' + list[i].prefGenre + '</td>' 
			   	                            + '<td>' + list[i].dormantStatus + '</td>'
			   	                            + '</tr>';
		   		 		  		$('#selectUserTable').html($('#selectUserTable').html() + row);
	   		 			};
   					},
   					error: function(){
   						console.log('ajax 통신 실패');
   					}
   					
   				});
   			});
   		});
   	</script>
</body>
</html>