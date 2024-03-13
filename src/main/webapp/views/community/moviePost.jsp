<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        color: white;
        cursor: pointer;
        font-size: 25px;
        margin-left: 30px;
    }

    .community_search{
        margin-left: 700px;
    }

    .table_first{
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
        color: white;
        margin-left: 100px;
    }
    .table_second *{
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

    .div1{width: 70%;}
    .div2{width: 30%}
    .content{
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
                <span class="all_comunity" onclick="allComu();">[영화] 전체 게시글</span>
                <a href="http://www.naver.com" class="btn btn-secondary" style="margin-left: 590px;">글쓰기</a>
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
                            <tr>
                                <td colspan="2" class="title" onclick="community_check();">번호 [영화] 게시글제목[댓글갯수]</td>
                                <td rowspan="3" class="img">
                                    <img src="../../01_HTML/resources/image/city1.jpg">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="writer">작성자 / 작성시간</td>
                            </tr>
                            <!-- } 반복문 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->

                            <!-- 반복문 돌리면 지울 내용 @@@@@@@@@@@@@@@@@@@@@@@@-->
                            <tr>
                                <td colspan="2" class="title" onclick="community_check();">번호 [영화] 게시글제목[댓글갯수]</td>
                                <td rowspan="3" class="img">
                                    <img src="../../01_HTML/resources/image/city1.jpg">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="writer">작성자 / 작성시간</td>
                            </tr>

                            <tr>
                                <td colspan="2" class="title" onclick="community_check();">번호 [영화] 게시글제목[댓글갯수]</td>
                                <td rowspan="3" class="img">
                                    <img src="../../01_HTML/resources/image/city1.jpg">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="writer">작성자 / 작성시간</td>
                            </tr>

                            <tr>
                                <td colspan="2" class="title" onclick="community_check();">번호 [영화] 게시글제목[댓글갯수]</td>
                                <td rowspan="3" class="img">
                                    <img src="../../01_HTML/resources/image/city1.jpg">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="writer">작성자 / 작성시간</td>
                            </tr>

                            <tr>
                                <td colspan="2" class="title" onclick="community_check();">번호 [영화] 게시글제목[댓글갯수]</td>
                                <td rowspan="3" class="img">
                                    <img src="../../01_HTML/resources/image/city1.jpg">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="writer">작성자 / 작성시간</td>
                            </tr>

                            <tr>
                                <td colspan="2" class="title" onclick="community_check();">번호 [영화] 게시글제목[댓글갯수]</td>
                                <td rowspan="3" class="img">
                                    <img src="../../01_HTML/resources/image/city1.jpg">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="writer">작성자 / 작성시간</td>
                            </tr>

                            <tr>
                                <td colspan="2" class="title" onclick="community_check();">번호 [영화] 게시글제목[댓글갯수]</td>
                                <td rowspan="3" class="img">
                                    <img src="../../01_HTML/resources/image/city1.jpg">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="writer">작성자 / 작성시간</td>
                            </tr>

                            <tr>
                                <td colspan="2" class="title" onclick="community_check();">번호 [영화] 게시글제목[댓글갯수]</td>
                                <td rowspan="3" class="img">
                                    <img src="../../01_HTML/resources/image/city1.jpg">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="writer">작성자 / 작성시간</td>
                            </tr>

                            <tr>
                                <td colspan="2" class="title" onclick="community_check();">번호 [영화] 게시글제목[댓글갯수]</td>
                                <td rowspan="3" class="img">
                                    <img src="../../01_HTML/resources/image/city1.jpg">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="writer">작성자 / 작성시간</td>
                            </tr>

                            <tr>
                                <td colspan="2" class="title" onclick="community_check();">번호 [영화] 게시글제목[댓글갯수]</td>
                                <td rowspan="3" class="img">
                                    <img src="../../01_HTML/resources/image/city1.jpg">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="writer">작성자 / 작성시간</td>
                            </tr>
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
                            <tr>
                                <td onclick="movie_go();">영화제목</td>
                            </tr>
                            <tr>
                                <td onclick="movie_go();">영화제목</td>
                            </tr>
                            <tr>
                                <td onclick="movie_go();">영화제목</td>
                            </tr>
                            <tr>
                                <td onclick="movie_go();">영화제목</td>
                            </tr>
                            <tr>
                                <td onclick="movie_go();">영화제목</td>
                            </tr>
                            <tr>
                                <td onclick="movie_go();">영화제목</td>
                            </tr>
                            <tr>
                                <td onclick="movie_go();">영화제목</td>
                            </tr>
                            <tr>
                                <td onclick="movie_go();">영화제목</td>
                            </tr>
                            <tr>
                                <td onclick="movie_go();">영화제목</td>
                            </tr>
                            <tr>
                                <td onclick="movie_go();">영화제목</td>
                            </tr>

                        </tbody>
                    </table>
                </div>    

            </div>

            <br><br><br>
            <!-- 여기에 검색시 영화탭의 전체게시글의 특정 게시글을 검색 -->
            <ul class="pagination justify-content-center">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
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
            location.href="http://www.naver.com";
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

    <!-- 컨텐츠 부분 종료 -->
	
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>