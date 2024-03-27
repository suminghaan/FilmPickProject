<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="com.fp.common.model.vo.Attachment" %>
<%@ page import="com.fp.movie.model.vo.Movie" %>
<%@ page import="com.fp.person.model.vo.Person" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fp.movie.model.vo.Category" %>
<%@ page import="java.util.List" %>
<% List<Category> clist = (List<Category>)request.getAttribute("clist"); %>        
<% Movie m = (Movie)request.getAttribute("m"); %>
<% List<Person> plist = (List<Person>)request.getAttribute("plist"); %>
<% List<Attachment> alist = (List<Attachment>)request.getAttribute("alist"); %>
<%
	ArrayList<String> categoryList = new ArrayList<>();
	if(m.getCategoryNames() != null){
		String[] category = m.getCategoryNames().split(", ");
	
		for(int i = 0; i < category.length; i++) {
			categoryList.add(category[i]);
		}
	};
%>



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
        
        <form action="<%=contextPath %>/updateMovie.admo" method="post" enctype="multipart/form-data" id="updateMovie">
            <div class="all">  
            	<input type="hidden" id="movieNo" name="mNo" value="<%=m.getMvNo()%>">             
                <div class="form-group">
                    <label for="movieTitle">영화제목</label> <br>
                    <input type="text" class="form-control" id="mTitle" name="mTitle" required value="<%=m.getMvName() %>" style="width: 500px;">
                </div>

                <br>

                <div class="form-group">
                    <label for="mGrade">영화관람등급</label>
                    <select class="form-control" id="mGrade" name="mGrade" style="width: 400px;" required>
					    <option value="전체관람가" <%= (m.getViewRating() != null && m.getViewRating().equals("전체관람가")) ? "selected" : "" %>>전체관람</option>
					    <option value="12세 관람가" <%= (m.getViewRating() != null && m.getViewRating().equals("12세 관람가")) ? "selected" : "" %>>12세 관람가</option>
					    <option value="15세 관람가" <%= (m.getViewRating() != null && m.getViewRating().equals("15세 관람가")) ? "selected" : "" %>>15세 관람가</option>
					    <option value="청소년 관람불가" <%= (m.getViewRating() != null && m.getViewRating().equals("청소년 관람불가")) ? "selected" : "" %>>청소년관람불가</option>
					</select>
                </div>
                    
                <br>

                <div class="form-group">
                    <label for="mContent">영화줄거리</label> <br>
                    <textarea class="form-control" id="mContent" rows="5" name="mContent" style="width: 500px;" required><%=m.getMvStory() %></textarea>                
                </div>
                

                <br>

                <div class="form-group dr">
                
                	<div>
                    	<label>개봉일</label>
                    	<input type="date" name="dateIn" value="<%=m.getMvOpenDate() %>" class="form-control" style="width: 300px;" required>
                    </div>
                    <div>
                    	<label>러닝타임</label>
                    	<input type="text" name="runningTime" value="<%=m.getMvRTime() %>" class="form-control" style="width: 300px;" required>
                	</div>
                </div>
                <br>

                
                <br>

                <div class="form-group psButton-body">
                    <label>출연/제작</label>
                    <input type="text" name="casting" class="form-control casting" style="width: 300px;">
                    <button type="button" class="btn btn-secondary btn-sm psButton" data-toggle="modal" data-target="#searchModal">검색</button>
                </div>
                 <%--  인물정보 들어갈 테이블 생성될 공간 
                <div class="person-div">
                </div>
                --%>
                <% for(Person p : plist){ %>
                	<div class="castingList">
                	<% if(m.getMvNo() == Integer.parseInt(p.getMovieNo())){ %>
                		<div class="person">
                		<input type="hidden" name="personNo" value="<%=p.getpNo()%>">
	                    <img src="<%=p.getpFile() %>"> <%=p.getpName() %> <br>
	                    <input type="text" name="movieJob" class="casting" value="<%=p.getCasting()%>">
	                    </div>
	                 <% } %>

					</div>
				<% } %>
                	
                
                
                
                <br>


                <div class="form-group">
                    <label>영화 장르 선택</label>
                    <br>

                    <div class="form-check form-check-inline">
                    <% for(Category c :clist){ %>
            			<% if(c.getCategoryStatus().equals("Y")){ %>
            				<input class="form-check-input category" name="category" type="checkbox" id="<%= c.getCategoryNo() %>" value="<%=c.getCategoryNo() %>">
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
                    <input type="radio" id="radio1" name="nation" class="nation" value="1" checked style="margin-top: 10px;"> 
                    <label for="radio1">국내</label>
                    <input type="radio" id="radio2" name="nation" class="nation" value="2">
                    <label for="radio2">해외</label>
                </div>
                </div>
                
                <br><br>
 
                <label>영화포스터</label>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile1" name="mposter" > 
                    <label class="custom-file-label" for="customFile1">파일추가</label>
                    <img src="<%=contextPath + "/" + m.getMvPoster() %>" alt="미리보기이미지">
                </div>

                <br><br><br>

                <label>예고편영상</label>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile2" name="mpreview" >
                    <label class="custom-file-label" for="customFile2">파일추가</label>
                    <video src="<%=contextPath + "/" + m.getMvPreview() %>" controls alt="예고편영상미리보기"></video>
                </div>
                
                <br><br>

                <div class="form-group">
                <label>기타 추가 희망 이미지 또는 동영상</label>
                
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="customFile3" name="upfile">
                        <label class="custom-file-label" for="customFile3">파일추가</label>
                        <% if(!alist.isEmpty()){ %>
                        	<% for(Attachment a : alist){ %>                   	
		                        <% if(Integer.parseInt(a.getRefType()) == 1){ %>
		                        <img src="<%=contextPath + "/" + a.getFilePath() %>" alt="미리보기이미지">
		                        <%}else if(Integer.parseInt(a.getRefType()) == 2){ %>
								<video src="<%=contextPath + "/" + a.getFilePath()%>"></video>
								<%} %>							
                        	<%} %>
                        <%} %>
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
                
                <% if(m.getNmUserRequest() != null){ %>
                <div class="form-group">
                    <label>사용자 요청사항</label>
                    <textarea class="form-control" id="userRequest" rows="5" name="userRequest" style="width: 500px;"><%=m.getNmUserRequest() %></textarea>       
                </div>
                <br>
                
                <!-- 사용자가 등록한 영화일 경우 -->
                <div class="form-group inputUser">
                    <div class="userInfo">
                        <p><label>등록한 사용자 ID : </label><%=m.getMemNo() %></p>
                    </div>
                </div>
                <%} %>
                <button type="submit" class="btn btn-outline-secondary" style="float: right;">수정하기</button>
                
            </div>
        </form>
        <br><br><br><br><br><br><br> 	 
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
	// 장르 선택
	$(".form-check-input").each(function(index, el) {
		<% for(int i = 0; i < categoryList.size(); i++) { %>
			if($(el).next().text() == "<%= categoryList.get(i) %>" ) {
				$(el).attr('checked', true);
			}
			
		<% } %>
	})
	
	// 국가 선택
	$(".nation").each(function(index, el){
		if(<%=m.getMvNation() %> == $(el).val()){
			$(el).attr('checked', true);
		}
	})
	
	// 첫페이지 노출여부
	$(".fpage").each(function(index, el){
		if("<%=m.getfPageExposed()%>" == $(el).val()){
			$(el).attr('checked', true);
		}
	})
	
	</script>
	
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
       	 
        	 
        	 result += '<div class="castingList"> '
        		 	 + 		'<div class="person">' 
        		 	 +			'<input type="hidden" name="personNo" value="' + pNo +'">'
		             +   			"<img src='" + pFile + "'>" + pName + "<br>"
		             +     			'<input type="text" name="movieJob" class="casting" placeholder="영화배역 입력" required>'
		             + 				'<button type="button" class="btn btn-outline-secondary" style="float: right;" id="personRemoveBtnBtn">제거</button>'
		             +  	'</div>'
		             +  '</div>'
		             + 	"<br><br>" 
		             console.log(pFile);
		             console.log(pName);
		             console.log(pNo);
		   })
		       $(".psButton-body").after(result);

         });
	
	// 인물 삭제 
	$("#personRemoveBtn").click(function(){
           $(".person-div").find("table").last().remove();            
         });
	
	$(document).ready(function() {
        $(document).on('click', '#personRemoveBtnBtn', function() {
        	 $(this).closest('.person').remove();// 클릭된 버튼의 가장 가까운 부모 테이블을 제거
            
        });
    });  
	
	console.log($(".castingList").val());
	// 제출 시 카테고리 체크 여부 검사
	$("#updateMovie").submit(function(event) {
		//-------------카테고리체크
		let categoryChecked = false;
		let castingChecked = false;
		
		event.preventDefault();
		
		$(".category").each(function(index, el) {
			if($(el).is(":checked")) {
				categoryChecked = true;
			}
		})	
		
		//--------------인물등록체크
		if($(".castingList").val() != null){
			castingChecked = true;
		}
		
		console.log(categoryChecked);

		if(!categoryChecked) {
			alert("카테고리를 체크해주세요!");
		}
		if(!castingChecked) {
			alert("인물등록이 안되었습니다!")
		}
		
		if(castingChecked && categoryChecked){
			this.submit();
		}
	})
	/*
	// 제출 시 인물 등록여부 검사
	$("#updateMovie").submit(function(event)){
		let castingChecked = false
		
		event.preventDefault();
		

		
		$(".person-div").each(function(index, el){
			if($(el) != null){
				castingChecked = true;
			}
		}}
		if(castingChecked){
			this.submit();
		}else{
			alert("인물등록이 안되었습니다!")
		}
	}
	
	// 제출 시 메인포스터와 예고편 등록 여부 검사
	$("#updateMovie").submit(function(event)){

		event.preventDefault();
		
		if($(".mposter").val() != null && $(".mpreview").val() != null){
			this.submit();
		}else{
			alert("메인 포스터와 메인예고편은 필수 등록입니다 ! ")
		}
		
	}
	*/
	</script>
	

</body>
</html>