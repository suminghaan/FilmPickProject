<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "com.fp.board.model.vo.Reply" %>
<%@ page import = "com.fp.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Reply>list = (List<Reply>)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
  <main>
  
    <%@ include file="/views/common/header.jsp" %>

   <div class="content_wrap" style="background-color: black;">
      <div class="content">


        

    <div class="container">

        <h3>작성댓글 목록</h3>
        <div class="btn-group" role="group" aria-label="Basic example">
        <button onclick="location.href='<%=contextPath%>/myPlist.me?page=1'" type="button" class="btn btn-outline-light me-2" id="plist_btn" style="width:100px; margin-right:-8px;">글</button>
        <button onclick="location.href='<%=contextPath%>/myClist.me?page=1'" type="button" class="btn btn-outline-light me-2" id="clist_btn" style="width:100px; margin-left:-8px;">댓글</button>
		</div>
        <table class="table table-hover" id="myContentList">
          <thead>
            <tr>
              <th width="100px">댓글번호</th>
              <th width="700px">댓글내용</th>
              <th width="200px">작성일</th>
            </tr>
          </thead>
          <tbody>
            <%if(list.isEmpty()){ %>
          	<!-- case1. 조회된 댓글이 없을 경우 -->
          	<tr>
          		<td colspan="3" style="text-align:center;">작성한 댓글이 없습니다.</td>
          	</tr>
          	
          	<%}else{ %>
          	<!-- case2. 조회된 댓글이 있을 경우 -->
          		<%for(Reply re : list){ %>
          		<tr onclick="reply(<%=re.getReBoNo()%>);">
          			<td><%=re.getReplyNo()%></td>
          			<td><%=re.getReplyContent()%></td>
          			<td><%=re.getEnrollDate()%></td>
          		</tr>
          		<%} %>
          	<%} %>
          </tbody>
        </table>
        
        <script>
        		function reply(boardNo) {
        			location.href="<%=contextPath%>/detail.bo?no=" + boardNo;
        		}
        </script>      
      </div>


     <!-- 페이징바 영역 -->
        <ul class="pagination justify-content-center">
          
          <%if(pi.getCurrentPage() == 1){ %>
          <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
          <%}else{ %>
          <li class="page-item"><a class="page-link" href="<%=contextPath%>/myClist.me?page=<%=pi.getCurrentPage()-1%>">Previous</a></li>
          <%} %>
          
          <%for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
          	
          	<%if(p == pi.getCurrentPage()){ %>
          	<li class="page-item active"><a class="page-link" href="#"><%=p %></a></li>
          	<%}else{ %>
          	<li class="page-item"><a class="page-link" href="<%=contextPath%>/myClist.me?page=<%=p%>"><%=p %></a></li>
          	<%} %>
          <%} %>
          
          <%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
		  <li class="page-item"><a class="page-link" href="#">Next</a></li>
		  <%}else{ %>    
		  <li class="page-item"><a class="page-link" href="<%=contextPath%>/myClist.me?page=<%=pi.getCurrentPage()+1%>">Next</a></li>
		  <%} %>      
        </ul>
      </div>




      </div>
    </div>


    <%@ include file="/views/common/footer.jsp" %>


  </main>
  <script src="../../resources/assets/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>