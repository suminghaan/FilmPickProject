<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "com.fp.board.model.vo.Board" %>
<%@ page import = "com.fp.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Board>list = (List<Board>)request.getAttribute("list");
	Board b = (Board)request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <%@ include file="/views/common/header.jsp" %>

    <div class="content_wrap" style="background-color: black;">
      <div class="content">


        
    <div class="container">

        <h3>작성글 목록</h3>

        <table class="table table-hover" id="myPostList">
        
          <thead>
            <tr>
              <th width="100px">글번호</th>
              <th width="100px">카테고리</th>
              <th width="400px">제목</th>
              <th width="200px">작성일</th>
              <th width="100px">조회수</th>
            </tr>
          </thead>
          
          <tbody>
          
          	<%if(list.isEmpty()){ %>
          	<!-- case1. 조회된 게시글이 없을 경우 -->
          	<tr>
          		<td colspan="5" style="text-align:center;">존재하는 게시글이 없습니다.</td>
          	</tr>
          	
          	<%}else{ %>
          	<!-- case2. 조회된 게시글이 있을 경우 -->
          		<%for(Board bo : list){ %>
          		<tr onclick="board(<%=bo.getbNo()%>);">
          			<td><%=bo.getbNo()%></td>
          			<td><%=bo.getbCategory()%></td>
          			<td><%=bo.getbTitle()%></td>
          			<td><%=bo.getbRegistDate()%></td>
          			<td><%=bo.getbReadCount()%></td>
          		</tr>
          		<%} %>
          	<%} %>
          </tbody>
        </table>
        
        <script>
        	$(function(){
        		$("#myPostList>tbody>tr").click(function(){
        			location.href="<%=contextPath%>/detail.bo?no=" + $(this).children().eq(0).text(); 
        		})
        	})
        	
        	//function board(no){
        		//location.href="<%=contextPath%>/detail.bo?=no" + no;
        //	}
        </script>
      </div>
		<!-- 페이징바 영역 -->
        <ul class="pagination justify-content-center">
          
          <%if(pi.getCurrentPage() == 1){ %>
          <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
          <%}else{ %>
          <li class="page-item"><a class="page-link" href="<%=contextPath%>/myPlist.me?page=<%=pi.getCurrentPage()-1%>">Previous</a></li>
          <%} %>
          
          <%for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
          	
          	<%if(p == pi.getCurrentPage()){ %>
          	<li class="page-item active"><a class="page-link" href="#"><%=p %></a></li>
          	<%}else{ %>
          	<li class="page-item"><a class="page-link" href="<%=contextPath%>/myPlist.me?page=<%=p%>"><%=p %></a></li>
          	<%} %>
          <%} %>
          
          <%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
		  <li class="page-item"><a class="page-link" href="#">Next</a></li>
		  <%}else{ %>    
		  <li class="page-item"><a class="page-link" href="<%=contextPath%>/myPlist.me?page=<%=pi.getCurrentPage()+1%>">Next</a></li>
		  <%} %>      
        </ul>

      </div>
    </div>

    <%@ include file="/views/common/footer.jsp" %>


  </main>
  <script src="../../resources/assets/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>