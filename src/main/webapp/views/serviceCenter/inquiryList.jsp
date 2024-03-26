<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fp.common.model.vo.PageInfo" %>
<%@ page import="com.fp.inquiry.model.vo.Inquiry" %>
<%@ page import="java.util.List" %>
<%
	// NoticeListController Servlet에서 setAttribute로 담아 보낸것들을 jsp에서 꺼내는 구문
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Inquiry> list = (List<Inquiry>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   /*컨텐츠부분*/
    .background{
        margin: 50px;
        background-color: rgb(39, 39, 39);
        min-height: 200px;
    }

    .content_link{
        display: flex;
        padding-top: 50px;
        padding-left: 120px;
    }

    .content_link>a{
        text-decoration: none;
        letter-spacing: 5px;
    }

    .division{
        margin-left: 20px;
        margin-right: 20px;
    }

    .tableback{
        background: white;
        width: 80% !important;
        margin: auto;
    }

    th{background-color:rgb(240, 234, 234);}
    
    tbody{text-align: center;}

    .notice_search{
        margin: auto;
        display: flex;
        justify-content: center;
    }

    .notice_title>th {width: 33%;}

    tbody>tr{cursor: pointer;}

    #head{cursor: pointer;}

    #head>th{border: 1px solid gray}

    .pagination{
        margin-top: 500px;
    }
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp"%>
	
	<!-- 컨텐츠부분 시작 -->
        <section class="content_wrap" style="background: black; min-height: 1250px;">
            <div class="background">
                <div class="content_link"">
                	<!-- 추후 링크 수정 @@@@@@@@@@ -->
                    <a href="<%=contextPath%>/list.no?page=1" style="color: rgb(158, 158, 158);"><h2>공지사항</h2></a> <h2 class="division" style="color: rgb(158, 158, 158);">|</h2>
                    <%if(loginMember != null){ %>
	                <a href="<%=contextPath%>/list.in?page=1" style="color: rgb(255, 255, 255);"><h2>고객센터</h2></a>
	                <%}else{ %>
	                <a href="<%=contextPath%>/loginForm.me" style="color: rgb(255, 255, 255);"><h2>고객센터</h2></a>
	                <%} %>
                </div>
                <br>
                <table class="tableback table table-hover" id="question_list">
                    <thead>
                        <tr class="notice_title" align="center" id="head">
                            <th onclick="question_list();">문의현황확인</th>
                            <th style="color: rgb(158, 158, 158);" onclick="nomv(<%=loginMember.getMemNo()%>);">없는영화신청</th>
                            <th style="color: rgb(158, 158, 158);" onclick="mantoman();">1대1 문의</th>
                        </tr>
                        <tr align="center">
                            <th style="background: white;">제목</th>
                            <th style="background: white;">작성일</th>
                            <th style="background: white;">답변여부</th>
                        </tr>
                    </thead>
                    <tbody>
                        	<%if(list.isEmpty()){ %>
	                        <tr>
	                            <td colspan="3">작성하신 문의사항이 없습니다.</td>
	                        </tr>
	                        <%}else{ %>
	                        	<%for(Inquiry in : list){ %>
		                        <tr onclick="inquiryDetail(<%=in.getInqryNo()%>, <%=pi.getCurrentPage()%>);">
		                            <td><%=in.getInqryTitle() %></td>
		                            <td><%=in.getInqryDate() %></td>
		                            <td><%=in.getInqryStatus() %></td>
	                        	</tr>
	                        	<%} %>
                        	<%} %>
                    </tbody>
                </table>
 
                <br><br><br><br>
                <%if(loginMember != null){ %>
	           <ul class="pagination justify-content-center" style="margin-top: 10px;">
	           	<% if(pi.getCurrentPage() == 1){ %>
	           		<!-- 현재 내가 보고있는 페이지가 1페이지와 일치할경우 클릭불가능 -->
	               	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	               <% }else{ %>
	               	<!-- 클릭시 내가 보고있는 페이지의 이전페이지로 이동하기위한 구문 -->
	               	<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.in?page=<%= pi.getCurrentPage() - 1%>">Previous</a></li>
	               <% } %>
	               <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	              		<%if(p == pi.getCurrentPage()){ %>
	              		<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	              		<%}else{ %>
	              		<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.in?page=<%= p %>"><%= p %></a></li>
	              		<% } %>
	               <% } %>
	               <%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
	               <!-- 현재 내가 보고있는 페이지가 마지막페이지와 일치할 경우 클릭 불가능 -->
	               <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
					<%}else{ %>
	               <li class="page-item"><a class="page-link" href="<%= contextPath%>/list.in?page=<%=pi.getCurrentPage()+1%>">Next</a></li>
					<%} %>
	           </ul>
	           <%} %>

                <div class="notice_search">
                    <form action="" method="">
                        <input type="text" class="notice_search_input" style="width: 400px; height: 40px;  margin-bottom: 50px;">
                        <button type="image" class="notice_search_btn" alt="검색">검색</button>
                    </form>
                </div>

            </div><br><br><br>
        </section>
        <!-- Section end -->

        <script>
        
        	function inquiryDetail(no, p){
        		location.href="<%=contextPath%>/detail.in?no=" + no + "&p=" + p;
        	}

            function question_list(){
                location.href="<%=contextPath%>/list.in?page=1";
            }
            
            function nomv(memNo){
                location.href="<%=contextPath%>/list.noMv?memNo=" + memNo;
            }

            function mantoman(){
                location.href="views/serviceCenter/inquiryWrite.jsp";
            }
            
        </script>
    <!-- 컨텐츠부분 끝 -->
	
	<%@ include file="/views/common/footer.jsp"%>

</body>
</html>