<%@page import="com.fp.admin.model.vo.CancelMember"%>
<%@page import="com.fp.common.model.vo.PageInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	List<CancelMember> pageList = (List<CancelMember>) request.getAttribute("pageList");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴회원 조회</title>
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
.table-active{
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
    <div class="container-fluid">
    	<div class="container">
        <div id="title" class="title">
            <h1 id="select-user-title">탈퇴회원 조회</h1>
        </div>
        <hr>
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="table-active"><span style="font-weight: bold;">아이디</span></th>
                        <td><input type="text" name="userId" placeholder="아이디를 입력해주세요" id="userId" style="width: 300px;"></td>
                    </tr>
                </thead>
                    <tbody>
                        <th class="table-active" style="padding-top: 18px;">탈퇴일</th>
                        <td>
                            <input type="date" name="start_date" id="start_date">  -  <input type="date" name="end_date" id="end_date">&nbsp;&nbsp;&nbsp;
                            <div class="btn-group">
                                <button type="button" class="btn btn-outline-dark date" value="1d">오늘</button>
                                <button type="button" class="btn btn-outline-dark date" value="1w">일주일</button>
                                <button type="button" class="btn btn-outline-dark date" value="1m">한달</button>
                                <button type="button" class="btn btn-outline-dark date" value="3m">3개월</button>
                                <button type="button" class="btn btn-outline-dark date" value="all">전체</button>
                            </div>
                        </td>
                    </tbody>
            </table>
            
        </div>
        <div class="d-flex justify-content-center container">
            <button type="button" onclick="selectMem(1);" class="btn btn-secondary btn-lg" style="margin-bottom: 10px;">검색</button>
        </div>
        <script>
            	document.querySelectorAll('.date').forEach(button => {
            		button.addEventListener('click', function(){
            			const value = this.value;
            			const endDate = new Date();
            			let startDate = new Date();
            			if(value == "1d"){
            				startDate.setDate(endDate.getDate());
            			}else if(value == "1w"){
            				startDate.setDate(endDate.getDate() - 7);
            			}else if(value == '1m'){
            				startDate.setDate(endDate.getMonth() - 1);
            			}else if(value == '3m'){
            				startDate.setMonth(endDate.getMonth() - 3);
            			}else if(value == 'all'){
            				document.getElementById('start_date').value = "";
                            document.getElementById('end_date').value = "";
                            return;
            			}
            			document.getElementById('start_date').valueAsDate = startDate;
                        document.getElementById('end_date').valueAsDate = endDate;
            		})
            	})
            </script>
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr class="table-active">
                        <!-- <th>번호</th> -->
                        <th>아이디</th>
                        <th>관리자번호</th>
                        <th>탈퇴일</th>
                    </tr>
                </thead>
                <tbody class="selectText">
						<%if(pageList.isEmpty()) {%>
							<tr>
								<td colspan="7" style="text-align: center;">존재하는 회원이 없습니다.</td>
							</tr>
						<%} else {%>
							<%for (CancelMember cm : pageList) {%>
								<tr>
									<td><%=cm.getMemNo()%></td>
									<td><%=cm.getAdminNo()%></td>
									<td><%=cm.getCancelDate()%></td>
								</tr>
							<%}%>
						<%}%>
				</tbody>
            </table>
        </div>
        <div class="d-flex justify-content-center container">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
	                <% if(pi.getCurrentPage() == 1){ %>
	                	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                <% } else { %>
	                    <li class="page-item"><a class="page-link" href="<%= contextPath %>/cclist.me?page=<%=pi.getCurrentPage() - 1%>">Previous</a></li>
	                <% } %>    
                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                    <% if(p == pi.getCurrentPage()){ %>
	                    	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                    <% } else { %>
	                    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/cclist.me?page=<%= p %>"><%= p %></a></li>
	                    <% } %>
                    <% } %>
                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    <% } else { %>
                    	<li class="page-item"><a class="page-link" href="<%= contextPath %>/cclist.me?page=<%= pi.getCurrentPage() + 1%>">Next</a></li>
                  	<% } %>
                  </ul>
            </nav>
        </div>
    </div>
    </div>
    <script>
    	$(function(){
    		// 날짜 버튼 클릭시 css 변경
    		$('.date').click(function(){
    			 $(this).removeClass('btn-outline-dark').addClass('btn-dark');
    	         $('.date').not($(this)).removeClass('btn-dark').addClass('btn-outline-dark');
    		});
    		
    		// 
    	});
    </script>
    <script>
    // 회원 조회 필터 ajax
    	function selectMem(page){
    		$.ajax({
    			url: "<%= contextPath %>/cmlist.me",
    			type: "post",
    			data: {
    				userId: $("#userId").val(),
    	            start_date: $("#start_date").val(),
    	            end_date: $("#end_date").val(),
    	            page: page
    				},
    			success:function(cml){
    				let value = "";
    				if(cml == null) {
	                	value = "<tr><td colspan='7' style='text-align: center;'>" + "존재하는 회원이 없습니다." + "</td></tr>"
                    } else {
	                	for (let i = 0; i < cml.length; i++) {
	                		console.log(cml);
		                	value += "<tr>"
		                        + "<td>" + cml[i].memNo + "</td>"
		                        + "<td>" + cml[i].adminNo + "</td>"
		                        + "<td>" + cml[i].cancelDate + "</td>"
		                    + "</tr>";
	                    }
                    }
                    $(".selectText").html(value);
    			},
    			error:function(){
    				console.log("목록 조회 ajax 실패");
    			}
    		})
    	}
    </script>
</body>
</html>