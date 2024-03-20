<%@page import="com.fp.board.model.vo.Board"%>
<%@page import="com.fp.movie.model.vo.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.fp.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	List<Review> pageList = (List<Review>) request.getAttribute("pageList");
	List<Board> userProfile = (List<Board>) request.getAttribute("userProfile");
	String memId = null; // 회원 아이디
	String memNo = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원활동내역 조회</title>
</head>
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

/* .user-profile-totalWrite{
    height: 50%;
    padding: 0px;
} */

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
</style>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
    <div class="container-fluid">
		    <div class="container">
        <div class="container user-info">
         <% if(userProfile.isEmpty()){ %>
         	<span style="font-weight: bold; font-size: 50px;">회원 정보가 조회되지 않습니다.</span>            
         <% } else { %>
         <% for(Board b : userProfile){ 
        	 memNo = b.getMemNo();
     		 memId = b.getMemId();
         %>
         <div class="userprofile1">
                <img src="<%=contextPath%>/views/admin/ad_resources/img/profile_person.png" style="width: 70%;">
            </div>
            <div class="userprofile2">
                <div class="container user-profile-nickname">
                    <span class="user-profile2-text" style="font-weight: bold;"><%=b.getMemNickname() %></span>
                    <span class="user-profile2-text">|</span>
                    <span><%= b.getMemLevel() == 1? "Level 1" : b.getMemLevel() == 2? "Level 2" : b.getMemLevel() == 3? "Level 3" : b.getMemLevel() == 4? "Level 4" : b.getMemLevel() == 5? "Level 5" : "없음" %></span>
                </div>
                <div class="container user-profile-totalWrite">
                    <span>총 게시글 개수 <b><%= b.getBoardCount() %></b>개</span>
                </div>
            </div><%-- 
             <% memId = b.getMemId(); // 회원 아이디 저장 
             	memNo = b.getMemNo();
             %>--%>
            <% } %>
            <% } %> 
        </div>
        <div class="container">
            <div class="container" style="margin-top: 15px; padding-left: 0px;">
                <button type="button" class="btn btn-outline-dark rounded-0 shadow" onclick="location.href='<%=contextPath%>/list.bo?memId=<%=memId%>&page=1'">게시글</button><button type="button" class="btn btn-outline-dark rounded-0 shadow" onclick="location.href='<%=contextPath%>/list.re?page=1&memNo=<%=memNo%>&memId=<%=memId%>'">댓글</button><button type="button" class="btn btn-dark rounded-0 shadow" onclick="location.href='<%=contextPath%>/list.rv?page=1&memNo=<%=memNo%>&memId=<%=memId%>'">리뷰</button>
                <hr style="margin: 0px;">
            </div>
            <table class="table table" style="margin-top: 0px;">
                <thead id="table-head">
                    <tr class="table-active">
                        <th>번호</th>
                        <th>영화명</th>
                        <th>내용</th>
                        <th>별점</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>블라인드</th>
                    </tr>
                </thead>
                <tbody id="table-body">
                	<% if(pageList.isEmpty()){ %>
                	<tr><td colspan="7" style="text-align: center;">존재하는 게시글이 없습니다.</td></tr>
                	<% } else { %>
                	<% for(Review r : pageList){ %>
                    <tr>
                        <td width="60"><%=r.getMvReviewNo() %></td>
                        <td width="180"><%=r.getMvName() %></td>
                        <td width="360">
                            <p>
                            <% // 글자수 50개마다 줄바꿈
				                String reviewContent = r.getReviewContent();
				                for (int i = 0; i < reviewContent.length(); i += 40) {
				                    if (i + 40 < reviewContent.length()) {
				                        out.println(reviewContent.substring(i, i + 40) + "<br>");
				                    } else {
				                        out.println(reviewContent.substring(i));
				                    }
				                }
			                %>
                            </p>
                        </td>
                        <td width="60"><%=r.getLikePoint() %></td>
                        <td width="100"><%=r.getNickname() %></td>
                        <td width="100"><%=r.getReviewDate() %></td>
                        <td width="80"><button type="button" class="btn btn-dark btn-sm" onclick="reviewBlind();">처리</button></td>
                    </tr>
                    <% } %>
                    <% } %>
                    <!-- <tr>
                        <td>555</td>
                        <td>파묘</td>
                        <td>
                            <p>
                            국무총리·국무위원 또는 정부위원은 국회나 그 위원회에 출석하여 국정처리상황을 보고하거나 의견을 진술하고 질문에 응답할 수 있다. 대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다.

                            중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을 제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다.
                            </p>
                        </td>
                        <td>3.5</td>
                        <td>닉네임투</td>
                        <td>24.02.05</td>
                        <td><button type="button" class="btn btn-dark btn-sm" onclick="reviewBlind();">처리</button></td>
                    </tr>
                    <tr>
                        <td>132</td>
                        <td>듄</td>
                        <td>
                            <p>
                            국무총리·국무위원 또는 정부위원은 국회나 그 위원회에 출석하여 국정처리상황을 보고하거나 의견을 진술하고 질문에 응답할 수 있다. 대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다.

                            중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을 제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다.
                            </p>
                        </td>
                        <td>3.5</td>
                        <td>닉네임쓰리</td>
                        <td>24.02.05</td>
                        <td><button type="button" class="btn btn-dark btn-sm" onclick="reviewBlind();">처리</button></td>
                    </tr>
                    <tr>
                        <td>267</td>
                        <td>귀멸의 칼날</td>
                        <td>
                            <p>
                            국무총리·국무위원 또는 정부위원은 국회나 그 위원회에 출석하여 국정처리상황을 보고하거나 의견을 진술하고 질문에 응답할 수 있다. 대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다.

                            중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을 제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다.
                            </p>
                        </td>
                        <td>3.5</td>
                        <td>닉네임포</td>
                        <td>24.02.05</td>
                        <td><button type="button" class="btn btn-dark btn-sm" onclick="reviewBlind();">처리</button></td>
                    </tr>
                    <tr>
                        <td>267</td>
                        <td>바람부는 날이면 압구정동에 가야한다</td>
                        <td>
                            <p>
                            국무총리·국무위원 또는 정부위원은 국회나 그 위원회에 출석하여 국정처리상황을 보고하거나 의견을 진술하고 질문에 응답할 수 있다. 대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다.

                            중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을 제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다.
                            </p>
                        </td>
                        <td>3.5</td>
                        <td>닉네임파이브</td>
                        <td>24.02.05</td>
                        <td><button type="button" class="btn btn-dark btn-sm" onclick="reviewBlind();">처리</button></td>
                    </tr>
                    <tr>
                        <td>267</td>
                        <td>윙카</td>
                        <td>
                            <p>
                            국무총리·국무위원 또는 정부위원은 국회나 그 위원회에 출석하여 국정처리상황을 보고하거나 의견을 진술하고 질문에 응답할 수 있다. 대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다.

                            중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을 제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다.
                            </p>
                        </td>
                        <td>3.5</td>
                        <td>닉네임식스</td>
                        <td>24.02.05</td>
                        <td><button type="button" class="btn btn-dark btn-sm" onclick="reviewBlind();">처리</button></td>
                    </tr>
                    <tr>
                        <td>267</td>
                        <td>윙카</td>
                        <td>
                            <p>
                            국무총리·국무위원 또는 정부위원은 국회나 그 위원회에 출석하여 국정처리상황을 보고하거나 의견을 진술하고 질문에 응답할 수 있다. 대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다.

                            중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을 제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다.
                            </p>
                        </td>
                        <td>3.5</td>
                        <td>닉네임나인</td>
                        <td>24.02.05</td>
                        <td><button type="button" class="btn btn-dark btn-sm" onclick="reviewBlind();">처리</button></td>
                    </tr>
                    <tr>
                        <td>267</td>
                        <td>윙카</td>
                        <td>
                            <p>
                            국무총리·국무위원 또는 정부위원은 국회나 그 위원회에 출석하여 국정처리상황을 보고하거나 의견을 진술하고 질문에 응답할 수 있다. 대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다.

                            중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을 제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다.
                            </p>
                        </td>
                        <td>3.5</td>
                        <td>닉네임텐</td>
                        <td>24.02.05</td>
                        <td><button type="button" class="btn btn-dark btn-sm" onclick="reviewBlind();">처리</button></td>
                    </tr>
                    <tr>
                        <td>267</td>
                        <td>윙카</td>
                        <td>
                            <p>
                            국무총리·국무위원 또는 정부위원은 국회나 그 위원회에 출석하여 국정처리상황을 보고하거나 의견을 진술하고 질문에 응답할 수 있다. 대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다.

                            중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을 제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다.
                            </p>
                        </td>
                        <td>3.5</td>
                        <td>닉네임원</td>
                        <td>24.02.05</td>
                        <td><button type="button" class="btn btn-dark btn-sm" onclick="reviewBlind();">처리</button></td>
                    </tr>
                    <tr>
                        <td>267</td>
                        <td>윙카</td>
                        <td>
                            <p>
                            국무총리·국무위원 또는 정부위원은 국회나 그 위원회에 출석하여 국정처리상황을 보고하거나 의견을 진술하고 질문에 응답할 수 있다. 대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다.

                            중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을 제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다.
                            </p>
                        </td>
                        <td>3.5</td>
                        <td>닉네임원</td>
                        <td>24.02.05</td>
                        <td><button type="button" class="btn btn-dark btn-sm" onclick="reviewBlind();">처리</button></td>
                    </tr> -->
                </tbody>
            </table>
        </div>
        <div class="d-flex justify-content-center container">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
	                <% if(pi.getCurrentPage() == 1){ %>
	                	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                <% } else { %>
	                    <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.rv?page=<%=pi.getCurrentPage() - 1%>&memNo=<%=memNo%>">Previous</a></li>
	                <% } %>    
                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                    <% if(p == pi.getCurrentPage()){ %>
	                    	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                    <% } else { %>
	                    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.rv?memId=<%=memId%>&page=<%= p %>&memNo=<%=memNo%>&memId=<%=memId%>"><%= p %></a></li>
	                    <% } %>
                    <% } %>
                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    <% } else { %>
                    	<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.rv?page=<%= pi.getCurrentPage() + 1%>&memNo=<%=memNo%>&memId=<%=memId%>">Next</a></li>
                  	<% } %>
                  </ul>
            </nav>
        </div>
    </div>
    <script>
        function reviewBlind(){
            confirm('해당 리뷰에 대해 블라인드 처리 진행하시겠습니까?');
        }
    </script>
	</div>
</body>
</html>