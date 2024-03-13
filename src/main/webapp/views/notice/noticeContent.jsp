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
        margin: 100px;
        background-color: rgb(39, 39, 39);
        display: flex;
        flex-direction: column;
    }

    .list{
        color: white;
        font-size: 17px;
        display: flex;
        padding-top: 30px;
        padding-left: 120px;
        margin-bottom: 10px;
    }

    .content_name{
        border: 1px solid white;
        display: flex;
        flex-direction: column;
        width: 80%;
        height: 100px;
        margin: auto;
        border-left: none;
        border-right: none;
    }

    .division{
        padding-right: 10px;
        font-weight: bold;
        font-size: 20px;
        margin-top: 15px;
    }

    .notice_title{
        font-weight: bold;
        font-size: 30px;
        margin-top: 10px;
    }

    .content_first{
        display: flex;
        color: white;
        margin-bottom: 15px;

    }

    .content_second{
        color: rgb(158, 158, 158);
    }

    .notice_content{
        color: white;
        margin: auto;
        width: 80%;
        height: 400px;
        margin-top: 15px;
        margin-bottom: 60px;
        font-size: 20px;
    }

    .backbtn{
        width: 10%;
        margin-bottom: 50px;
        margin-top: 30px;
        margin-left: 1000px;
    }
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>
		
	<!-- 컨텐츠 부분 시작 -->
	<div style="background-color: black;">
      <div class="content">
                <!-- Section start -->
                <section class="content_wrap" style="padding-top: 0px; min-height: 800px;">

                    <div class="background">
        
                        <span class="list">전체 2</span>
        
                        <div class="content_name">
                            <div class="content_first">
                                <div class="division">[일반]</div>
                                <div class="notice_title">공지사항제목</div>
                            </div>
                            <div class="content_second">
                                <div class="upload_date">2024/02/20 조회수 36</div>
                            </div>
                        </div>
                        <div class="notice_content">공지사항내용</div>
                        
                        <button type="button" class="btn btn-secondary backbtn" onclick="history.back();">뒤로가기</button>
                    
                    </div> <br><br>
                </section>
                <!-- Section end -->
      </div>
    </div>	
		
	<!-- 컨텐츠 부분 종료 -->
		
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>