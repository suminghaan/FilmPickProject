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

	<%@ include file="/views/common/header.jsp" %>
	
	<!-- 컨텐츠부분 시작 -->
        <section class="content_wrap" style="background: black; min-height: 1250px;">
            <div class="background">
                <div class="content_link"">
                    <a href="http://www.naver.com" style="color: rgb(158, 158, 158);"><h2>공지사항</h2></a> <h2 class="division" style="color: rgb(158, 158, 158);">|</h2>
                    <a href="http://www.naver.com" style="color: rgb(255, 255, 255);"><h2>고객센터</h2></a>
                </div>
                <br>
                <table class="tableback table table-hover" id="question_list">
                    <thead>
                        <tr class="notice_title" align="center" id="head">
                            <th onclick="question_list();">문의현황확인</th>
                            <th style="color: rgb(158, 158, 158);" onclick="nomv();">없는영화신청</th>
                            <th style="color: rgb(158, 158, 158);" onclick="mantoman();">1대1 문의</th>
                        </tr>
                        <tr align="center">
                            <th style="background: white;">제목</th>
                            <th style="background: white;">작성일</th>
                            <th style="background: white;">답변여부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>내 문의사항제목 2</td>
                            <td>2024/02/22</td>
                            <td>N</td>
                        </tr>
                        <tr>
                            <td>내 문의사항제목 1</td>
                            <td>2024/02/20</td>
                            <td>Y</td>
                        </tr>
                    </tbody>
                </table>
 
                <br><br><br><br>
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>

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
            $(function(){
                $("#question_list>tbody>tr").click(function(){
                    location.href="http://www.naver.com";
                })
            })

            function question_list(){
                location.href="http://www.naver.com";
            }
            
            function nomv(){
                location.href="http://www.naver.com";
            }

            function mantoman(){
                location.href="http://www.naver.com";
            }
            
        </script>
    <!-- 컨텐츠부분 끝 -->
	
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>