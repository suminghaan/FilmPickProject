<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>없는영화 신청 확인 </title>
<style>
#header {
  height: 100px;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
}

.content_wrap {
  padding-top: 100px;
  margin:auto;
  width: 1500px;
}

.content {
  height: 100%;
}

#footer {
  height: 100px;
}

.bd-placeholder-img {
  font-size: 1.125rem;
  text-anchor: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
}

.search_bar {
  width: 400px;
}

@media (min-width: 768px) {
  .bd-placeholder-img-lg {
    font-size: 3.5rem;
  }
}
@media (max-width: 990px) {
  #header {
    height: 250px;
  }
  .content_wrap {
    padding-top: 250px;
  }
  .search_bar {
    width: 600px;
  }
}

.b-example-divider {
  width: 100%;
  height: 3rem;
  background-color: rgba(0, 0, 0, .1);
  border: solid rgba(0, 0, 0, .15);
  border-width: 1px 0;
  box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
}

.b-example-vr {
  flex-shrink: 0;
  width: 1.5rem;
  height: 100vh;
}

.bi {
  vertical-align: -.125em;
  fill: currentColor;
}

.nav-scroller {
  position: relative;
  z-index: 2;
  height: 2.75rem;
  overflow-y: hidden;
}

.nav-scroller .nav {
  display: flex;
  flex-wrap: nowrap;
  padding-bottom: 1rem;
  margin-top: -1px;
  overflow-x: auto;
  text-align: center;
  white-space: nowrap;
  -webkit-overflow-scrolling: touch;
}

.btn-bd-primary {
  --bd-violet-bg: #712cf9;
  --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

  --bs-btn-font-weight: 600;
  --bs-btn-color: var(--bs-white);
  --bs-btn-bg: var(--bd-violet-bg);
  --bs-btn-border-color: var(--bd-violet-bg);
  --bs-btn-hover-color: var(--bs-white);
  --bs-btn-hover-bg: #6528e0;
  --bs-btn-hover-border-color: #6528e0;
  --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
  --bs-btn-active-color: var(--bs-btn-hover-color);
  --bs-btn-active-bg: #5a23c8;
  --bs-btn-active-border-color: #5a23c8;
}

.bd-mode-toggle {
  z-index: 1500;
}

.bd-mode-toggle .dropdown-menu .active .bi {
  display: block !important;
}

.menu_buttons {
  margin-left: 20px;
}

.menu_buttons:hover {
  transform: scale(1.3);
}

.menu_buttons_co {
  margin-left: 10px;
  display: none;
}

.menu_buttons:hover + .menu_buttons_co {
  display: block;
}

.search {
  position: relative;
}

.searchBtn {
  position: absolute;
  margin: auto;
  top: 0;
  right: 0;
}

.search-info {
  margin-top: 200px;
  height: 5%;
  background-color: gray;
}

/*컨텐츠부분*/

 .all{
     padding: 5px 5px 5px 5px;
     width: 1100px;
     align-items: center;
     margin: 0 auto;
 }

 .modal-body {
     position: relative;
 }

 .psModal{
     position: absolute;
     top: 19px;
     right: 19px;
 }

 .psButton-body{
     position: relative;
 }

 .psButton{
     position: absolute;
     top: 27.5px;
     left: 300px;
 }
  

#title{
    margin-top: 50px;
}

h1{
    font-weight: bold !important;
    color: black;
}

.dr{
	display: flex;
}

.dr *{
	margin-right : 20px;
}

.modal-text{
    margin-right: 10px;
    font-weight: bold;
}

label{
	margin-right: 15px;
}

input[type="radio"]{
	margin-right: 5px;
}

label
{
    color: black;
}
   
   
  /*모달 스타일*/
  
.modal-header{
		color: black;
		font-weight: bold !important;
}

.castingList{
		display:flex;
		width:400px;
}

.person{
		display:flex;
		flex-direction:column;
}

img{
		width:80px;
		height:80px;
}

.inputUser{
		display:flex;
}

