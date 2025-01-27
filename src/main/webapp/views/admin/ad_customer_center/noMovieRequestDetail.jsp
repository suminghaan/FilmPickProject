<%@page import="com.fp.common.model.vo.Attachment"%>
<%@page import="com.fp.movie.model.vo.Category"%>
<%@page import="com.fp.person.model.vo.Person"%>
<%@page import="java.util.List"%>
<%@page import="com.fp.noMovie.model.vo.NoMovie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   NoMovie nm = (NoMovie)request.getAttribute("nm");
   List<Person> pList = (List<Person>)request.getAttribute("pList");
   List<Category> cList = (List<Category>)request.getAttribute("cList");
   Attachment at = (Attachment)request.getAttribute("at");
   List<Category> cMyList = (List<Category>)request.getAttribute("cMyList");
%>
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
/* 인물검색 모달 및 추가관련 스타일*/
	.person-table{
      border: 1px solid black;
      margin: 5px;
      border-collapse: separate;
      border-radius: 10px;
    }

    .person-table *{
      border-collapse: separate;
      border-radius: 10px;
    }

    .person-div{
      display: flex;
      /* border: 1px solid red; */
      width: 1300px;
      flex-wrap:wrap
    }

    .person-div img{
      width: 80px;
      height: 80px;
    }
    
    .personImg{
      width: 80px;
      height: 80px;
    }
    
    .check{
   	  width:150px;
   	  border:1px solid gray;
   	  border-radius: 10px;
   	  padding:5px
   	}
   	.viewPerson{
   	  display: flex;
   	  width : 500px;
   	  flex-wrap:wrap
   	}
   	
/*미리보기 사이즈*/

    #preview {
        max-width: 300px; /* 원하는 최대 너비 */
        max-height: 200px; /* 원하는 최대 높이 */
        width: auto; /* 너비 자동 조정 */
        height: auto; /* 높이 자동 조정 */
    }
    
    #previewVideo{
    	max-width : 300px;
    	max-height : 200px;
    	width: auto;
    	height: auto;
    }
