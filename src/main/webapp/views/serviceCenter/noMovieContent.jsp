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
        display: flex;
        flex-direction: column;
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
        right: 3px;
    }

    .background2{
        background: white;
        margin: 30px;
    }
    
    .backbtn{
	      width: 100px;
	      margin-left: 1250px;
    }
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>
	
    <!-- 컨텐츠부분 시작 -->
	<div style="background-color: black;">
      <div class="content">

        <section class="content_wrap">
          <!-- Begin Page Content -->
          <div class="background">
              <div class="background2">
                      <div class="container-fluid"><br>
                          <h1>없는영화신청</h1> <br>
                          <form action="" method="">
                              <div class="form-group">
                                  <label for="exampleFormControlInput1">영화제목</label> <br>
                                  <input type="email" class="form-control" id="exampleFormControlInput1" name="">
                              </div>

                              <br>

                              <div class="form-group">
                                  <label for="exampleFormControlSelect1">영화관람등급</label>
                                  <select class="form-control" id="exampleFormControlSelect1" name="">
                                      <option value="전체">전체관람</option>
                                      <option value="12세">12</option>
                                      <option value="15세">15</option>
                                      <option value="청불">청소년관람불가</option>
                                  </select>
                              </div>

                              <br>

                              <div class="form-group">
                                  <label for="exampleFormControlTextarea1">영화줄거리</label> <br>
                                  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name=""></textarea>
                              </div>
                              

                              <br>

                              <div class="form-group">
                                  개봉일
                                  <input type="date" name="dateIn" class="form-control">
                              </div>
                              <br>

                              <div class="form-group">
                                  러닝타임
                                  <input type="text" name="runningTime" class="form-control">
                              </div>
                              <br>

                              <div class="form-group psButton-body">
                                  출연/제작
                                  <input type="text" name="" class="form-control">
                                  <button type="button" class="btn btn-secondary btn-sm psButton" data-toggle="modal" data-target="#searchModal">검색</button>
                              </div>
                              <br>


                              <div class="form-group">
                              영화 장르 선택
                              <br>

                                  <!-- <div class="form-check form-check-inline"> -->

                                      <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="SF" name="category">
                                      <label class="form-check-label" for="inlineCheckbox1">SF</label>
                                  
                                      <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="스릴러" name="category">
                                      <label class="form-check-label" for="inlineCheckbox2">스릴러</label>
                                      
                                      <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="로맨스" name="category">
                                      <label class="form-check-label" for="inlineCheckbox3">로맨스</label>
                                      
                                      <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="액션" name="category">
                                      <label class="form-check-label" for="inlineCheckbox4">액션</label>

                                      <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="판타지" name="category">
                                      <label class="form-check-label" for="inlineCheckbox5">판타지</label>

                                  <!-- </div> -->

                                  <!-- <div class="form-check form-check-inline"> -->
                                      <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="코미디" name="category">
                                      <label class="form-check-label" for="inlineCheckbox6">코미디</label>

                                      <input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="에로" name="category">
                                      <label class="form-check-label" for="inlineCheckbox7">에로</label>

                                      <input class="form-check-input" type="checkbox" id="inlineCheckbox8" value="범죄" name="category">
                                      <label class="form-check-label" for="inlineCheckbox8">범죄</label>

                                      <input class="form-check-input" type="checkbox" id="inlineCheckbox9" value="애니메이션" name="category">
                                      <label class="form-check-label" for="inlineCheckbox9">애니메이션</label>

                                      <input class="form-check-input" type="checkbox" id="inlineCheckbox10" value="느와르" name="category">
                                      <label class="form-check-label" for="inlineCheckbox10">느와르</label>
                                  <!-- </div> -->
                              </div>
                              <br>


                              <div class="form-group">
                              국가
                              <br>
                                  <div class="form-check form-check-inline">
                                      <input type="radio" id="radio1" name="nation" value="1" checked> 
                                      <label for="radio1">국내</label>

                                      <input type="radio" id="radio2" name="nation" value="2">
                                      <label for="radio2">해외</label>
                                  </div>
                              </div>
                              <br>


                              영화포스터
                              <div class="custom-file">
                                  <input type="file" class="custom-file-input" id="customFile1" name="">
                                  <label class="custom-file-label" for="customFile1">파일추가</label>
                                  <img src="" alt="미리보기이미지">
                              </div>

                              <br>

                              예고편영상
                              <div class="custom-file">
                                  <input type="file" class="custom-file-input" id="customFile2" name="">
                                  <label class="custom-file-label" for="customFile2">파일추가</label>
                                  <img src="" alt="미리보기이미지">
                              </div>

                              <br>


                              <div class="form-group">
                              기타 추가 희망 이미지 또는 동영상
                                  <div class="custom-file">
                                      <input type="file" class="custom-file-input" id="customFile3" name="">
                                      <label class="custom-file-label" for="customFile3">파일추가</label>
                                      <img src="" alt="미리보기이미지">
                                  </div>
                              </div>


                              <br>

                              <div class="form-group">
                                  <h4>사용자 요청사항(선택)</h4>
                                  <textarea name="" cols="70" rows="8" placeholder=" 추가적인 요청사항이 있을시 작성해주세요."></textarea>
                              </div>

                              <div>
                                  <input type="checkbox" id="idCheck" value="동의" name="" style="margin-left: 1000px;">
                                  <label class="form-check-label" for="idCheck">닉네임 정보제공 동의(선택)</label> 
                                  
                                  <button type="button" class="btn btn-outline-secondary" style="float: right;" data-toggle="modal" data-target="#submitModal">업로드</button> <br>
                                  
                                  <span style="color:  rgb(158, 158, 158); margin-left: 920px;">(동의시 영화정보에 닉네임이 기재됩니다)</span>
                              </div>
                                      <!-- 영화등록 Modal -->
                                      <div class="modal" id="submitModal">
                                          <div class="modal-dialog">
                                              <div class="modal-content">
                                          
                                                  <!-- Modal Header -->
                                                  <div class="modal-header">
                                                      <h4 class="modal-title">영화등록</h4>
                                                      <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                                                  </div>
                                          
                                                  <!-- Modal body -->
                                                  <div class="modal-body">
                                                      신청하시겠습니까?
                                                  </div>
                                          
                                                  <!-- Modal footer -->
                                                  <div class="modal-footer">
                                                      <button type="button" class="btn btn-outline-secondary" style="float: right;" data-dismiss="modal">취소</button>
                                                      <button type="submit" class="btn btn-outline-secondary" style="float: right;">OK</button>
                                                  </div>
                                          
                                              </div>
                                          </div>
                                      </div>

                          </form>

                      </div>

                  </div>
                  <button type="button" class="btn btn-secondary backbtn" onclick="history.back();">뒤로가기</button> <br>
              </div> 
              
              <br><br>
          <!-- /.container-fluid -->

              <!-- 인물검색 Modal -->
              <div class="modal" id="searchModal">
                  <div class="modal-dialog">
                      <div class="modal-content">
                  
                          <!-- Modal Header -->
                          <div class="modal-header">
                              <h4 class="modal-title">배우 검색</h4>
                              <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
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

        </section>

      </div>
    </div>
    <!-- 컨텐츠부분 종료 -->  
	
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>