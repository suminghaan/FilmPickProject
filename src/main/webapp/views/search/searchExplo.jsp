<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.fp.common.model.vo.PageInfo, com.fp.movie.model.vo.Movie, java.util.List, com.fp.movie.model.vo.Category"
	%>
<%
	List<Category> ca = (List<Category>)request.getAttribute("ca");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>explorationPage</title>
<style>
#wrap, #wrap * {
	box-sizing: border-box;
}

#wrap {
	border: 1px solid black;
	background-color: black;
	display: flex;
	flex-direction: column;
	width: 100%;
	max-width: 1300px;
	margin: auto;
}

select>option {
	color: black;
}

#category {
	border: 1px solid black;
	background-color: #5E5E5E;
	height: 65px;
	display: flex;
	justify-content: space-evenly;
	margin-top: 100px;
	margin-bottom: 20px;
}

#category select {
	margin: 12px;
}

#content {
	margin: auto;
	border: 1px solid black;
	background-color: #272727;
	width: 98%;
	min-height: 800px;
}

#filter {
	display: flex;
	justify-content: right;
	margin-top: 5px;
	margin-right: 15px;
	margin-bottom: 20px;
}

.movielist {
	grid-template-columns: repeat(4, minmax(0, 1fr));
	min-height: 500px;
	margin-left: 20px;
	margin-top: -10px;
}

.box_poster {
	display: flex;
	flex-wrap: wrap;
	width: 1230px;
	min-height: 300px;
	overflow: hidden;
}

.poster {
	width: 225px;
	margin: 10px;
	padding: 5px;
	cursor: pointer;
	position: relative;
	
}

.poster:hover>img {
	filter: brightness(1.03);
	
}

.poster:hover>div {
	display: block;
}

.poster_img {
	width: 215px;
	height: 305px;
	border-radius: 10px;
}

.box_context {
	width: 215px;
	height: 70px;
	background-color: rgba(0, 0, 0, 0.2);
	font-size: 14px;
	display: none;
	position: absolute;
	top: 240px;
	padding: 5px;
}

