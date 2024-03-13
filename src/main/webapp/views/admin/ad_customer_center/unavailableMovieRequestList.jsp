<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>없는영화 신청 목록</title>
<style>
#select-user-title{
    margin-top: 50px;
}
table{
    margin-top: 20px;
}
.title>h1{
    font-weight: bold;
}

.no-movie-list{
    width: 100%;
    height: 260px;
    box-shadow: 0 0 7px;
    margin-bottom: 40px;
    display: flex;
    flex-direction: column;
    padding: 17px;
    cursor: pointer;
}

.title{
    font-weight: bold;
}

.all-list{
    display: flex;
    flex-direction: row;
}

.item1, .item2{
    flex: 1;
}

.item1 img {
    width: 100%;
    height: auto;
}

.item2{
    margin-top: 5px;
}

.story{
    margin-top: 15px;
    color: rgb(127, 127, 127);
    height: 155px;
}

.item1{
    width: 25%;
}

.item2{
    width: 70%;
    padding: 0px;
    margin-left: 10px;
}

.no-check{
    color: gray;
}

.regist-date{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}

.writer{
    padding: 0px;
}

.recognize{
    color: rgb(41, 128, 185);
}

.refuse{
    color: rgb(192, 57, 43);
}
</style>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
    <div class="container-fluid">
    	 <div class="container">
        <div id="title" class="title">
            <h1 id="select-user-title">없는영화 신청 목록</h1>
        </div>
        <hr>
        <div class="d-flex justify-content-end container" style="margin: 20px;">
            <img src="../img/icon_filter.png" style="margin-right: 10px;">
            <select class="form-control" style="width: 100px">
                <option>승인</option>
                <option>거절</option>
                <option>미확인</option>
            </select>
        </div>
        <div class="container">
            <div class="container">
                <div class="no-movie-list all-list" onclick="moveWrite();">
                    <div clss="container item1">
                        <h4 class="title">귀멸의 칼날</h4>
                        <img src="../img/poster-guikal.png" class="img-fluid" style="width: 130px;">
                    </div>
                    <div class="container item2">
                        <div class="regist-date">
                            <span style="font-size: 15px;"><span class="title">작성일&nbsp;</span>2024/02/11</span>
                            <span class="no-check" style="justify-content: end;"><b>미확인</b></span>
                        </div>
                        <div class="story-writer">
                            <div class="container story">
                                ‘탄지로’와 상현 4 ‘한텐구’의 목숨을 건 혈투와, ‘무잔’과의 최종 국면을 앞둔 귀살대원들의 마지막 훈련을 그린 영화
                            </div>
                            <div class="container writer" style="text-align: right;">
                                <b>작성자</b> user000
                            </div>
                        </div>
                        
                    </div>
                </div>

                <div class="no-movie-list all-list" onclick="moveWrite();">
                    <div clss="container item1">
                        <h4 class="title">파묘</h4>
                        <img src="../img/poster-pamou.png" class="img-fluid" style="width: 130px;">
                    </div>
                    <div class="container item2">
                        <div class="regist-date">
                            <span style="font-size: 15px;"><span class="title">작성일&nbsp;</span>2024/02/01</span>
                            <span class="recognize" style="justify-content: end;"><b>승인</b></span>
                        </div>
                        <div class="story-writer">
                            <div class="container story">
                                미국 LA, 거액의 의뢰를 받은 무당 ‘화림’(김고은)과 ‘봉길’(이도현)은 기이한 병이 대물림되는 집안의 장손을 만난다. 조상의 묫자리가 화근임을 알아챈 ‘화림’은 이장을 권하고, 돈 냄새를 맡은 최고의 풍수사 ‘상덕’(최민식)과 장의사 ‘영근’(유해진)이 합류한다. “전부 잘 알 거야… 묘 하나 잘못 건들면 어떻게 되는지” 절대 사람이 묻힐 수 없는 악지에 자리한 기이한 묘. ‘상덕’은 불길한 기운을 느끼고 제안을 거절하지만, ‘화림’의 설득으로 결국 파묘가 시작되고… 나와서는 안될 것이 나왔다.                            </div>
                            <div class="container writer" style="text-align: right;">
                                <b>작성자</b> user000
                            </div>
                        </div>
                    </div>
                </div>

                <div class="no-movie-list all-list" onclick="moveWrite();">
                    <div clss="container item1">
                        <h4 class="title">검은 사제들</h4>
                        <img src="../img/poster-geomsa.png" class="img-fluid" style="width: 130px;">
                    </div>
                    <div class="container item2">
                        <div class="regist-date">
                            <span style="font-size: 15px;"><span class="title">작성일&nbsp;</span>2024/02/10</span>
                            <span class="refuse" style="justify-content: end;"><b>거절</b></span>
                        </div>
                        <div class="story-writer">
                            <div class="container story">
                                2015년 서울 뺑소니 교통사고 이후 의문의 증상에 시달리는 한 소녀(박소담). 잦은 돌출 행동으로 교단의 눈 밖에 난 ‘김신부’(김윤석)는 모두의 반대와 의심 속, 소녀를 구하기 위한 자신만의 계획을 준비한다. 이를 위해선 모든 자격에 부합하는 또 한 명의 사제가 필요한 상황, 모두가 기피하는 가운데 신학생인 ‘최부제’(강동원)가 선택되고, 그는 ‘김신부’를 돕는 동시에 감시하라는 미션을 받게 된다. 그리고 마침내 소녀를 구할 수 있는 단 하루의 기회, 김신부와 최부제는 모두의 목숨을 잃을 수도 있는 위험한 예식을 시작하는데… “절대 쳐다보지마. 이제부터 넌 여기 없는 거야”
                            </div>
                            <div class="container writer" style="text-align: right;">
                                <b>작성자</b> user000
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="d-flex justify-content-center container">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
   </div>	
   <script>
   		function moveWrite(){
   			location.href = "../ad_customer_center/noMovieRequestList.jsp";
   		}
   </script>
</body>
</html>