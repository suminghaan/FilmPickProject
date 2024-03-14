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
        padding-bottom: 30px;
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

    .notice_title>th {
        width: 33%;
    }

    #head{cursor: pointer;}

    #head>th{border: 1px solid gray}

    #text{
        margin-bottom: 1px;
        margin-left: 60px;
    }

    .comment{
        resize: none;
    }

    .ans_name{
        font-weight: bold;
        text-align: left;
    }
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>
	
    <!-- 컨텐츠부분 시작 -->
	<div style="background-color: black;">
      <div class="content">

        <section class="content_wrap" style="min-height: 800px;">
            <div class="background">
                <div class="content_link"">
                	<!-- 추후 링크 수정 @@@@@@@@@@ -->
                    <a href="../notice/noticeList.jsp" style="color: rgb(158, 158, 158);"><h2>공지사항</h2></a> <h2 class="division" style="color: rgb(158, 158, 158);">|</h2>
                    <a href="inquiryList.jsp" style="color: rgb(255, 255, 255);"><h2>고객센터</h2></a>
                </div>
                <br>
                <table class="tableback table" id="question_list">
                    <thead>
                        <tr class="notice_title" align="center" id="head">
                            <th style="color: rgb(158, 158, 158);" onclick="question_list();">문의현황확인</th>
                            <th onclick="nomv();">없는영화신청</th>
                            <th style="color: rgb(158, 158, 158);" onclick="mantoman();">1대1 문의</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr data-toggle="collapse" data-target="#nomv_question">
                            <td colspan="3" style="font-weight: bold; cursor: pointer;">Q. 없는영화 신청이 무엇인가요??</td>
                        </tr>
                        <tr id="nomv_question" class="collapse">
                            <td  colspan="3">
                                <p style="min-height: 160px; text-align: left;" class="p-3">
                                    없는 영화 신청이란 홈페이지에서 확인하고 싶은 영화가 등록되어있지 않다면<br> 홈페이지 사용자가
                                    직접 영화의 대한 줄거리, 출연진, 장르등을 작성해 신청하는 서비스 입니다.
                                    <br>
                                    신청을 완료하시면 확인 후 신청하신 영화의 정보를 홈페이지에 등록시켜드리며, <br>
                                    해당 영화 정보에 신청자분의 닉네임 기재하실 수 있습니다 (선택사항)
                                </p>
                                <p id="text">신청 정보에 부적절한 내용 또는 영화정보와 관련되지 않은 내용이 기재되어 있다면, 수정 또는 승인이 반려될  수 있습니다.</p>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="font-weight: bold; border-top: 1px solid black;">없는영화 신청현황 확인</td>
                        </tr>
                        <tr style="font-weight: bold;">
                            <td>영화명</td>
                            <td>신청일</td>
                            <td>승인여부</td>
                        </tr>
                        <tr style="cursor: pointer;"  data-toggle="collapse" data-target="#nomv_check">
                            <td>범죄도시4</td>
                            <td>2024-03-05</td>
                            <td>처리중/승인/반려</td>
                        </tr>
                        <tr id="nomv_check" class="collapse">
                            <td colspan="3" style="border-top: 1px solid black;">
                                <p class="ans_name">영화명</p>
                                <textarea class="form-control comment" rows="1">범죄도시4</textarea> <br>
                                <p class="ans_name">승인여부</p>
                                <textarea class="form-control comment" rows="1">처리중or승인or반려</textarea> <br>
                                <p class="ans_name">반려사유</p>
                                <textarea class="form-control comment" rows="6">적혀있는 반려사유</textarea> <br><br>
                                <a href="http://www.naver.com" class="btn btn-outline-secondary btn-sm">수정하기</a> <br><br>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <!-- 추후 수정 -->
                <a href="noMovieContent.jsp" class="btn btn-secondary" style="margin-left: 1150px;">신청하기</a>

            </div> <br><br>
        </section>
        <!-- Section end -->

        <script>
           /*
            $(function(){
                $("#question_list>tbody>tr").click(function(){
                    location.href="http://www.naver.com";
                })
            })
            */

            function question_list(){
                location.href="inquiryList.jsp"; // 추후 수정
            }
            
            function nomv(){
                location.href="noMovieList.jsp"; // 추후 수정
            }

            function mantoman(){
                location.href="inquiryWrite.jsp"; // 추후 수정
            }

    
            
            
        </script>

      </div>
    </div>
    <!-- 컨텐츠부분 종료 -->

	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>