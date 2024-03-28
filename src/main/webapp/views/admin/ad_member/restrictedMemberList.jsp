<%@page import="com.fp.admin.model.vo.ReportedMember"%>
<%@page import="java.util.List"%>
<%@page import="com.fp.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	List<ReportedMember> pageList = (List<ReportedMember>) request.getAttribute("pageList");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용제한회원 조회</title>
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

.modal-text{
    margin-right: 10px;
    font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
    <div class="container-fluid">
    	<div class="container">
        <div id="title" class="title">
            <h1 id="select-user-title">이용제한회원 조회</h1>
        </div>
        <hr>
        <div class="container">
            <table class="table table-bordered">
                <thead>
                <tr class="table-active">
                    <th>번호</th>
                    <th>아이디</th>
                    <th>사유</th>
                    <th>분류</th>
                    <th>활동중지 기간</th>
                    <th>변경</th>
                </tr>
                </thead>
                <tbody>
                	<% if(pageList.isEmpty()){ %>
                	<tr>
                		<td colspan="7" style="text-align: center;">존재하는 회원이 없습니다.</td>
                	</tr>
                	<% } else { %>
	                	<% for(ReportedMember rm : pageList){ %>
		                <tr>
		                    <td><%=rm.getMemNo()%></td>
		                    <td><%=rm.getMemId()%></td>
		                    <td><%=rm.getLimitReason()%></td>
		                    <td><%=rm.getActivityStatus()%></td>
		                    <td><%=rm.getSuspendDate()%></td>
		                    <td style="display: none;"><input type="hidden" class="reportReason"></td>
		                    <td style="display: none;"><input type="hidden" class="suspendDate"></td>
		                    <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#suspendModal<%=rm.getMemNo()%>" class="updateBtn" onclick="selectSuspendModal.call(this);">변경</button></td>
		                </tr>
		                <% } %>
	                <% } %>
                <!-- <tr>
                    <td>999</td>
                    <td>user999</td>
                    <td>사유1</td>
                    <td>활동중지 3일</td>
                    <td>2024/02/15 - 2024/02/17</td>
                    <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#suspendModal">변경</button></td>
                </tr>
                <tr>
                    <td>999</td>
                    <td>user999</td>
                    <td>사유1</td>
                    <td>활동중지 3일</td>
                    <td>2024/02/15 - 2024/02/17</td>
                    <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#suspendModal">변경</button></td>
                </tr>
                <tr>
                    <td>999</td>
                    <td>user999</td>
                    <td>사유1</td>
                    <td>활동중지 3일</td>
                    <td>2024/02/15 - 2024/02/17</td>
                    <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#suspendModal">변경</button></td>
                </tr>
                <tr>
                    <td>999</td>
                    <td>user999</td>
                    <td>사유1</td>
                    <td>활동중지 3일</td>
                    <td>2024/02/15 - 2024/02/17</td>
                    <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#suspendModal">변경</button></td>
                </tr>
                <tr>
                    <td>999</td>
                    <td>user999</td>
                    <td>사유1</td>
                    <td>활동중지 3일</td>
                    <td>2024/02/15 - 2024/02/17</td>
                    <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#suspendModal">변경</button></td>
                </tr>
                <tr>
                    <td>999</td>
                    <td>user999</td>
                    <td>사유1</td>
                    <td>활동중지 3일</td>
                    <td>2024/02/15 - 2024/02/17</td>
                    <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#suspendModal">변경</button></td>
                </tr>
                <tr>
                    <td>999</td>
                    <td>user999</td>
                    <td>사유1</td>
                    <td>강제탈퇴</td>
                    <td style="text-align: center;"> - </td>
                    <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#suspendModal">변경</button></td>
                </tr>
                <tr>
                    <td>999</td>
                    <td>user999</td>
                    <td>사유1</td>
                    <td>활동중지 3일</td>
                    <td>2024/02/15 - 2024/02/17</td>
                    <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#suspendModal">변경</button></td>
                </tr>
                <tr>
                    <td>999</td>
                    <td>user999</td>
                    <td>사유1</td>
                    <td>활동중지 3일</td>
                    <td>2024/02/15 - 2024/02/17</td>
                    <td><button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#suspendModal">변경</button></td>
                </tr> -->
                </tbody>
            </table>
        </div>
        <!-- Modal -->
        <%for(ReportedMember rm : pageList){%>
        <div class="modal fade" id="suspendModal<%=rm.getMemNo()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">회원활동상태 관리</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    </div>
                    <div class="modal-body">
                        <div class="container" style="margin-bottom: 20px;">
                            <span class="modal-text">닉네임</span>
                            <span><%=rm.getMemNickName()%></span>
                        </div>
                        <div class="container" style="margin-bottom: 20px;">
                            <span class="modal-text">신고사유</span>
                            <span><%=rm.getLimitReason()%></span>
                        </div>
                        <div class="container" style="margin-bottom: 20px;">
                            <span class="modal-text">활동중지 기간</span>
                            <span>
                                <select>
                                    <option value="0" selected>없음</option>
                                    <option value="3">3일</option>
                                    <option value="7">7일</option>
                                    <option value="15">15일</option>
                                    <option value="30">30일</option>
                                </select>
                            </span>
                        </div>
                    </div>
                    <div class="modal-footer d-flex justify-content-center ">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="changeStatus(<%=rm.getMemNo()%>);">변경</button>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
        
		 <script>
		 	function changeStatus(memNo){
		 		 // option 요소
		 		 var opVal = document.querySelector('select');
		 		 
		 		// 선택된 option의 값(value)
		        var opValue = opVal.value;
		        console.log("선택된 값:", opValue);
		 		
		        $.ajax({
		        	url:"<%=contextPath%>/changeDate.re",
		        	data:{
		        		memNo:memNo, //회원번호
		        		opValue:opValue // 활동제한 변경일 (바차, 스트링)
		        	},
		        	success:function(result){
		        		if(result > 0){
		 					alert('변경이 완료되었습니다.');	
		        		}
		        	},error:function(){
		        		console.log("회원 활동중지기간 변경 ajax 실패")
		        	}
		        })
		 		
		 	}
		 	
		 	function selectSuspendModal(){
		 		 let memId = $(this).closest("tr").find("td:nth-child(2)").text();
		 	     //console.log(memId);
		 	};
		 </script>

        <div class="d-flex justify-content-center container">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
	                <% if(pi.getCurrentPage() == 1){ %>
	                	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                <% } else { %>
	                    <li class="page-item"><a class="page-link" href="<%= contextPath %>/rslist.me?page=<%=pi.getCurrentPage() - 1%>">Previous</a></li>
	                <% } %>    
                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                    <% if(p == pi.getCurrentPage()){ %>
	                    	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                    <% } else { %>
	                    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/rslist.me?page=<%= p %>"><%= p %></a></li>
	                    <% } %>
                    <% } %>
                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    <% } else { %>
                    	<li class="page-item"><a class="page-link" href="<%= contextPath %>/rslist.me?page=<%= pi.getCurrentPage() + 1%>">Next</a></li>
                  	<% } %>
                  </ul>
            </nav>
        </div>
    </div>
 </div>
</body>
</html>