.poster_context {
	width: 195px;
	color: white;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.btnw {
	width: 200px;
}
.topPage {
	position: sticky;
	right: 350px;
	bottom: 50px;
	display: flex;
	justify-content: flex-end;
	opacity: 0;
	z-index: 1000;
}
</style>
</head>
<body>

	<header>

		<%@ include file="/views/common/header.jsp"%>

	</header>
	<section>

		<div id="wrap">
			<div id="category">

				<select class="btn btnw" id="currentScreen" name="currentScreen"
					style="background-color: whitesmoke; color: black;"
					onchange="searchlist(1);">
					<option value="mvAll">전체영화</option>
					<option value="Y">현재상영중인영화</option>
					<option value="A">개봉예정영화</option>
					<option value="N">지난영화</option>
				</select> 
				<select class="btn btnw" id="categorya" name="category"
					style="background-color: whitesmoke; color: black;"
					onchange="searchlist(1);">
					<option value="categoryAll">장르</option>
				<% for(int i = 0; i < ca.size(); i++){ %>
					<option value="<%=ca.get(i).getCategoryNo()%>"><%=ca.get(i).getCategoryName() %></option>
				<% } %>
				</select> 
				<select class="btn btnw" id="viewRating" name="viewRating"
					style="background-color: whitesmoke; color: black;"
					onchange="searchlist(1);">
					<option value="viewRatingAll">등급</option>
					<option value="전체관람가">전체관람가</option>
					<option value="12세 이상">12세 이상</option>
					<option value="15세 이상">15세 이상</option>
					<option value="청소년 관람불가">청소년 관람불가</option>
				</select> 
				<select class="btn btnw" id="years" name="yesrs"
					style="background-color: whitesmoke; color: black;"
					onchange="searchlist(1);">
					<option value="yearsAll">연대</option>
					<option value="newyear">올해개봉작</option>
					<option value="202">2020년대</option>
					<option value="201">2010년대</option>
					<option value="200">2000년대</option>
					<option value="199">1990년대</option>
					<option value="198">1980년대이전</option>
				</select> 
				<select class="btn btnw" id="nation" name="nation"
					style="background-color: whitesmoke; color: black;"
					onchange="searchlist(1);">
					<option value="nationAll">국가</option>
					<option value="1">국내영화</option>
					<option value="2">해외영화</option>
				</select>

			</div>
			<div id="content">
				<div id="filter">
					<select class="btn btn-outline" id="filtera" name="filter"
						style="color: #b4b4b4;" onchange="searchlist(1);">
						<option value="likeMovie">인기순</option>
						<option value="lately">최신순</option>
						<option value="korean">가나다순</option>
						<option value="reviews">리뷰순</option>
					</select>
				</div>
				<div class="movielist">

					<div class="box_poster"></div>
					
				</div>
					<!-- 상단으로 올라가는 버튼 -->
					<div class="topPage">
						<a href="#wrap"><img src="<%= contextPath %>/resources/img/up_icon.png" alt="up_icon" style="width: 50px;"></a>
					</div>
			</div>
		</div>
		
		<script>
            $(document).ready(function () {
                $(window).scroll(function () {
                    $('.topPage').each(function () {
                        var top_of_window = $(window).scrollTop();

                        if (top_of_window <= 0) {
                            $(this).stop().animate({ 'opacity': '0' }, 50);
                        } else {
                            $(this).stop().animate({ 'opacity': '1' }, 200);
                        }
                    });
                });
            });
         </script>
		
		
	</section>


	<script>

	let lastScroll = 0;
	let globalPage= 1;
	var mutex = false;
	
	
	$(function(){
		searchlist(globalPage);
	})
	
	function searchlist(requestPage){
		
		//console.log(globalPage);
		
		$.ajax({
			url: "<%=contextPath%>/explo.mo",
			type: "post",
			data: {currentScreen:$("#currentScreen").val(),
				category:$("#categorya").val(),
				viewRating:$("#viewRating").val(),
				yesrs:$("#years").val(),
				nation:$("#nation").val(),
				filter:$("#filtera").val(),
				page:requestPage},
				success:function(jobj){
					
					//console.log(jobj.mlist.length);
					let value = "";
					if(jobj.mlist.length > 0){
						for(let i = 0; i < jobj.mlist.length; i++){
							value += "<a class='poster' href='<%= contextPath %>/movieDetail.fp?movieNo=" + jobj.mlist[i].mvNo + "'>"
										+ "<img class='poster_img' src='" + jobj.mlist[i].mvPoster  +"'>"
			                       		+ "<div class='box_context'>"
				                        +   "<div class='poster_context'>" + jobj.mlist[i].mvName + "</div>"
				                        +   "<div class='poster_context'>" + "평균 별점 : " + (jobj.mlist[i].starRatingAvg != null ? jobj.mlist[i].starRatingAvg : "-") + "</div>"
				                        +   "<div class='poster_context'>" + "개봉일 : " + jobj.mlist[i].mvOpenDate + "</div>"  
			                       		+ "</div>"
		                   			+ "</a>";
						}
						//globalPage++; //페이지 증가

					}else{
						value += "";
					}
					//console.log(jobj.mlist.length);
					if(requestPage == 1){
						globalPage = 1;
						$(".box_poster").html(value);
					}else{
						$(".box_poster").append(value);
					}
					
					//globalPage++;
					
				},
				error:function(){
					console.log("목록 조회 ajax 실패");
					
				}
		});
	};
	// 스크롤링 제이쿼리
	$(document).scroll(function(e){
	    
	    var currentScroll = $(this).scrollTop();
	    var documentHeight = $(document).height();

	    //(현재 화면상단 + 현재 화면 높이)
	    var nowHeight = $(this).scrollTop() + $(window).height();

	    //스크롤이 아래로 내려갔을때만 해당 이벤트 진행.
	    if(currentScroll > lastScroll){

	        if(documentHeight < (nowHeight + (documentHeight*0.1))){
	        	if(mutex){
	        	 return;	
	        	}
	        	mutex = true;
	        	globalPage++;
	            searchlist(globalPage);
	            
	            setTimeout(function(){
	            	mutex = false;
	            }, 2000);
	        }
	    }
	    //현재위치 최신화
	    lastScroll = currentScroll;
	});
	
</script>
	<footer>

		<%@ include file="/views/common/footer.jsp"%>

	</footer>

</body>
</html>