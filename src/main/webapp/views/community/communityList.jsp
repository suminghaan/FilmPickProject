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
    .public{
        font-weight: bold;
    }
    .plus_view>a{
        text-decoration: none;
        color: rgb(158, 158, 158);
        margin-left: 3px;
        font-size: 20px;
        margin-top: 4px;
    }
    .plus_view{
        display: flex;
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
        font-size: 22px;
    }
    .tab, .plus_view{
        border-top: 1px solid white;
        border-bottom: 1px solid white;
    }
    .writer, .img{
        border-bottom: 1px solid rgb(158, 158, 158);
    }
    .content{
        /* border: 1px solid white; */
        display: flex;
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

    /* *{border: 1px solid white;} */
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>
	
	<!-- 컨텐츠 부분 시작 -->
    <section class="content_wrap" style="background: black; min-height: 2000px;">

        <div class="background">

            <span class="community_logo" onclick="community_go();">커뮤니티</span>
            <div class="community_search">
                <form action="" method="">
                        <input type="text" class="community_search_input" style="width: 400px; height: 40px;">
                        <button type="image" class="community_search_btn" alt="검색">검색</button> 
                </form>
            </div>
            <br><br><br>
            <a href="http://www.naver.com" class="btn btn-secondary" style="margin-left: 810px;">글쓰기</a>
            <br><br>

            <div class="content">

                <table class="table_first">
                    <thead class="thead">
                        <tr class="head">
                            <td colspan="2" class="public tab">[영화]인기글</td>
                            <td class="plus_view"><a href="http://www.naver.com">더보기</a></td>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- for(){ 반복문 시작 @@@@@@@@@@@@@@@@@@@@@@@@@@-->
                        <tr>
                            <td colspan="2" class="title" onclick="community_check();">게시글제목[댓글갯수]</td>
                            <td rowspan="3" class="img">
                                <img src="../../resources/img/공유.jpg">
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
                            <td colspan="2" class="title" onclick="community_check();">게시글제목[댓글갯수]</td>
                            <td rowspan="3" class="img">
                                <img src="../../resources/img/공유.jpg">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                        </tr>
                        <tr>
                          <td colspan="2" class="writer">작성자 / 작성시간</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="title" onclick="community_check();">게시글제목[댓글갯수]</td>
                            <td rowspan="3" class="img">
                                <img src="../../resources/img/공유.jpg">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="writer">작성자 / 작성시간</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="title" onclick="community_check();">게시글제목[댓글갯수]</td>
                            <td rowspan="3" class="img">
                                <img src="../../resources/img/공유.jpg">
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

            <br><br><br>
            <!-- 영화탭 일반게시글 -->
            <table class="table_first">
                <thead class="thead">
                    <tr class="head">
                        <td colspan="2" class="public tab">[영화]일반 게시글</td>
                        <td class="plus_view"><a href="http://www.naver.com">더보기</a></td>
                    </tr>
                </thead>
                <tbody>
                    <!-- for(){ 반복문 시작 @@@@@@@@@@@@@@@@@@@@@@@@@@-->
                    <tr>
                        <td colspan="2" class="title" onclick="community_check();">게시글제목[댓글갯수]</td>
                        <td rowspan="3" class="img">
                            <img src="../../resources/img/공유.jpg">
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
                        <td colspan="2" class="title" onclick="community_check();">게시글제목[댓글갯수]</td>
                        <td rowspan="3" class="img">
                            <img src="../../resources/img/공유.jpg">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="writer">작성자 / 작성시간</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="title" onclick="community_check();">게시글제목[댓글갯수]</td>
                        <td rowspan="3" class="img">
                            <img src="../../resources/img/공유.jpg">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="writer">작성자 / 작성시간</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="title" onclick="community_check();">게시글제목[댓글갯수]</td>
                        <td rowspan="3" class="img">
                            <img src="../../resources/img/공유.jpg">
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

            <br><br> <br>

            <!-- 잡담탭 일반게시글 -->
            <table class="table_first">
                <thead class="thead">
                    <tr class="head">
                        <td colspan="2" class="public tab">[잡담] 일반 게시글</td>
                        <td class="plus_view"><a href="http://www.naver.com">더보기</a></td>
                    </tr>
                </thead>
                <tbody>
                    <!-- for(){ 반복문 시작 @@@@@@@@@@@@@@@@@@@@@@@@@@-->
                    <tr>
                        <td colspan="2" class="title" onclick="community_check();">게시글제목[댓글갯수]</td>
                        <td rowspan="3" class="img">
                            <img src="../../resources/img/공유.jpg">
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
                        <td colspan="2" class="title" onclick="community_check();">게시글제목[댓글갯수]</td>
                        <td rowspan="3" class="img">
                            <img src="../../resources/img/공유.jpg">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="writer">작성자 / 작성시간</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="title" onclick="community_check();">게시글제목[댓글갯수]</td>
                        <td rowspan="3" class="img">
                            <img src="../../resources/img/공유.jpg">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="view_count">조회수갯수 좋아요갯수</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="writer">작성자 / 작성시간</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="title" onclick="community_check();">게시글제목[댓글갯수]</td>
                        <td rowspan="3" class="img">
                            <img src="../../resources/img/공유.jpg">
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
            
        
        </div> <br><br>
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

    </script>

    <!-- 컨텐츠 부분 종료 -->
	
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>