<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.fp.movie.model.vo.Category" %>
<%@ page import="java.util.List" %>
<% List<Category> list = (List<Category>)request.getAttribute("list"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규영화등록</title>

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
    
    /* 인물 검색 관련 스타일*/
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
    
    #previews1{
    	max-width : 300px;
    	max-height : 200px;
    	width: auto;
    	height: auto;
    }

	#previews2{
    	max-width : 300px;
    	max-height : 200px;
    	width: auto;
    	height: auto;
    }
	
	
	#previews3{
    	max-width : 300px;
    	max-height : 200px;
    	width: auto;
    	height: auto;
    }
	
	#previewVideo1{
    	max-width : 300px;
    	max-height : 200px;
    	width: auto;
    	height: auto;
    }
    
    
   /*모달 스타일*/
   
   .modal-header{
   		color: black;
   		font-weight: bold !important;
   }
	

 /*content style*/
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


	<!-- Header start -->
	<%@ include file="/views/admin/common/header.jsp" %>
	<!-- Header end -->
	
	
	<!-- section start -->		
		
      <div class="content">

        
        <section class="content_wrap" style="padding-top: 0px;">

        <div class="container">
            <div id="title" class="title"></div>
            <h1>신규영화등록</h1>
            <hr>
        </div>
        
        <form action="<%=contextPath %>/insertMovie.admo" method="post" enctype="multipart/form-data">
            <div class="all">                
                <div class="form-group">
                    <label for="movieTitle">영화제목</label> <br>
                    <input type="text" class="form-control" id="mTitle" name="mTitle" placeholder="제목입력" style="width: 500px;" required>
                </div>

                <br>

                <div class="form-group">
                    <label for="mGrade">영화관람등급</label>
                    <select class="form-control" id="mGrade" name="mGrade" style="width: 400px;" required>
                        <option value="전체관람">전체관람</option>
                        <option value="12세 관람가">12세 관람가</option>
                        <option value="15세 관람가">15세 관람가</option>
                        <option value="청소년관람불가">청소년관람불가</option>
                    </select>
                </div>
                    
                <br>

                <div class="form-group">
                    <label for="mContent">영화줄거리</label> <br>
                    <textarea class="form-control" id="mContent" rows="5" name="mContent" style="width: 500px;" required></textarea>                
                </div>
                

                <br>

                <div class="form-group dr">
                
                	<div>
                    	<label>개봉일</label>
                    	<input type="date" name="openDate" class="form-control" style="width: 300px;" required>
                    </div>
                    <div>
                    	<label>러닝타임</label>
                    	<input type="text" name="runTime" class="form-control" style="width: 300px;" required>
                	</div>
                </div>
                <br>

                
                <br>

                <div class="form-group psButton-body">
                    <label>출연/제작</label>
                    <input type="text" name="casting" class="form-control" style="width: 300px;">
                    <button type="button" class="btn btn-secondary btn-sm psButton" data-toggle="modal" data-target="#searchModal">검색</button>
                </div>
                <br>
                <div class="person-div">
                 <!-- 인물정보 들어갈 테이블 생성될 공간 -->
                </div>


                <div class="form-group">
                    <label>영화 장르 선택</label>
                    <br>

                    <div class="form-check form-check-inline">
                    <% for(Category c :list){ %>
            			<% if(c.getCategoryStatus().equals("Y")){ %>
            				<input class="category" name="category" type="checkbox" id="<%= c.getCategoryNo() %>"  value="<%=c.getCategoryNo() %>">
                        	<label class="form-check-label" for="<%= c.getCategoryNo() %>"><%=c.getCategoryName() %></label>
            			<% } %>
            		<% } %>           		
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
                    <input type="file" class="custom-file-input" id="customFile1" name="mposter" onchange="previewImage(event)" required>
                    <label class="custom-file-label" for="customFile1">파일추가</label>
                    <img id="preview" alt="미리보기이미지">
                </div>

                <br><br>

                <label>예고편영상</label>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile2" name="mpreview" onchange="previewVideo(event)" required>
                    <label class="custom-file-label" for="customFile2">파일추가</label>
                    <video id="previewVideo" controls alt="미리보기예고편"></video>
                </div>
                
                <br><br>

                <div class="form-group">
                <label>기타 추가 희망 이미지 또는 동영상</label>
                <% for(int i = 3; i < 7; i++) { %>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="customFile<%= i %>" name="upfile<%= i %>" onchange="previewImages<%= i %>(event)">
                        <label class="custom-file-label" for="customFile<%= i %>">파일추가</label>
                        <img id="previews<%= i %>" alt="미리보기이미지" style="margin-bottom:200px">
                    </div>                    
				<% } %>
                </div>


                <br><br><br><br><br>
                

                <div class="form-group">
                    <label>현재 상영여부 : </label>
                    <br>
                    <input type="radio" id="radioX" name="currentScreening" value="N" checked> 
                    <label for="radioX">현재 미상영</label>

                    <input type="radio" id="radioM" name="currentScreening" value="Y">
                    <label for="radioM">상영중</label>

                    <button type="submit" class="btn btn-outline-secondary" style="float: right;">업로드</button>
                	
                </div>
            </div>
            </div>
        </form>
        </section>
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
                    <input type="text" name="inputPerson" class="form-control inputPerson">
                    <button type="button" class="btn btn-secondary btn-sm psModal btnPerson">검색</button>
                    <hr>
                    <div class="viewPerson">
                        
                    </div>
                </div>
                
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
	// 인물 검색 
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
                                    +               "<td><img class='personImg' src='<%=contextPath%>/" + person[i].pFile + "'></td>"
                                    +           "</tr>"
                                    +           "<tr>"
                                    +               "<td class='personName'>" + person[i].pName + "</td>"
                                    +               "<input name='personNo' class='personNo' type='hidden' value='" + person[i].pNo + "'>"
                                    +           "</tr>"
                                    +           "<tr>"
                                    +               "<td>" + person[i].pJob + "</td>"
                                    +           "</tr>"
                                    +       "<input class='checkboxbox' type='checkbox'>"
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
	
	// 인물 등록
         // 없는영화 출연진 추가하는 스크립트
         $("#personBtn").click(function(){
        	
       		var inputChecked = $(".viewPerson input:checked");
       		console.log(inputChecked);
       		
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
                     + "<br><br>"
                     console.log(pFile);
                     console.log(pName);
                     console.log(pNo);
           })
               $(".person-div").append(result);
         });
	
	// 인물 삭제 
	$("#personRemoveBtn").click(function(){
           $(".person-div").find("table").last().remove();          
         });
	
	$(document).ready(function() {
        $(document).on('click', '#personRemoveBtnBtn', function() {
            $(this).closest('table.person-table').remove(); // 클릭된 버튼의 가장 가까운 부모 테이블을 제거
            count--;
        });
    });   	
	</script>
	
	<script>
	// 이미지 미리보기
    function previewImage(event) {
        var input = event.target;
        var preview = document.getElementById('preview');
        
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                preview.src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]); // 파일을 읽어서 데이터 URL로 변환
        }
    }
	
	// 동영상 미리보기
	function previewVideo(event) {
        var input = event.target;
        var preview = document.getElementById('previewVideo');
        
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                preview.src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]); // 파일을 읽어서 데이터 URL로 변환
        }
    }
	
	// 그외 첨부파일 미리보기
	function previewImages3(event) {
        var input = event.target;
        var preview = document.getElementById('previews3');
        
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                preview.src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]); // 파일을 읽어서 데이터 URL로 변환
        }
    }
	
	function previewImages4(event) {
        var input = event.target;
        var preview = document.getElementById('previews4');
        
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                preview.src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]); // 파일을 읽어서 데이터 URL로 변환
        }
    }
	
	function previewImages5(event) {
        var input = event.target;
        var preview = document.getElementById('previews5');
        
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                preview.src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]); // 파일을 읽어서 데이터 URL로 변환
        }
    }
	
	function previewImages6(event) {
        var input = event.target;
        var preview = document.getElementById('previews6');
        
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                preview.src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]); // 파일을 읽어서 데이터 URL로 변환
        }
    }
	</script>


</body>
</html>