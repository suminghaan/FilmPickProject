<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.fp.common.model.vo.PageInfo, com.fp.movie.model.vo.Movie, java.util.List"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Movie> mlist = (List<Movie>)request.getAttribute("mlist");
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
	height: 265px;
}

.box_context {
	width: 215px;
	height: 70px;
	background-color: rgba(0, 0, 0, 0.2);
	font-size: 14px;
	display: none;
	position: absolute;
	top: 200px;
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
					onchange="searchlist();">
					<option value="mvAll">전체영화</option>
					<option value="Y">현재상영중인영화</option>
					<option value="A">개봉예정영화</option>
					<option value="N">지난영화</option>
				</select> <select class="btn btnw" id="categorya" name="category"
					style="background-color: whitesmoke; color: black;"
					onchange="searchlist();">
					<option value="categoryAll">장르</option>
					<option value="1">액션</option>
					<option value="2">코미디</option>
					<option value="3">로맨스</option>
					<option value="4">스릴러</option>
					<option value="5">공포</option>
					<option value="6">판타지</option>
					<option value="7">어드벤처</option>
					<option value="8">드라마</option>
					<option value="9">애니메이션</option>
					<option value="10">SF</option>
					<option value="11">범죄</option>
					<option value="12">모험</option>
					<option value="13">다큐멘터리</option>
					<option value="14">가족</option>
					<option value="15">뮤지컬</option>

				</select> <select class="btn btnw" id="viewRating" name="viewRating"
					style="background-color: whitesmoke; color: black;"
					onchange="searchlist();">
					<option value="viewRatingAll">등급</option>
					<option value="전체관람가">전체관람가</option>
					<option value="12세 이상">12세 이상</option>
					<option value="15세 이상">15세 이상</option>
					<option value="청소년 관람불가">청소년 관람불가</option>
				</select> <select class="btn btnw" id="years" name="yesrs"
					style="background-color: whitesmoke; color: black;"
					onchange="searchlist();">
					<option value="yearsAll">연대</option>
					<option value="newyear">올해개봉작</option>
					<option value="202">2020년대</option>
					<option value="201">2010년대</option>
					<option value="200">2000년대</option>
					<option value="199">1990년대</option>
					<option value="198">1980년대이전</option>
				</select> <select class="btn btnw" id="nation" name="nation"
					style="background-color: whitesmoke; color: black;"
					onchange="searchlist();">
					<option value="nationAll">국가</option>
					<option value="1">국내영화</option>
					<option value="2">해외영화</option>
				</select>

			</div>
			<div id="content">
				<div id="filter">
					<select class="btn btn-outline" id="filtera" name="filter"
						style="color: #b4b4b4;" onchange="searchlist();">
						<option value="likeMovie">인기순</option>
						<option value="lately">최신순</option>
						<option value="korean">가나다순</option>
						<option value="reviews">리뷰순</option>
					</select>
				</div>
				<div class="movielist">

					<div class="box_poster"></div>

				</div>
			</div>
			<a class="page-link" href="<%= contextPath %>/openexplo.mo?page="></a>
		</div>
	</section>


	<script>

	$(function(){
		searchlist(1);
	})
	
	function searchlist(requestPage){
		$.ajax({
			url: "<%= contextPath %>/explo.mo",
			data: {currentScreen:$("#currentScreen").val(),
				category:$("#categorya").val(),
				viewRating:$("#viewRating").val(),
				yesrs:$("#years").val(),
				nation:$("#nation").val(),
				filter:$("#filtera").val(),
				page:requestPage},
			success:function(mlist){
				console.log(mlist);
				let value = "";
				for(let i = 0; i < mlist.length; i++){
					value = `<a class="poster" href="<%= contextPath %>/movieDetail.fp?movieNo=<%= mlist.get(i).getMvNo() %>"<img class="poster" src="<%= m.getMvPoster() %>" alt="">
	                       		<div class="box_context">
		                           	<div class="poster_context"><%= mlist.get(i).getMvName() %></div>
		                           	<div class="poster_context"><%= mlist.get(i).getStarRatingAvg() %></div>
		                           	<div class="poster_context"><%= mlist.get(i).getMvOpenDate() %></div>  
	                       		</div>
                   			</a>`;
				}
			},
			error:function(){
				console.log("목록 조회 ajax 실패");
			}
		})
	}
</script>
	<footer>

		<%@ include file="/views/common/footer.jsp"%>

	</footer>

</body>
</html>