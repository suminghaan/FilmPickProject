<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fp.noMovie.model.vo.NoMovie" %>
<%@ page import="com.fp.person.model.vo.Person" %>
<%@ page import="com.fp.movie.model.vo.Category" %>
<%@ page import="com.fp.common.model.vo.Attachment" %>
<%@ page import="java.util.List" %>
<%
	NoMovie nm = (NoMovie)request.getAttribute("nm");
	List<Person> pList = (List<Person>)request.getAttribute("pList");
	List<Category> cList = (List<Category>)request.getAttribute("cList");
	// 글번호,카테고리명,제목,내용,작성자아이디
	Attachment at = (Attachment)request.getAttribute("at");
	List<Category> cMyList = (List<Category>)request.getAttribute("cMyList");
	int p = (int)request.getAttribute("p");
	
%>
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
    
    /* 뒤늦게 추가함*/
    .dr{
      display: flex;
    }
    
    .dr *{
      margin-right: 20px;
    }

    .form-category *{
      margin-right: 5px
    }
    
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
   	.updateSrc img, video{
   		width : 200px;
   		height: 250px;
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
                          <h1 style="color:black;">없는영화신청 수정</h1> <br>
                          <form action="<%=contextPath%>/update.noMv" method="post" enctype="multipart/form-data" id="update_form">
                          <input type="hidden" name="noMovieNo" value="<%=nm.getNmEnrollNo()%>">
                          <input type="hidden" name="memNo" value="<%=loginMember.getMemNo()%>">
                              <div class="form-group">
                                  <label for="exampleFormControlInput1" style="color:black;">영화제목(필수)</label> <br>
                                  <input type="text" class="form-control" id="exampleFormControlInput1" name="movieName" style="width: 600px;" required value="<%=nm.getNmTitle()%>">
                              </div>

                              <br>

                              <div class="form-group">
                                  <label for="exampleFormControlSelect1" style="color:black;">영화관람등급(필수)</label>
                                  <select class="form-control" id="exampleFormControlSelect1" name="viewGrade" style="width: 600px;" required>
                                      <option value="전체관람가">전체관람가</option>
                                      <option value="12세 관람가">12세 관람가</option>
                                      <option value="15세 관람가">15세 관람가</option>
                                      <option value="청소년 관람불가">청소년 관람불가</option>
                                  </select>
                              </div>
                              
                              <!-- 기존 없는영화신청글 카테고리명 option 찾아서 selected 속성 부여하도록 script -->
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
                                  <label for="exampleFormControlTextarea1" style="color:black;">영화줄거리(필수)</label> <br>
                                  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="movieStory" style="width: 600px;" required><%=nm.getNmStory()%></textarea>
                              </div>
                              

                              <br>
                              <div class="form-group dr">
                                <div class="form-group" style="color:black;">
                                    개봉일(필수)
                                    <input type="date" name="releaseDate" class="form-control" style="width: 300px;" required value="<%=nm.getNmReleaseDate()%>">
                                </div><br><br><br><br>
                                

                                <div class="form-group" style="color:black;">
                                    러닝타임(필수)
                                    <input type="text" name="runTime" class="form-control" style="width: 300px;" required value="<%=nm.getNmRunTime()%>">
                                </div><br>
                              </div>
                              

                              <div class="form-group psButton-body" style="color:black;">
                                  출연/제작(필수) / 최대 8인
                                  <input type="text"  class="form-control" style="width: 600px;">
                                  <button type="button" class="btn btn-secondary btn-sm psButton" data-toggle="modal" data-target="#searchModal" style="margin-right: 715px;">검색</button>
                              </div><br>

                              <div class="person-div">
                                <!--테이블이 생성될 공간-->
								<%for(Person per : pList){ %>
									<%if(nm.getNmEnrollNo() == per.getNoMovieNo()){ %>
										<table class='person-table'>
											<tr>
												<td><img src="<%=per.getpFile()%>"></td>
											</tr>
											<tr>
												<td style="color:black;"><%=per.getpName()%></td>
											</tr>
											<tr>
												<td><input type="text" placeholder="영화배역 입력" name="movieJob" required value="<%=per.getpJob()%>"><button type="button" class="btn btn-outline-secondary" style="float: right;" id="personRemoveBtnBtn">제거</button></td>
											</tr>
											<input type="hidden" name=personNo value="<%=per.getpNo()%>">
										</table>
									<%} %>
								<%} %>
                              </div>

                              <br><br>
                              <div class="form-group form-category" style="color:black;" id="catecate">
                              영화 장르 선택(필수) <br>
                              		<%for(Category c : cList){ %>
                                      <input class="form-check-input" type="checkbox" id="<%=c.getCategoryNo()%>" value="<%=c.getCategoryNo()%>" name="category">
                                      <label class="form-check-label" for="<%=c.getCategoryNo()%>"><%=c.getCategoryName() %></label>
									<%} %>
                              </div>
                              <br><br>
                             
                              <script>
                              $(function(){
                                  $("#catecate input").each(function(){
                                      <% for(int i=0; i<cMyList.size(); i++) { %>
                                          if ($(this).val() == "<%= cMyList.get(i).getNoMovieCNo() %>") {
                                              $(this).prop("checked", true);
                                          }
                                      <% } %>
                                  });
                              });
                              </script>


                              <div class="form-group" style="color:black;">
                              국가
                              <br>
                                  <div class="form-check form-check-inline" id="nations">
                                      <input type="radio" id="radio1" name="nation" value="1" checked> 
                                      <label for="radio1">국내</label>

                                      <input type="radio" id="radio2" name="nation" value="2">
                                      <label for="radio2">해외</label>
                                  </div>
                              </div>
                              
                            <script>
                     			$(function(){
                     				$("#nations input").each(function(){
                     					if($(this).val() == "<%= nm.getNmNation() %>"){
                     						$(this).attr("checked", true);
                     					}
                     				})
                     			})
                     		</script>
                              
                              <br>


                              <p style="color:black;">영화포스터(필수)</p>
                              <div class="custom-file updateSrc" style="color:black;">
                                  <input type="file" class="custom-file-input" id="customFile1" name="upfile1" required value="<%=nm.getNmPoster()%>">
                                  <label class="custom-file-label" for="customFile1" style="color:black;">파일추가</label>
                                  
                              </div>

                              <br>

                              <p style="color:black;">예고편영상(필수)</p>
                              <div class="custom-file updateSrc" style="color:black;">
                                  <input type="file" class="custom-file-input" id="customFile2" name="upfile2" required value="<%=nm.getNmPreview()%>">
                                  <label class="custom-file-label" for="customFile2" style="color:black;">파일추가</label>
                                  
                              </div>

                              <br>


                              <div class="form-group" style="color:black;">
                              기타 추가 희망 이미지 또는 동영상(선택)
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

                              <div class="form-group" style="color:black;">
                                  <h4>사용자 요청사항(선택)</h4>
                                  <textarea name="userRequest" cols="70" rows="8" placeholder=" 추가적인 요청사항이 있을시 작성해주세요."><%=nm.getNmUserRequest() != null ? nm.getNmUserRequest() : ""%></textarea>
                              </div>

                              <div style="color:black;" id="nickNameRequest">
                                  <input type="checkbox" id="idCheck" value="Y" name="nicknameStatus" style="margin-left: 1000px;">
                                  <label class="form-check-label" for="idCheck">닉네임 정보제공 동의(선택)</label> 
                                  
                                  <button type="button" class="btn btn-outline-secondary" style="float: right;" data-toggle="modal" data-target="#submitModal">수정하기</button> <br>
                                  
                                  <span style="color:  rgb(158, 158, 158); margin-left: 920px;">(동의시 영화정보에 닉네임이 기재됩니다)</span>
                              </div>
                              
                           <script>
                     			$(function(){
                     				$("#nickNameRequest input").each(function(){
                     					if($(this).val() == "<%= nm.getNmUserRequest() %>"){
                     						$(this).attr("checked", true);
                     					}
                     				})
                     			})
                     		</script>

                              
                                      <!-- 영화등록 Modal -->
                                      <div class="modal" id="submitModal" style="color:black;">
                                          <div class="modal-dialog">
                                              <div class="modal-content">
                                          
                                                  <!-- Modal Header -->
                                                  <div class="modal-header">
                                                      <h4 class="modal-title">영화등록</h4>
                                                      <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                                                  </div>
                                          
                                                  <!-- Modal body -->
                                                  <div class="modal-body">
                                                      수정하시겠습니까?
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
                  <button type="button" class="btn btn-secondary backbtn" onclick="back('<%=loginMember.getMemNo()%>', '<%=p%>');">뒤로가기</button> <br>
              </div> 
              
            <script>
				function back(memNo, p){
					location.href="<%=contextPath%>/list.noMv?memNo=" + memNo + "&page=" + p;
				}
			</script>
			
              <br><br>
          <!-- /.container-fluid -->

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

        </section>

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
                                    +               "<td>" + person[i].pJob + "</td>"
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
    
      </div>
    </div>
    <!-- 컨텐츠부분 종료 -->  
	
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>