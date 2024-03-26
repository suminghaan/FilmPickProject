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
    
    
   /*모달 스타일*/
   
   .modal-header{
   		color: black;
   		font-weight: bold !important;
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
                        <option value="1">전체관람</option>
                        <option value="2">12세 관람가</option>
                        <option value="3">15세 관람가</option>
                        <option value="4">청소년관람불가</option>
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
            				<input class="category" name="category" type="checkbox" id="<%= c.getCategoryNo() %>" value="<%=c.getCategoryName() %>">
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
                    <input type="file" class="custom-file-input" id="customFile1" name="mposter">
                    <label class="custom-file-label" for="customFile1">파일추가</label>
                    <img src="" alt="미리보기이미지">
                </div>

                <br><br>

                <label>예고편영상</label>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile2" name="mpreview">
                    <label class="custom-file-label" for="customFile2">파일추가</label>
                    <img src="" alt="미리보기이미지">
                </div>
                
                <br><br>

                <div class="form-group">
                <label>기타 추가 희망 이미지 또는 동영상</label>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="customFile3" name="upfile">
                        <label class="custom-file-label" for="customFile3">파일추가</label>
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

                    <button type="button" class="btn btn-outline-secondary" style="float: right;" onclick="alert('신규영화 등록이 완료되었습니다.')">업로드</button>
                	
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
                    <button type="button" class="btn btn-secondary btn-sm psModal btnPerson" onclick="searchPerson();">검색</button>
                    <hr>
                    <div class="viewPerson">
                        
                    </div>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" style="float: right;" id="personBtn">추가</button>
                    <button type="button" class="btn btn-outline-secondary" style="float: right;" id="personRemoveBtn">제거</button>
                    <button type="button" class="btn btn-outline-secondary" style="float: right;" data-dismiss="modal">닫기</button>
                </div>
        
            </div>
        </div>
    </div>

    <!-- 영화등록 Modal 
    <div class="modal" id="submitModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header 
                <div class="modal-header">
                    <h4 class="modal-title">영화등록</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body 
                <div class="modal-body">
                    신규영화 등록이 성공적으로 완료되었습니다.
                </div>
        
                <!-- Modal footer 
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" style="float: right;" data-dismiss="modal">확인</button>
                </div>
        
            </div>
        </div>
    </div>
    -->
	<!-- section end -->
	
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
                     +     '<td><input type="text" placeholder="영화배역 입력" name="movieJob" required></td>'
                     +   "</tr>"
                     +   '<input type="hidden" name="personNo" value="' + pNo + '">' // 인물 번호(고유)
                     + "</table>"
                     + "<br><br>"
                     console.log(pFile);
                     console.log(pName);
                     console.log(pNo);
           })
               $(".person-div").append(result);
               count++;
         });
	
	// 인물 삭제 
	$("#personRemoveBtn").click(function(){
           $(".person-div").find("table").last().remove();            
         });
	</script>
	

</body>
</html>