</style>
</head>
<body>
<%@ include file="/views/admin/common/header.jsp" %>


        
        <section class="content_wrap" style="padding-top: 0px;">

        <div class="container">
            <div id="title" class="title"></div>
            <h1>없는영화 신청글 확인</h1>
            <hr>
        </div>
        
        <form action="<%=contextPath %>/insertMovie.admo
        " method="post" enctype="multipart/form-data">
            <div class="all">                
                <div class="form-group">
                <!-- 없는 영화를 영화 테이블에 등록하기 위한 전달값 -->
                <input type="hidden" name="noMovieInsert" value="1"> 
                <input type="hidden" name="noMovieNo" class="nmNo" value="<%=nm.getNmEnrollNo()%>">
                    <label for="exampleFormControlInput1">영화제목</label> <br>
                    <input type="text" class="form-control" id="mTitle" name="mTitle" value="<%=nm.getNmTitle()%>" style="width: 500px;">
                </div>

                <br>

                 <div class="form-group">
                     <label for="exampleFormControlSelect1" style="color:black;">영화관람등급(필수)</label>
                     <select class="form-control" id="exampleFormControlSelect1" name="mGrade" style="width: 600px;" required>
                         <option value="전체관람가">전체관람가</option>
                         <option value="12세 관람가">12세 관람가</option>
                         <option value="15세 관람가">15세 관람가</option>
                         <option value="청소년 관람불가">청소년 관람불가</option>
                     </select>
                 </div>
                
                <script>
                   $(function(){
                    $("#exampleFormControlSelect1 option").each(function(){
                       if($(this).val() == "<%= nm.getNmViewGrade() %>"){
                          $(this).attr("selected", true);
                       }
                    })
                 })
              </script>
                    
                <br>

                <div class="form-group">
                    <label for="mContent">영화줄거리</label> <br>
                    <textarea class="form-control" id="mContent" rows="5" name="mContent" style="width: 500px;">
                       <%=nm.getNmStory() %>
                    </textarea>                
                </div>
                

                <br>

                <div class="form-group dr">
                
                   <div>
                       <label>개봉일</label>
                       <input type="date" name="openDate" class="form-control" style="width: 300px;" value="<%=nm.getNmReleaseDate()%>">
                    </div>
                    <div>
                       <label>러닝타임</label>
                       <input type="text" name="runTime" class="form-control" style="width: 300px;" value="<%=nm.getNmRunTime()%>">
                   </div>
                </div>
                <br>

                
                <br>

                <div class="form-group psButton-body">
                    <label>출연/제작</label>
                    <input type="text" name="casting" class="form-control casting" style="width: 300px;">
                    <button type="button" class="btn btn-secondary btn-sm psButton" data-toggle="modal" data-target="#searchModal">검색</button>
                </div>
                <br>


				<%for(Person p : pList){ %>
               		<div class="castingList">
						<%if(nm.getNmEnrollNo() == p.getNoMovieNo()){ %>
							<div class="person">
	                		<input type="hidden" name="personNo" value="<%=p.getpNo()%>">
		                    <img src="<%=p.getpFile() %>"> <%=p.getpName() %> <br>
		                    <input type="text" name="movieJob" class="casting" value="<%=p.getpJob()%>">
		                    </div>		                  
						<%} %>					
                	</div>
                 <%} %>
                 
                    <%--<div class="person-div">
                      <%for(Person p : pList){ %>
                           <%if(nm.getNmEnrollNo() == p.getNoMovieNo()){ %>
                              <table class='person-table'>
                                 <tr>
                                    <td><img src="<%=p.getpFile()%>"></td>
                                 </tr>
                                 <tr>
                                    <td style="color:black;"><%=p.getpName()%></td>
                                 </tr>
                                 <tr>
                                    <td><input type="text" placeholder="영화배역 입력" name="movieJob" required value="<%=p.getpJob()%>"><button type="button" class="btn btn-outline-secondary" style="float: right;" id="personRemoveBtnBtn">제거</button></td>
                                 </tr>
                                 <input type="hidden" name=personNo value="<%=p.getpNo()%>">
                              </table>
                           <%} %>
                        <%} %>
                      </div>--%>
                    
                
                <br>


				
                <div class="form-group form-category" style="color:black;" id="catecate">
                    <label>영화 장르 선택</label>
                    <br>

                  <%for(Category c : cList){ %>
                  	  
                        <input class="" type="checkbox" id="<%=c.getCategoryNo()%>" value="<%=c.getCategoryNo()%>" name="category">
                        <label class="" for="<%=c.getCategoryNo()%>"><%=c.getCategoryName() %></label>
                  	  
                  <%} %>
                </div>
                    
                    <script>
                            $(function(){
                               $("#catecate input").each(function(){
                                      <% for(int i=0; i<cMyList.size(); i++) { %>
                                          if ($(this).val() == "<%= cMyList.get(i).getNoMovieCNo() %>") {
                                              $(this).prop("checked", true);
                                          }
                             <%}%>
                             })
                          })
                    </script>
                
                <br>
                

                <div class="form-group">
                <label>국가</label>
                <br>
                
                <div class="form-check form-check-inline">
                    <input type="radio" id="radio1" class="nation" name="nation" value="1" style="margin-top: 10px;"> 
                    <label for="radio1">국내</label>

                    <input type="radio" id="radio2" class="nation" name="nation" value="2">
                    <label for="radio2">해외</label>
                </div>
               
                
                 <script>
                        $(function(){
                           $(".nation").each(function(){
                              if($(this).val() == "<%= nm.getNmNation() %>"){
                                 $(this).attr("checked", true);
                              }
                           })
                        })
                 </script>
                           
                <br><br>
 
                <label>영화포스터</label>
                <div class="custom-file updateSrc" style="color:black;">
                	 <input type="hidden" name="originPoster" value="<%=nm.getNmPoster()%>" >        	
                     <input type="file" class="custom-file-input" id="customFile1" name="mposter" value="<%=nm.getNmPoster()%>" onchange="previewImage(event)">
                     <label class="custom-file-label" for="customFile1" style="color:black;">파일추가</label>     
                 	 <img id="preview" src="<%=contextPath + "/" + nm.getNmPoster() %>" alt="미리보기이미지">
                 </div>

                <br><br><br><br>

                 <p style="color:black;">예고편영상(필수)</p>
                    <div class="custom-file updateSrc" style="color:black;">
                    	<input type="hidden" name="originPreview" value=" <%= nm.getNmPreview() %> ">                   	
                        <input type="file" class="custom-file-input" id="customFile2" name="mpreview" value="<%=nm.getNmPreview()%>" onchange="previewVideo(event)">
                        <label class="custom-file-label" for="customFile2" style="color:black;">파일추가</label>
                        <video id="previewVideo" src="<%=contextPath + "/" + nm.getNmPreview() %>" controls alt="예고편영상미리보기"></video>
                    </div>
                
                <br><br>

                <div class="form-group">
                <label>기타 추가 희망 이미지 또는 동영상</label>
                     <div class="custom-file">
                      <%if(at != null){ %>
                      <%= at.getOriginName() %>
                      <input type="file" class="custom-file-input" id="customFile3" name="upfile3" value="<%= at.getFileNo()%>">
                      <%} %>
                      <input type="file" class="custom-file-input" id="customFile3" name="upfile3">
                      <label class="custom-file-label" for="customFile3" style="color:black;">파일추가</label>
                      <img src="" alt="미리보기이미지">
                  </div>
                </div>


                <br>

			 <div class="form-group">
                    <label>현재 상영여부 : </label>
                    <br>
                    <input type="radio" id="radioX" name="currentScreening" value="N" checked> 
                    <label for="radioX">현재 미상영</label>

                    <input type="radio" id="radioM" name="currentScreening" value="Y">
                    <label for="radioM">상영중</label>
                	
                </div>
			
             <div class="form-group" style="color:black;">
                   <h4>사용자 요청사항</h4>
                   <textarea name="userRequest" cols="70" rows="8" placeholder=" 추가적인 요청사항이 있을시 작성해주세요."><%=nm.getNmUserRequest() != null ? nm.getNmUserRequest() : ""%></textarea>
               </div>
                <br>
                
                <!-- 사용자가 등록한 영화일 경우 -->
                <div class="form-group inputUser">
                    <div class="userInfo">
                        <p><label>등록한 사용자 회원번호 : </label><%=nm.getMemNo() %>번</p>
                    </div>
                </div>
            </div>
        
    </div>
        <div class="container d-flex justify-content-end" style="margin-top: 30px; margin-bottom: 30px;">
        <!-- <button type="button" class="btn btn-secondary btn-sm" onclick="alert('수정이 완료되었습니다.');" style="margin-right: 10px;">수정</button> -->    
        <button type="submit" class="btn btn-secondary btn-sm" style="margin-right: 10px;">승인</button>
        <button type="button" class="btn btn-secondary btn-sm" onclick="btnRefuse();">거절</button>    
       </div>
       </form>
       </section>
    

    <!-- 인물검색 Modal -->
              <div class="modal" id="searchModal" style="color:black;">
                  <div class="modal-dialog">
                      <div class="modal-content">
                  
                          <!-- Modal Header -->
                          <div class="modal-header">
                              <h4 class="modal-title">배우 검색</h4>
                              <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                          </div>
                  
                          <!-- Modal body -->
                          <div class="modal-body">
                              <input type="text" name="inputPerson" class="form-control inputPerson"">
                              <button type="button" class="btn btn-secondary btn-sm psModal btnPerson" >검색</button>
                              <hr>
                              <div class="viewPerson">
                                  
                              </div>
                          </div>
                          <!-- onclick="searchPerson();" -->
                        <script>
                            $(".inputPerson").on("input", function(){
                               
                               if ($(this).val().trim() === "") {
                                  $(".viewPerson").html("");
                               } else {
                                  searchPerson();
                               }
                               
                            })
                        </script>
                  
                          <!-- Modal footer -->
                          <div class="modal-footer">
                              <button type="button" class="btn btn-outline-secondary" style="float: right;" id="personBtn">추가</button>
                              <button type="button" class="btn btn-outline-secondary" style="float: right;" id="personRemoveBtn">제거</button>
                              <button type="button" class="btn btn-outline-secondary" style="float: right;" data-dismiss="modal">닫기</button>
                          </div>
                  
                      </div>
                  </div>
              </div>
                  
                         
              
              <script>
              function searchPerson(){
                 
                 $(".viewPerson").html("");
                  let result = "";
                  $.ajax({
                      url:"<%=contextPath%>/search.pe",
                      data:{name:$(".inputPerson").val()},
                      type:"post",
                      success:function(person){ // 인물번호, 인물이미지경로, 인물이름, 인물직업 조회
                         console.log(person.length);
                          if(person.length != 0){ // 받아온 person에 값이 담겨있을 때
                              for(let i=0; i<person.length; i++){
                                  result =  "<div class='check'>"
                                          +       "<table>"
                                          +           "<tr>"
                                          +               "<td><label for='boxbox" + i + "'><img class='personImg' src='<%=contextPath%>/" + person[i].pFile + "'></label></td>"
                                          +           "</tr>"
                                          +           "<tr>"
                                          +               "<td class='personName'>" + person[i].pName + "</td>"
                                          +               "<input name='personNo' class='personNo' type='hidden' value='" + person[i].pNo + "'>"
                                          +           "</tr>"
                                          +           "<tr>"
                                          +               "<td class='personJob'>" + person[i].pJob + "</td>"
                                          +           "</tr>"
                                          +       "<input class='checkboxbox' type='checkbox' id='boxbox" + i + "'>"
                                          +       "</table>"
                                          +   "</div>";
                                  $(".viewPerson").append(result);
                              }
                          } else if (person.length == 0){ // 받아온 person이 비어있을 때
                              result = " ";
                             console.log("length는 0");
                              $(".viewPerson").html("검색된 인물이 없습니다.");
                          }
                      },
                      error:function() {
                         console.log("AJAX 통신 실패");
                      }
                      
                  });
              }
              
               var count = 0; //최대 8명만 추가할 수 있는 조건
               // 없는영화 출연진 추가하는 스크립트
               $("#personBtn").click(function(){
                 
                   var inputChecked = $(".viewPerson input:checked");
                   console.log(inputChecked);
                  
                 if(count < 8){

                 let result = "";
                 inputChecked.each(function(){
                  let pNo = $(this).closest('.check').find('.personNo').val(); // 체크된 인물의 pNo 값 가져오기
                  let pFile = $(this).closest('.check').find('.personImg').attr('src'); // 체크된 인물의 이미지 경로 가져오기
                  let pName = $(this).closest('.check').find('.personName').text(); // 체크된 인물의 이름 가져오기
                  let pJob = $(this).closest('.check').find('.personJob').text();
                  result += "<table class='person-table'>"
                           +   "<tr>"
                           +     "<td><img src='" + pFile + "'></td>" // 이미지 소스에 pFile는 이미지 저장경로
                           +   "</tr>"
                           +   "<tr>"
                           +     "<td style='color:black;'>" + pName + "</td>" // 인물 이름임
                           +   "</tr>"
                           +   "<tr>"
                           +     '<td><input type="text" placeholder="영화배역 입력" name="movieJob" required><button type="button" class="btn btn-outline-secondary" style="float: right;" id="personRemoveBtnBtn">제거</button></td>'
                           +   "</tr>"
                           +   '<input type="hidden" name="personNo" value="' + pNo + '">' // 인물 번호(고유)
                           + "</table>"
                           console.log(pFile);
                           console.log(pName);
                           console.log(pNo);
                 })
                     $(".person-div").append(result);
                     count++;
                 }else{
                   alert("8명이상 추가할 수 없습니다.");
                 }
               });
            //인물 빼는 스크립트
               $("#personRemoveBtn").click(function(){
                 $(".person-div").find("table").last().remove();
                   if(count > 0){
                     count--;
                   }
               });
            
               $(document).ready(function() {
                   $(document).on('click', '#personRemoveBtnBtn', function() {
                       $(this).closest('table.person-table').remove(); // 클릭된 버튼의 가장 가까운 부모 테이블을 제거
                       count--;
                   });
               });   

              </script>
    

     <div class="modal fade" id="refuseModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">거절사유 입력</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <form method="<%=contextPath%>/noapproval.nm" action="post">
            <div class="modal-body">
            <!-- 없는영화신청번호 -->
                <div class="container" style="margin-top: 10px; margin-bottom: 20px;">
                    <span class="modal-text">거절사유</span>
                    <span><textarea rows="5" style="resize:none;" name="refuseReason" placeholder="내용을 입력해주세요" class="form-control"></textarea></span>
                </div>
            </div>
            <div class="modal-footer d-flex justify-content-center ">
            <button type="submit" class="btn btn-secondary" data-dismiss="modal" onclick="alert('거절사유 작성이 완료되었습니다.')">작성</button>
            
            </div>
            </form>
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
    
    <script>
    	function btnRefuse(){
    		location.href='<%=contextPath%>/refuse.nm?no=' + $('.nmNo').val();
    	};
    </script>
</body>
</html>