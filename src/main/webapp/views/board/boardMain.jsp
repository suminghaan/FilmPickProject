<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<style>
    #wrap, #wrap *{
        box-sizing: border-box;
        color: white;
    }
    #wrap{
        border: 1px solid black;
        background-color: black;
        display: flex;
        flex-direction: column;
        width: 100%;
        max-width: 1300px;
        margin: auto;
        padding: 20px;
    }
    #main{
        min-height: 1500px;
        margin-top: 100px;
    }
    .main_movie{
        height: 400px;
        display: flex;
        flex-direction: row;
        /* justify-content: center; */
        align-items: center;
    }
    #main_video{
        margin: auto;
        width: 720px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #main_content{
        margin: auto;
        width: 480px;
    }
    .title_font{
        font-size: 60px;
    }
    .title_date{
        font-size: 30px;
    }
    .topPage{
        position: fixed;
        bottom: 50px;
        right: 350px;
    }
    .topPage>a{
        color: white;
    }
    .box{
        background-color: rgb(46, 46, 46);
        padding: 20px;
    }
    .box_font{
        width: 200px;
        height: 50px;
        font-size: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 5px;
        background-color: rgb(19, 19, 19);
    }
    .box_font>a{
        text-decoration: none;
    }
    .box_post{
        display: flex;
        height: 300px;
    }
    .post{
        margin: 10px;
        width: 100%;
        height: 100%;
    }
    .post:hover{
        filter: brightness(1.03);
    }
    .commu{
       // margin-top: 10px;
       // margin-bottom: 10px;
    }
    .commu_box{
        display: flex;
    }
    .commu_list{
        background-color: rgb(119, 119, 119);
        display: flex;
        flex-direction: column;
        width: 350px;
        height: 100px;
        border-radius: 10px;
        margin: 10px;
        padding-left: 10px;
        padding-right: 10px;
        overflow: hidden;
    }
    .commu_title{
        display: flex;
        align-items: center;
        width: 320px;
        height: 100px;
        font-size: 20px;
        height: 60px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .commu_wri{
        display: flex;
        justify-content: space-between;
        height: 40px;
        margin-top: -15px;
        margin-bottom: 5px;
    }
    .review{
        margin-top: 10px;
        margin-bottom: 10px;
        display: flex;
    }

    .new_movie{
        height: 450px;
    }
    
</style>
</head>
<body>
<header>

	<%@ include file="/views/common/header.jsp" %>
	
</header>
<section>
	
	    <div id="wrap">
	        <div id="main">
	            <div class="main_movie">
	                <div id="main_video">
	                    <iframe width="560" height="315" src="https://www.youtube.com/embed/rjW9E1BR_30?si=tmWSvmdDWIBUaMH3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
	                </div>
	                <div id="main_content">
	                    <div class="title_font">파묘</div>
	                    <div class="title_date">2024.02.22</div>
	                    <div class="title_content">미국 LA, 거액의 의뢰를 받은 무당 ‘화림’(김고은)과 ‘봉길’(이도현)은 기이한 병이 대물림되는 집안의 장손을 만난다. 조상의 묫자리가 화근임을 알아챈 ‘화림’은 이장을 권하고, 돈 냄새를 맡은 최고의 풍수사 ‘상덕’(최민식)과 장의사 ‘영근’(유해진)이 합류한다. “전부 잘 알 거야… 묘 하나 잘못 건들면 어떻게 되는지” 절대 사람이 묻힐 수 없는 악지에 자리한 기이한 묘. ‘상덕’은 불길한 기운을 느끼고 제안을 거절하지만, ‘화림’의 설득으로 결국 파묘가 시작되고… 나와서는 안될 것이 나왔다.</div>
	                </div>
	            </div>
	            <div class="being_movie box">
	                <div class="box_font">
	                    <a href="">현재 상영중인 영화</a>
	                </div>
	                <div class="box_post">
	                    <a class="post" href=""><img class="post" src="../../resources/img/듄2.jpeg" alt=""></a>
	                    <a class="post" href=""><img class="post" src="../../resources/img/파묘.jpeg" alt=""></a>
	                    <a class="post" href=""><img class="post" src="../../resources/img/가여운것들.jpeg" alt=""></a>
	                    <a class="post" href=""><img class="post" src="../../resources/img/건국전쟁.jpeg" alt=""></a>
	                    <a class="post" href=""><img class="post" src="../../resources/img/웡카.jpeg" alt=""></a>
	                </div>
	                <br><br>
	                <div class="box_font">
	                    <a href="">영화 인기작</a>
	                </div>
	                <div class="box_post">
	                    <a class="post" href=""><img class="post" src="../../resources/img/파묘.jpeg" alt=""></a>
	                    <a class="post" href=""><img class="post" src="../../resources/img/듄2.jpeg" alt=""></a>
	                    <a class="post" href=""><img class="post" src="../../resources/img/건국전쟁.jpeg" alt=""></a>
	                    <a class="post" href=""><img class="post" src="../../resources/img/웡카.jpeg" alt=""></a>
	                    <a class="post" href=""><img class="post" src="../../resources/img/가여운것들.jpeg" alt=""></a>
	                </div>
	            </div>
	            <div class="commu box">
	                <div class="box_font">
	                    <a href="">커 뮤 니 티</a>
	                </div>
	                <div class="commu_box">
	
	                    <div class="commu_list">
	                        <div class="commu_title">글제목</div>
	                        <div class="commu_wri">
	                            <p style="color: rgb(52, 52, 52);">관리자</p>
	                            <p style="color: rgb(52, 52, 52);">2024.03.07</p>
	                        </div>
	                    </div>
	                    <div class="commu_list">
	                        <div class="commu_title">글글제목글글글글ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ제목글글제목글글제목글글제목글글제목</div>
	                        <div class="commu_wri">
	                            <p style="color: rgb(52, 52, 52);">관리자</p>
	                            <p style="color: rgb(52, 52, 52);">2024.03.07</p>
	                        </div>
	                    </div>
	                    <div class="commu_list">
	                        <div class="commu_title">글글제목글글글제목글글</div>
	                        <div class="commu_wri">
	                            <p style="color: rgb(52, 52, 52);">관리자</p>
	                            <p style="color: rgb(52, 52, 52);">2024.03.07</p>
	                        </div>
	                    </div>
	                </div>
	                <div class="box_font">
	                    <a href="">최신등록 리뷰</a>
	                </div>
	                <div class="review">
	                    <div>
	                        기웅이가 만든거 긁어올껀데 div로 만들려나...?
	                    </div>
	                    <div>
	                        리뷰를 어케할까
	                    </div>
	                    <div>
	                        리뷰를 어케할까
	                    </div>
	                    <div>
	                        리뷰를 어케할까
	                    </div>
	                </div>
	            </div>
	            <div class="new_movie box" style="margin-bottom: 10px;">
	                <div class="box_font">
	                    <a href="">사용자영화 최신순</a>
	                </div>
	                <div class="box_post">
	                    <a class="post" href=""><img class="post" src="../../resources/img/파묘.jpeg" alt=""></a>
	                    <a class="post" href=""><img class="post" src="../../resources/img/듄2.jpeg" alt=""></a>
	                    <a class="post" href=""><img class="post" src="../../resources/img/건국전쟁.jpeg" alt=""></a>
	                    <a class="post" href=""><img class="post" src="../../resources/img/웡카.jpeg" alt=""></a>
	                    <a class="post" href=""><img class="post" src="../../resources/img/가여운것들.jpeg" alt=""></a>
	                </div>
	            </div>
	            <div class="topPage">
	                <a href="#wrap"><img src="../../resources/img/up_icon.png" alt="up_icon" style="width: 50px;"></a>
	            </div>
	        </div>
	    </div>

</section>
<footer>
	
	<%@ include file="/views/common/footer.jsp" %>
	
</footer>

</body>
</html>