<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fp.common.model.vo.PageInfo" %>
<%@ page import="com.fp.notice.model.vo.Notice" %>
<%@ page import="java.util.List" %>
<%
	// NoticeListController Servlet에서 setAttribute로 담아 보낸것들을 jsp에서 꺼내는 구문
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Notice> list = (List<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	 /* 컨텐츠부분 */
    .background{
        margin: 100px;
        background-color: rgb(39, 39, 39);
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

    tbody>tr{cursor: pointer;}

    .pagination{
        margin-top: 250px;
    }
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
	<!-- Section start -->
    <div class="content_wrap" style="background-color: black; min-height: 1000px;">
      <div class="content">
        <div class="background">
            <div class="content_link"">
            	<!-- 추후 링크 수정 @@@@@@@@@@ -->
                <a href="<%= contextPath %>/list.no?page=1" style="color: rgb(255, 255, 255);"><h2>공지사항</h2></a> <h2 class="division" style="color: rgb(158, 158, 158);">|</h2>
                <a href="../serviceCenter/inquiryList.jsp" style="color: rgb(158, 158, 158);"><h2>고객센터</h2></a>
            </div>
            <br>
            <table class="tableback table table-hover" id="notice_list">
                <thead>
                    <tr align="center">
                        <th>번호</th>
                        <th>구분</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                <% if(list.isEmpty()){ %>
                    <tr>
                        <td colspan="5" style="text-align: center;">작성된 공지사항이 없습니다.</td>
                    </tr>
                <% } else{%>
                	<% for(Notice n : list){ %>
                    <tr onclick="noticeDetail(<%=n.getNoticeNo()%>);">
                        <td><%= n.getNoticeNo() %></td>
                        <td><%= n.getCategory() %></td>
                        <td><%= n.getNoticeTitle() %></td>
                        <td><%= n.getNoticeDate() %></td>
                        <td><%= n.getNoticeReadCount() %></td>
                    </tr>
                    <% } %>
                <%} %>
                </tbody>
            </table>

            <br><br><br><br>
            <ul class="pagination justify-content-center" style="margin-top: 10px;">
            	<% if(pi.getCurrentPage() == 1){ %>
            		<!-- 현재 내가 보고있는 페이지가 1페이지와 일치할경우 클릭불가능 -->
                	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <% }else{ %>
                	<!-- 클릭시 내가 보고있는 페이지의 이전페이지로 이동하기위한 구문 -->
                	<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.no?page=<%= pi.getCurrentPage() - 1%>">Previous</a></li>
                <% } %>
                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
               		<%if(p == pi.getCurrentPage()){ %>
               		<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
               		<%}else{ %>
               		<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.no?page=<%= p %>"><%= p %></a></li>
               		<% } %>
                <% } %>
                <%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                <!-- 현재 내가 보고있는 페이지가 마지막페이지와 일치할 경우 클릭 불가능 -->
                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
 				<%}else{ %>
                <li class="page-item"><a class="page-link" href="<%= contextPath%>/list.no?page=<%=pi.getCurrentPage()+1%>">Next</a></li>
 				<%} %>
            </ul>

            <div class="notice_search">
                <form action="" method="">
                    <input type="text" class="notice_search_input" style="width: 400px; height: 40px;  margin-bottom: 50px;">
                    <button type="image" class="notice_search_btn" alt="검색">검색</button>
                </form>
            </div>
          </div> <br><br>
        </div>

    </div>
    <!-- Section end -->
      
    <!-- Section Script start-->
    <script>
		function noticeDetail(no){
			location.href="<%=contextPath%>/detail.no?no=" + no;
		}
		

    </script>
    <!-- Section Script end-->
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>