</style>
</head>
<body>
<%@ include file="/views/admin/common/header.jsp" %>
    <div class="container-fluid">
    	<div class="content">

        
        <section class="content_wrap" style="padding-top: 0px;">

        <div class="container">
            <div id="title" class="title"></div>
            <h1>없는영화 신청글 확인</h1>
            <hr>
        </div>
        
        <form action="" method="">
            <div class="all">                
                <div class="form-group">
                    <label for="movieTitle">영화제목</label> <br>
                    <input type="text" class="form-control" id="mTitle" name="" placeholder="파묘" style="width: 500px;">
                </div>

                <br>

                <div class="form-group">
                    <label for="mGrade">영화관람등급</label>
                    <select class="form-control" id="mGrade" name="" style="width: 400px;">
                        <option value="1">전체관람</option>
                        <option value="2" selected>12세 관람가</option>
                        <option value="3">15세 관람가</option>
                        <option value="4">청소년관람불가</option>
                    </select>
                </div>
                    
                <br>

                <div class="form-group">
                    <label for="mContent">영화줄거리</label> <br>
                    <textarea class="form-control" id="mContent" rows="5" name="" style="width: 500px;">미국 LA, 거액의 의뢰를 받은 무당 ‘화림’(김고은)과 ‘봉길’(이도현)은 기이한 병이 대물림되는 집안의 장손을 만난다. 조상의 묫자리가 화근임을 알아챈 ‘화림’은 이장을 권하고, 돈 냄새를 맡은 최고의 풍수사 ‘상덕’(최민식)과 장의사 ‘영근’(유해진)이 합류한다. “전부 잘 알 거야… 묘 하나 잘못 건들면 어떻게 되는지” 절대 사람이 묻힐 수 없는 악지에 자리한 기이한 묘. ‘상덕’은 불길한 기운을 느끼고 제안을 거절하지만, ‘화림’의 설득으로 결국 파묘가 시작되고… 나와서는 안될 것이 나왔다.
                    </textarea>                
                </div>
                

                <br>

                <div class="form-group dr">
                
                	<div>
                    	<label>개봉일</label>
                    	<input type="date" name="dateIn" class="form-control" style="width: 300px;" value="2024-01-11">
                    </div>
                    <div>
                    	<label>러닝타임</label>
                    	<input type="text" name="runningTime" class="form-control" style="width: 300px;" value="122분">
                	</div>
                </div>
                <br>

                
                <br>

                <div class="form-group psButton-body">
                    <label>출연/제작</label>
                    <input type="text" name="casting" class="form-control" style="width: 300px;">
                    <button type="button" class="btn btn-secondary btn-sm psButton" data-toggle="modal" data-target="#searchModal">검색</button>
                
                	<div class="castingList">
                		<div class="person">
	                    <img src="../img/최동훈감독.PNG" alt=""> 최동훈 <br>
	                    <input type="text" name="person_role" placeholder="해당영화 역할">
	                    </div>
	                    <div class="person">
	                    <img src="../img/김우빈.PNG" alt=""> 김우빈 <br>
	                    <input type="text" name="person_role" placeholder="해당영화 역할">
	                    </div>
	                    <div class="person">
	                    <img src="../img/김태리.PNG" alt=""> 김태리 <br>
	                    <input type="text" name="person_role" placeholder="해당영화 역할">
	                    </div>
	                    <div class="person">
	                    <img src="../img/류준열.PNG" alt=""> 류준열 <br>
	                    <input type="text" name="person_role" placeholder="해당영화 역할">
						</div>
					</div>
                	
                </div>
                <br>


                <div class="form-group">
                    <label>영화 장르 선택</label>
                    <br>

                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="cbox1" name="category" value="SF" checked>
                        <label class="form-check-label" for="cbox1">SF</label>

                        <input class="form-check-input" type="checkbox" id="cbox2" name="category" value="스릴러">
                        <label class="form-check-label" for="cbox2">스릴러</label>

                        <input class="form-check-input" type="checkbox" id="cbox3" name="category" value="로맨스">
                        <label class="form-check-label" for="cbox3">로맨스</label>

                        <input class="form-check-input" type="checkbox" id="cbox4" name="category" value="액션" checked>
                        <label class="form-check-label" for="cbox4">액션</label>

                        <input class="form-check-input" type="checkbox" id="cbox5" name="category" value="판타지">
                        <label class="form-check-label" for="cbox5">판타지</label>

        
                        <input class="form-check-input" type="checkbox" id="cbox6" name="category" value="코미디">
                        <label class="form-check-label" for="cbox6">코미디</label>

                        <input class="form-check-input" type="checkbox" id="cbox7" name="category" value="에로">
                        <label class="form-check-label" for="cbox7">에로</label>

                        <input class="form-check-input" type="checkbox" id="cbox8" name="category" value="범죄">
                        <label class="form-check-label" for="cbox8">범죄</label>

                        <input class="form-check-input" type="checkbox" id="cbox9" name="category" value="애니메이션">
                        <label class="form-check-label" for="cbox9">애니메이션</label>

                        <input class="form-check-input" type="checkbox" id="cbox10" name="category" value="느와르">
                        <label class="form-check-label" for="cbox10">느와르</label>
                    </div>
                </div>
                <br>
                

                <div class="form-group">
                <label>국가</label>
                <br>
                
                <div class="form-check form-check-inline">
                    <input type="radio" id="radio1" name="nation" value="1" checked style="margin-top: 10px;"> 
                    <label for="radio1">국내</label>

                    <input type="radio" id="radio2" name="nation" value="2">
                    <label for="radio2">해외</label>
                </div>
                
                <br><br>
 
                <label>영화포스터</label>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile1" name="">
                    <label class="custom-file-label" for="customFile1">파일추가</label>
                    <img src="" alt="미리보기이미지">
                </div>

                <br><br>

                <label>예고편영상</label>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile2" name="">
                    <label class="custom-file-label" for="customFile2">파일추가</label>
                    <img src="" alt="미리보기이미지">
                </div>
                
                <br><br>

                <div class="form-group">
                <label>기타 추가 희망 이미지 또는 동영상</label>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="customFile3" name="">
                        <label class="custom-file-label" for="customFile3">파일추가</label>
                        <img src="" alt="미리보기이미지">
                    </div>
                </div>


                <br>

                <div class="form-group">
                    <label>첫 페이지 노출 선택여부 : </label>
                    <br>
                    <input type="radio" id="radioX" name="gender" value="X" checked> 
                    <label for="radioX">선택안함</label>

                    <input type="radio" id="radioM" name="gender" value="M">
                    <label for="radioM">첫페이지 노출</label>

                    <button type="button" class="btn btn-outline-secondary" style="float: right;" onclick="alert('신규영화 등록이 완료되었습니다.')">업로드</button>
                </div>
		     <div class="form-group">
                    <label>사용자 요청사항</label>
                    <textarea class="form-control" id="mContent" rows="5" name="" style="width: 500px;">사용자가 입력한 요청사항</textarea>       
                </div>
                <br>
                
                <!-- 사용자가 등록한 영화일 경우 -->
                <div class="form-group inputUser">
                    <label><img src="../img/profile_person.png" alt="사용자 프로필"></label>
                    <div class="userInfo">
                        <p><label>등록한 사용자 ID : </label>user01</p>
                        <p><label>등록한 영화 갯수 : </label>13번</p>
                    </div>
                </div>
            </div>
        </form>
    </div>
        <div class="container d-flex justify-content-end" style="margin-top: 30px; margin-bottom: 30px;">
        <button type="button" class="btn btn-secondary btn-sm" onclick="alert('수정이 완료되었습니다.');" style="margin-right: 10px;">수정</button>    
        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#recognizeModal" style="margin-right: 10px;">승인</button>
        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#refuseModal">거절</button>   
    	</div>
  </div>
    

    <!-- 인물검색 Modal -->
    <div class="modal" id="searchModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">배우 검색</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <input type="text" name="runningTime" class="form-control">
                    <button type="button" class="btn btn-secondary btn-sm psModal">검색</button>
                    <hr>
                    <div>
                        검색된 인물 나오는 공간
                    </div>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" style="float: right;" data-dismiss="modal">추가</button>
                </div>
        
            </div>
        </div>
    </div>
    

     <div class="modal fade" id="refuseModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">거절사유 입력</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body">
                <div class="container" style="margin-top: 10px; margin-bottom: 20px;">
                    <span class="modal-text">거절사유</span>
                    <span><textarea rows="5" style="resize:none;" placeholder="내용을 입력해주세요" class="form-control"></textarea></span>
                </div>
            </div>
            <div class="modal-footer d-flex justify-content-center ">
            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="alert('거절사유 작성이 완료되었습니다.')">작성</button>
            </div>
        </div>
        </div>
    </div>

    <div class="modal fade" id="recognizeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">수정사항 확인</h4>
            </div>
            <div class="modal-body">
                <div class="container" style="margin-top: 20px; margin-bottom: 10px;">
                    <span class="modal-text">개봉일</span>
                    <span>2024-01-11</span>
                </div>
                <div class="container" style="margin-top: 30px; margin-bottom: 10px;">
                    <span class="modal-text">영화장르</span>
                    <span>스릴러</span>
                </div>
            </div>
            <div class="modal-footer d-flex justify-content-center">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
        </div>
    </div>
</body>
</html>