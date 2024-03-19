<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fp.common.model.vo.PageInfo" %>
<%@ page import="com.fp.board.model.vo.Board" %>
<%@ page import="com.fp.movie.model.vo.Movie" %>
<%@ page import="java.util.List" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Board> chatList = (List<Board>)request.getAttribute("chatList");
	List<Movie> mList = (List<Movie>)request.getAttribute("mList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  /*컨텐츠부분*/
    .background{
        min-height: 500px;
        margin: 50px;
        background-color: rgb(39, 39, 39);
        flex-direction: column;
        padding-top: 30px;
        padding-bottom: 30px;
    }

    .community_logo{
        /* border: 1px solid white; */
        color: white;
        cursor: pointer;
        font-size: 25px;
        margin-left: 30px;
    }

    .community_search{
        /* border: 1px solid white; */
        margin-left: 700px;
    }

    .table_first{
        /* border: 1px solid white; */
        color: white;
        margin-left: 40px;
        width: 60%;
    }
    .title{
        font-weight: bolder;
        font-size: 18px;
        cursor: pointer;
        padding-top: 15px;
    }
    .img{
        width: 100px;
        height: 100px;
    }
    .img>img{
        width: 90%;
        height: 90%;
    }
    .view_count, .writer{
        color: rgb(158, 158, 158);
        font-size: 16px;
    }
    .thead *{
        padding: 9px;
    }
    .tab{
        font-size: 17px;
    }
    .tab, .plus_view{
        border-top: 1px solid white;
        border-bottom: 1px solid white;
    }
    .writer, .img{
        border-bottom: 1px solid rgb(158, 158, 158);;
    }

    /*두번째 테이블 시작*/
    .table_second{
        /* border: 1px solid white; */
        color: white;
        margin-left: 100px;
    }
    .table_second *{
        /* border: 1px solid white; */
        width: 300px;
    }
    .public_movie *{
        padding: 9px;
        font-size: 23px;
        font-weight: bold;
        height: 70px;
        border-top: 1px solid white;
        border-bottom: 1px solid white;
    }
    .movie_name{
        font-weight: bold;
        font-size: 18px;
        cursor: pointer;
    }
    .movie_name>tr>td{
        padding: 10px;
    }

    /*만지면안됨*/
    .content{
        display: flex;
    }
    /* .content>div{border: 1px solid white;} */
    .div1{width: 70%;}
    .div2{width: 30%}
    .content{
        /* border: 1px solid white; */
        width: 90%;
    }
    .table_first{width: 100%;}
    .table_second{width: 100%;}

    .all_comunity{
        color: white;
        cursor: pointer;
        font-size: 25px;
        font-weight: bold;
        margin-left: 40px;
    }
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>
	
	<!-- 컨텐츠 부분 시작 -->
    <section class="content_wrap" style="background: black;">

        <div class="background">

            <span class="community_logo" onclick="community_go();">커뮤니티</span>
            <div class="community_search">
                <form action="" method="">
                        <input type="text" class="community_search_input" style="width: 400px; height: 40px;">
                        <button type="image" class="community_search_btn" alt="검색">검색</button> 
                </form>
            </div>
            <br><br><br>
                <span class="all_comunity" onclick="allComu();">[잡담] 전체 게시글</span>
                <a href="<%= contextPath %>/views/community/postWrite.jsp" class="btn btn-secondary" style="margin-left: 590px;">글쓰기</a>
            <br><br>

            <div class="content">
                
                <div class="div1">
                    <table class="table_first">
                        <thead class="thead">
                            <tr class="head">
                                <td colspan="3" class="public tab">번호 말머리</td>
                                <!-- <td class="plus_view"><a href="http://www.naver.com">더보기</a></td> -->
                            </tr>
                        </thead>
                        <tbody>
                            <!-- for(){ 반복문 시작 @@@@@@@@@@@@@@@@@@@@@@@@@@-->
                            <% for(Board b : chatList){ %>
                            <tr>
                                <td colspan="2" class="title" onclick="community_check();"><%=b.getbNo() + " [잡담]" + b.getbTitle() + " [" + b.getReplyCount() + "]" %></td>
                                <td rowspan="3" class="img">
                                    <img src="<%=contextPath+ "/" + b.getTitleImgUrl()%>">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="view_count"><%= b.getbReadCount()+" "+b.getbRecommendCount() %></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="writer"><%= b.getMemNo() + " / " + b.getbRegistDate() %></td>
                            </tr>
                            <%} %>
                            <!-- } 반복문 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
                        </tbody>
                    </table>
                </div>   
                
                <div class="div2">
                    <!-- 우측 인기영화 탭 -->
                    <table class="table_second">
                        <thead class="public_movie">
                            <tr>
                                <td>인기영화</td>
                            </tr>
                        </thead>
                        <tbody class="movie_name">
                        <%for(Movie m : mList){ %>
                        	<tr>
                            	<td onclick="movie_go();"><%= m.getMvName() %></td>
                        	</tr>
                    	<%} %>
                        </tbody>
                    </table>
                </div>    

            </div>

            <br><br><br>
            <!-- 여기에 검색시 잡담탭의 전체게시글의 특정 게시글을 검색 -->
            <ul class="pagination justify-content-center">
            	<% if(pi.getCurrentPage() == 1){ %>
            		<!-- 현재 내가 보고있는 페이지가 1페이지와 일치할경우 클릭불가능 -->
                	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <% }else{ %>
                	<!-- 클릭시 내가 보고있는 페이지의 이전페이지로 이동하기위한 구문 -->
                	<li class="page-item"><a class="page-link" href="<%= contextPath %>/chat.bo?page=<%= pi.getCurrentPage() - 1%>">Previous</a></li>
                <% } %>
                <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
               		<%if(p == pi.getCurrentPage()){ %>
               		<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
               		<%}else{ %>
               		<li class="page-item"><a class="page-link" href="<%= contextPath %>/chat.bo?page=<%= p %>"><%= p %></a></li>
               		<% } %>
                <% } %>
                <%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                <!-- 현재 내가 보고있는 페이지가 마지막페이지와 일치할 경우 클릭 불가능 -->
                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
 				<%}else{ %>
                <li class="page-item"><a class="page-link" href="<%= contextPath%>/chat.bo?page=<%=pi.getCurrentPage()+1%>">Next</a></li>
 				<%} %>
            </ul>

            <div class="notice_search" align="center">
                <form action="" method="">
                    <input type="text" class="notice_search_input" style="width: 400px; height: 40px;  margin-bottom: 50px;">
                    <button type="image" class="notice_search_btn" alt="검색">검색</button>
                </form>
            </div>
            
            
        
        </div>
    </section>

    <script>
        function community_go(){
            location.href="<%= contextPath %>/main.bo";
        }

        function community_check(){
            location.href="http://www.naver.com";
        }

        function movie_go(){
            location.href="http://www.naver.com";
        }

        function allComu(){ 
            location.href="http://www.naver.com";
        }

    </script>
    <!-- 컨텐츠 부분 종료  -->
	
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>