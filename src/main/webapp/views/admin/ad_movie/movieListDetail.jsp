<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="com.fp.common.model.vo.Attachment" %>
<%@ page import="com.fp.movie.model.vo.Movie" %>
<%@ page import="java.util.List" %>
    
<% List<Movie> list = (List<Movie>)request.getAttribute("list"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 조회</title>

<!-- 부트스트랩 기능을 위한 CDN 방식 연결 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!--  -------------------------------------  -->


<style>
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
	
	label{
            color: black;
    }
    
    
   /*모달 스타일*/
   
   .modal-header{
   		color: black;
   		font-weight: bold !important;
   }
   
   /*content style */
   
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

	<%-- Header start --%>
	<%@ include file="/views/admin/common/header.jsp" %>
	<%-- Header end --%>
	
	<%-- section start --%>	
	
	<div class="content">

        
        <section class="content_wrap" style="padding-top: 0px;">

        <div class="container">
            <div id="title" class="title"></div>
            <h1>영화 상세 조회</h1>
            <hr>
        </div>
        
        <form action="" method="">
            <div class="all">       
            <% for(Movie m : list) { %>         
                <div class="form-group">
                    <label for="movieTitle">영화제목</label> <br>
                    <input type="text" class="form-control" id="mTitle" name="" placeholder="제목입력" style="width: 500px;">
                </div>

                <br>

                <div class="form-group">
                    <label for="mGrade">영화관람등급</label>
                    <select class="form-control" id="mGrade" name="" style="width: 400px;">
                        <option value="1">전체관람</option>
                        <option selected value="2">12세 관람가</option>
                        <option value="3">15세 관람가</option>
                        <option value="4">청소년관람불가</option>
                    </select>
                </div>
                    
                <br>

                <div class="form-group">
                    <label for="mContent">영화줄거리</label> <br>
                    <textarea class="form-control" id="mContent" rows="5" name="" style="width: 500px;"></textarea>                
                </div>
                

                <br>

                <div class="form-group dr">
                
                	<div>
                    	<label>개봉일</label>
                    	<input type="date" name="dateIn" class="form-control" style="width: 300px;">
                    </div>
                    <div>
                    	<label>러닝타임</label>
                    	<input type="text" name="runningTime" class="form-control" style="width: 300px;">
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
                        <input class="form-check-input" type="checkbox" id="cbox1" name="category" value="SF">
                        <label class="form-check-label" for="cbox1">SF</label>

                        <input class="form-check-input" type="checkbox" id="cbox2" name="category" value="스릴러">
                        <label class="form-check-label" for="cbox2">스릴러</label>

                        <input class="form-check-input" type="checkbox" id="cbox3" name="category" value="로맨스">
                        <label class="form-check-label" for="cbox3">로맨스</label>

                        <input class="form-check-input" type="checkbox" id="cbox4" name="category" value="액션">
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
                
                <button type="button" class="btn btn-outline-secondary" style="float: right;" onclick="alert('내용이 수정되었습니다.')">수정하기</button>
                <%} %>
            </div>
        </form>
   	 </div>
    </section>

    

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
	
	
	

</body>
</html>