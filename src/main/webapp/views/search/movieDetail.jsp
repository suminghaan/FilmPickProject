<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.fp.common.model.vo.Attachment" %>
    <%@ page import="com.fp.movie.model.vo.Movie" %>
    <%@ page import="com.fp.person.model.vo.Person" %>
    <%@ page import="com.fp.movie.model.vo.Review" %>
    <%@ page import="com.fp.common.model.vo.Approval" %>
    <%@ page import="com.fp.movie.model.vo.Category" %>
    <%
    	Movie movie = (Movie)request.getAttribute("movie");
    	ArrayList<Attachment> attList = ((ArrayList<Attachment>)request.getAttribute("attList"));
    	ArrayList<Person> personList = ((ArrayList<Person>)request.getAttribute("personList"));
    	ArrayList<Review> reviewList = ((ArrayList<Review>)request.getAttribute("reviewList"));
    	ArrayList<Movie> movieList = ((ArrayList<Movie>)request.getAttribute("movieList"));
    	Review review = (Review)request.getAttribute("review");
    	ArrayList<Approval> apprList = (ArrayList<Approval>)request.getAttribute("apprList");
    	ArrayList<Category> categoryList = (ArrayList<Category>)request.getAttribute("categoryList");
    	int countMovieLike = (int)request.getAttribute("countMovieLike");
    %>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
    <title>FILM PICK</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">

    <!-- 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">


    <style>
 

        /* movieDetail에 추가 */
        .search_info {
            height: 1.5%;
            background-color: RGB(20, 20, 20);
            padding-top: 6px;
            padding-left: 50px;
            border-radius: 10px;
        }

        .movie_info {
            height: 4%;
            margin-top: 1%;
            font-size: 20px;
            font-weight: bold;
            padding-left: 40px;
            border-radius: 10px;
        }

        .movie_poster_preview {
            height: 30%;
            margin-top: 0.5%;
            border-radius: 10px;
            background-color: RGB(20, 20, 20);
            display: flex;
            flex-direction: row;
        }

        .movie_like_people {
            height: 20%;
            background-color: rgb(20, 20, 20);
            border-radius: 10px;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            border-radius: 10px;
        }

        .movie_review {
            height: 20%;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }

        .movie_relate {
            height: 23%;
            background-color: rgb(20, 20, 20);
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
        }

        /* =============영화 포스터, 예고편 스타일================ */

        .movie_mainPoster {
            width: 35%;
            /* background-color: white; */
            height: 100%;
        }

        #carouselPoster {
            height: 85%;
        }

        .carousel-inner,
        .carousel-item {
            height: 100%;
        }

        .mainPoster {
            border-radius: 10px;
            height: 90%;
    		padding: 20px;
        }

        .mainPreview {
            width: 90%;
        }

        .poster_info {
            margin-left: 20px;
            font-size: 20px;
            font-weight: 300;
        }

        .movie_preview_etc {
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }

        .movie_mainPreview {
            height: 80%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .movie_etc {
            width: 80%;
            height: 20%;
            margin: auto;
        }

        #carouselEtc,
        .carousel-item,
        .carousel-inner_etc,
        .etcList_wrap {
            height: 100%;
        }

        .etcList_wrap {
            display: flex;
            flex-direction: row;
            justify-content: space-around;
        }

        .etc_poster {
            height: 90%;
            /* width: 15%; */
        }

        /* ==================영화 리뷰=================== */

        .movie_like {
            width: 30%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }

        .movie_btn_wrap {
            height: 20%;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            align-items: center;
        }

        .like_review_btn_wrap {
            height: 50%;
            margin-bottom: 20%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .like_review_btn {
            width: 100%;
            display: flex;
            justify-content: space-evenly;
        }

        .star-rating_info {
            font-size: 15px;
        }

        .review_btn>button {
            background-color: rgba(0, 0, 0, 0);
            width: 100px;
            height: 90px;
            border: none;
        }

        .like_btn_wrap,
        .review_btn_wrap {
            width: 40%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        /* ==================출연/제작 스타일=================== */

        .movie_people {
            width: 63%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }

        .movie_summary {
            height: 25%;
            background-color: rgb(15, 15, 15);
            border-radius: 10px;
            padding: 0 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .short_summary {
            height: 100%;
        }

        .long_summary {
            position: absolute;
            top: 0;
            padding: 0 20px;
            display: none;
            background-color: rgb(15, 15, 15);
            z-index: 10;
        }

        .long_summary_btn
        , .short_summary_btn {
            color: white;
            border-bottom: none;
            cursor: pointer;
        }

        .movie_people_info {
            height: 60%;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
        }

        .movie_people_top {
            height: 40%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
        }

        .movie_people_bottom {
            height: 40%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
        }

        .people_img_info_wrap {
            width: 30%;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .people_img_wrap {
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .people_img {
            height: 80%;
            border-radius: 10px;
        }

        .people_info_wrap {
            margin-left: 20px;
            font-size: 13px;
        }

        .people_tooltip {
            position: absolute;
            height: 80px;
            width: 200px;
            left: 80px;
            top: 100px;
            background: rgba(20, 20, 20, 0.7);
            padding: 10px;
            border-radius: 5px;
            color: #fff;
            text-align: left;
            padding-top: 15px;
            font-size: 15px;
            display: none;
            z-index: 10;
        }

        .people_tooltip:after {
            display: block;
            content: '';
            position: absolute;
            top: -7px;
            left: 15px;
            width: 0px;
            height: 0px;
            border-top: 8px solid none;
            border-left: 8px solid transparent;
            border-right: 8px solid transparent;
            border-bottom: 8px solid rgba(20, 20, 20, 0.7);
            z-index: 10;
        }

        .people_img_info_wrap:hover .people_tooltip {
            display: block;
        }

        /*=====================영화 리뷰================================*/
        .movie_review_title {
            padding-top: 10px;
            width: 100%;
            height: 10%;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        .movie_review_info {
            height: 80%;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
        }

        .movie_review_el {
            height: 90%;
            width: 20%;
            position: relative;
            background-color: rgb(20, 20, 20);
            border-radius: 15px;
        }

        .movie_review_part {
            width: 100%;
            height: 100%;
            position: absolute;
            display: flex;
            flex-direction: column;
        }

        .thumb_btn {
            height: 10%;
            display: flex;
            flex-direction: row;
            justify-content: flex-end;
            align-items: center;
        }

        .user_img_info {
            height: 15%;
            display: flex;
            justify-content: flex-start;
        }

        .user_review_info {
            height: 10%;
            display: flex;
            justify-content: space-around;
        }

        .review_content {
            height: 65%;
            position: relative;
            margin-left: 10px;
            border-radius: 15px;
            font-size: 15px;
            word-break: break-all
        }

        .review_content_long {
            width: 100%;
            height: 110%;
            position: absolute;
            padding-left: 10px;
            top: 121px;
            font-size: 15px;
            background-color: rgb(20, 20, 20);
            border-radius: 15px;
            z-index: 20;
            display: none;
            word-break: break-all
        }

        /* 공감 비공감 버튼 */

        .thumb_up {
            display: flex;
            justify-content: center;
            width: 10%;
        }

        .thumb_down {
            display: flex;
            justify-content: center;
            width: 10%;
        }

        .thumb_count {
            width: 20%;
            text-align: center;
        }

        .thumbBtn {
            margin: 0px 5px;
            --bs-btn-border-color: RGB(247, 39, 140);
            --bs-btn-color: RGB(247, 39, 140);
            --bs-btn-hover-color: #000;
            --bs-btn-hover-bg: RGB(247, 39, 140);
            --bs-btn-hover-border-color: #000;
            font-size: 12px;
            font-weight: bold;
        }

        .btn_active {
            --bs-btn-border-color: #000;
            --bs-btn-bg: RGB(247, 39, 140);
            --bs-btn-color: #000;

            --bs-btn-hover-color: #000;
            --bs-btn-hover-bg: RGB(247, 39, 140);
            --bs-btn-hover-border-color: #000;
        }

        /* 유저 정보 */
        .user_img {
            width: 20%;
            display: flex;
            border-radius: 50%;
            justify-content: center;
            align-items: center;
            margin-left: 10px;
            border: 2px solid #F72798;
            cursor: pointer;
        }

        .user_img:hover {
        	transform: scale(1.2);
        }


        .user_info {
            display: flex;
            align-items: center;
            font-size: 12px;
            width: 60%;
            margin-left: 15px;
        }

        /* 리뷰 별점, 등록일 */
        .user_review_star {
            width: 50%;
        }

        .user_review_date {
            width: 30%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
        }

        .more_info {
            position: absolute;
            height: 5%;
            width: 15%;
            right: 0;
            bottom: 20px;
        }

        .more_info_long {
            width: 15%;
            margin-left: 85%;
        }

        .more_info_btn,
        .more_info_btn_long {
            font-size: 13px;
            border-bottom: none;
            color: white;
            cursor: pointer;
        }
        /* 영화 리뷰 끝 */

        .movie_relate_title {
            height: 5%;
            padding-left: 50px;
        }

        .movie_relate_els {
            height: 90%;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
        }

        .movie_relate_els_top {
            height: 45%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
        }

        .movie_relate_els_bottom {
            height: 45%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
        }

        /* 영화 포스터 스타일 시작 */
        .thumbnail {
            height: 100%;
            cursor: pointer;
            padding-bottom: 10px;
            /* 위치를 표시할 기준이 되는 부모 요소에 relative */
            position: relative;
        }

        .thumbnail_img {
            height: 100%;
            border-radius: 10px;
        }

        .thumbnail_title {
            width: 100%;
            background-color: rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            font-size: 10px;
            color: white;
            text-align: left;
            /* 위치를 이동시킬 요소에 absolute. top. left, right 등으로 위치 조절 */
            position: absolute;
            bottom: 10px;
            /* 요소가 겹쳐있을 때 무엇을 더 위에 표현할지. z-index 값이 클수록 위에 옴 */
            z-index: 10;
            display: none;
        }

        .thumbnail:hover>.thumbnail_title {
            display: block;
        }

        .thumbnail:hover> .thumbnail_img {
            opacity: 0.8;
        }

        /* 영화 포스터 스타일 끝 */

        .starRating_img {
            height: 25px;
        }
        
        /* heart 이미지 크기*/
        .heart-label {
        	height: 70px;
    		width: 70px;
        }        
        
        /* 모달창 */
        .etc_poster{
		    width: auto;
		    border-radius: 10px;
		    cursor: pointer;
		    transition: 0.3s;
	  	}
		  /* 이미지 클릭 시, 밝기 조절 */
		.etc_poster:hover {opacity: 0.8;}
		
		.modal {
		  display: none; /* 모달창 숨겨 놓기 */
		  position: fixed; 
		  z-index: 1; /* 모달창을 제일 앞에 두기 */
		  padding-top: 100px;
		  left: 0; top: 0;
		  width: 100%; height: 100%;
		  overflow: auto; /* 스크롤 허용 auto */
		  cursor: pointer; /* 마우스 손가락모양 */
		  background-color: rgba(0, 0, 0, 0.8);
		}
		/* 모달창 이미지 */
		.modal_content {
		  margin: auto;
		  display: block;
		  width: 50%; height: auto;
		  max-width: 1000px;
		  border-radius: 10px;
		  animation-name: zoom;
		  animation-duration: 0.8s;
		}
		/* 모달창 애니메이션 추가 */
		@keyframes zoom {
		  from {transform: scale(0)}
		  to {transform: scale(1)}
		}
		/* 닫기 버튼 꾸미기 */
		.close {
		  position: absolute;
		  top: 15px;
		  right: 35px;
		  color: #f1f1f1;
		  font-size: 40px;
		  font-weight: bold;
		  transition: 0.3s;
		}
		.close:hover, .close:focus{
		  color: #bbb;
		  text-decoration: none;
		  cursor: pointer;
		}
    </style>
	<%@ include file="/views/common/header.jsp" %>
    <!-- starRating css -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/starRating.css">
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/heart_movieDetail.css">
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/starRating_forReviewTap.css">
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/like&dislike_movieDetail.css">
</head>

<body>
    

        <div class="content_wrap" style="background-color: black; height: 2500px;">
            <div class="content">
                <div class="search_info">
                    <span>"<%= movie.getMvName() %>"</span> 검색 결과
                </div>
                <div class="movie_info">
                    <span><%= movie.getMvName() %></span><br>
                    <span> 개봉일 : <%= movie.getMvOpenDate() %></span>
                    <span style="margin-left: 10px">
                    <% if (categoryList != null) { %> 
                    	<% for(int i = 0; i < categoryList.size(); i++) {%>
                    		<%= categoryList.get(i).getCategoryName() %><% if(i != categoryList.size() - 1) { %>, <% } %> 
                    	<% } %>
                    <% } %>
                    </span><br>
                    <span>러닝타임 : <%= movie.getMvRTime() %></span><br>
                </div>
                <div class="movie_poster_preview">
                    <div class="movie_mainPoster">
                      	<img class="mainPoster" src="<%= movie.getMvPoster() %>" alt="">
                        <div class="poster_info">
                            <span><%= movie.getMvName() %></span><br>
                            <span>평균 별점 :  <%= movie.getStarRatingAvg() != null ? movie.getStarRatingAvg() : "-" %></span><br>
                            <span>개봉일 : <%= movie.getMvOpenDate() %></span>
                        </div>
                    </div>
                    <div class="movie_preview_etc">
                        <div class="movie_mainPreview">
                            <video class="mainPreview" autoplay muted controls loop
                                src="<%= movie.getMvPreview() %>" type="video/mp4"></video>
                        </div>
                        <div class="movie_etc">
                            <div id="carouselEtc" class="carousel slide">
                                <div class="carousel-inner carousel-inner_etc">
                                <% for(int i = 0; i < attList.size(); i++) {%>
                                	<% if(i % 2 == 0) { %>
                                    <div class="carousel-item <%= i == 0 ? "active" : "" %>">
                                        <div class="etcList_wrap">
                                    <% } %>
                                            <img class="etc_poster" src="<%= attList.get(i).getFilePath() %>" alt="">
											<div class="modal">
											  <span class="close">&times;</span>
											  <img class="modal_content" id="img<%= i %>" src="<%= attList.get(i).getFilePath() %>">
											</div>
                                    <% if(i % 2 == 1 || i == (attList.size() - 1)) {%>
                                        </div>
                                    </div>
                                    <% } %>
                                <% } %>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselEtc"
                                    data-bs-slide="prev">
                                    <span><i class="fa-solid fa-arrow-left fa-2x"
                                            style="color: RGB(247, 39, 152);"></i></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselEtc"
                                    data-bs-slide="next">
                                    <span><i class="fa-solid fa-arrow-right fa-2x"
                                            style="color: RGB(247, 39, 152);"></i></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="movie_like_people">
                    <div class="movie_like">
                        <div class="movie_btn_wrap">
                            <div class="star-rating_info">
                                <span class="star-rating_avg" style="font-size:"><%= movie.getMvName() %> 평균 별점 : <%= movie.getStarRatingAvg() != null ? movie.getStarRatingAvg() : "-" %></span><br>
                                <span class="star-rating_count" style="font-size: 15px; padding-left: 10px;">별점 매긴 사람 수 : <%= movie.getNumberOfStarRating() != null ? movie.getNumberOfStarRating() : "-" %></span>
                            </div>
                            <div class="star-wrap">
                                <div class="rating">
                                    <label class="rating__label rating__label--half" for="starhalf_main">
                                        <input type="radio" id="starhalf_main" class="rating__input" name="rating"
                                            value="0.5">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--full" for="star1_main">
                                        <input type="radio" id="star1_main" class="rating__input" name="rating"
                                            value="1">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--half" for="star1half_main">
                                        <input type="radio" id="star1half_main" class="rating__input" name="rating"
                                            value="1.5">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--full" for="star2_main">
                                        <input type="radio" id="star2_main" class="rating__input" name="rating"
                                            value="2">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--half" for="star2half_main">
                                        <input type="radio" id="star2half_main" class="rating__input" name="rating"
                                            value="2.5">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--full" for="star3_main">
                                        <input type="radio" id="star3_main" class="rating__input" name="rating"
                                            value="3">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--half" for="star3half_main">
                                        <input type="radio" id="star3half_main" class="rating__input" name="rating"
                                            value="3.5">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--full" for="star4_main">
                                        <input type="radio" id="star4_main" class="rating__input" name="rating"
                                            value="4">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--half" for="star4half_main">
                                        <input type="radio" id="star4half_main" class="rating__input" name="rating"
                                            value="4.5">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--full" for="star5_main">
                                        <input type="radio" id="star5_main" class="rating__input" name="rating"
                                            value="5">
                                        <span class="star-icon"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="like_review_btn_wrap">
							<div class="like_btn_wrap" style="margin-left: 30px;">
	                                    <div class="heart">
										    <label class="heart_label" for="mainHeart">
										        <input type="checkbox" class="heart_checkbox" id="mainHeart" hidden>
										        <svg t="1689815540548" class="heart_icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"
										            p-id="2271" onclick="heartUpdate(<%= movie.getMvNo() %>)">
										            <path
										                d="M742.4 101.12A249.6 249.6 0 0 0 512 256a249.6 249.6 0 0 0-230.72-154.88C143.68 101.12 32 238.4 32 376.32c0 301.44 416 546.56 480 546.56s480-245.12 480-546.56c0-137.92-111.68-275.2-249.6-275.2z"
										                fill="#231F20" p-id="2272" id="heart"></path>
										        </svg>
										        <span class="heart_span" ></span>
										    </label>
										</div>
                                    <div style="margin-top: 10px;">
                                        좋아요
                                    </div>
                                </div>
                                <div class="review_btn_wrap">
                                    <div class="review_btn">
                                        <button type="button" class="ToReview"><i class="fa-solid fa-pen-to-square fa-4x"
                                                style="color: #F72798;"></i></button>
                                    </div>
                                    <div style="margin-right: 10px;">
                                        리뷰
                                    </div>
                            	</div>                        
                        </div>
                    </div>
                    <div class="movie_people">
                        <div class="movie_summary" style="margin: 20px;">
                            <div class="short_summary">
                            	<% if(movie.getMvStory().length() > 200) {%>
                            		<%= movie.getMvStory().substring(0, 200) + "..."%>
                            		<a class="long_summary_btn">더보기</a>
                            	<% } else { %>
                            		<%= movie.getMvStory() %>
                            	<% } %>
                            </div>
                             <% if(movie.getMvStory().length() > 200) {%>
                            <div class="long_summary" style="border-radius: 15px;">
                            	<%= movie.getMvStory() %>
                                <a class="short_summary_btn">접기</a>
                             </div>
                             <% } %>
                        </div>
                        <div class="movie_people_info">
                            <h4>출연/제작</h4>
                            <% for(int i = 0; i < personList.size(); i++) {%>
                            <% if(i % 3 == 0) { %>
                            <div class="movie_people_<%= i == 0 ? "top" : (i == 3) ? "bottom" : "" %>">
                            <% } %>
                                <div class="people_img_info_wrap">
                                    <div class="people_img_wrap">
                                        <img class="people_img" src="<%= personList.get(i).getpFile() %>" alt="">
                                    </div>
                                    <div class="people_info_wrap">
                                        <span>이름 : <%= personList.get(i).getpName() %></span><br>
                                        <span>배역 : <%= personList.get(i).getCasting() %></span>
                                    </div>
                                    <div class="people_tooltip">
                                        <span>생년월일 : <%= personList.get(i).getpBD() %></span><br>
                                        <span>국적 : <%= personList.get(i).getpNation() %></span><br>
                                    </div>
                                </div>
                            <% if(i % 3 == 2 || i == (personList.size() - 1)) { %>
                            </div>
                            <% } %>
                            <% } %>
                        </div>
                    </div>
                </div>
                <div class="movie_review">
                    <div class="movie_review_title">
                        <h4 style="margin-left: 50px;">리뷰</h4>
                        <a style="border: none; color: white;"  href="<%= contextPath %>/moreReview.fp?movieNo=<%= movie.getMvNo() %>">더보기</a>
                    </div>
                    <div class="movie_review_info">
                    <% if(reviewList != null) { %>
                   	<% for(int i = 0; i < (reviewList.size() > 4 ? 4 : reviewList.size()); i++) { %>
                        <div class="movie_review_el">
                            <div class="movie_review_part">
                                <div class="thumb_btn">
                                    <div class="thumb_up">
                                        <div class="ag_disag_wrap">
                                            <div class="ag">
                                                <div class="ag_filled filled_wrap">
                                                    <button type="button" class="ag_disag_btn ag_filled_btn" id="filled_agree<%= reviewList.get(i).getMvReviewNo() %>" onclick="agreeDelete(<%= reviewList.get(i).getMvReviewNo() %>, this);"><img
                                                            class="ag_filled_img ag_disag_img"
                                                            src="<%= contextPath %>/resources/img/좋아요.png" alt=""></button>
                                                </div>
                                                <div class="ag_empty empty_wrap">
                                                    <button type="button" class="ag_disag_btn ag_empty_btn" id="empty_agree<%= reviewList.get(i).getMvReviewNo() %>" onclick="agreeInsert(<%= reviewList.get(i).getMvReviewNo() %>, this);"><img
                                                            class="ag_empty_img ag_disag_img"
                                                            src="<%= contextPath %>/resources/img/빈좋아요.png" alt=""></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="thumb_count">
                                        <span style="font-size: 8px; padding-left: 0px;">공감 : <%= reviewList.get(i).getAgreeCount() %></span>
                                    </div>
                                    <div class="thumb_down">
                                        <div class="ag_disag_wrap">
                                            <div class="disag">
                                                <div class="disag_filled filled_wrap">
                                                    <button type="button" class="ag_disag_btn disag_filled_btn" id="filled_disagree<%= reviewList.get(i).getMvReviewNo() %>" onclick="disagreeDelete(<%= reviewList.get(i).getMvReviewNo() %>, this);"><img
                                                            class="ag_filled_img ag_disag_img"
                                                            src="<%= contextPath %>/resources/img/싫어요.png" alt=""></button>
                                                </div>
                                                <div class="disag_empty empty_wrap">
                                                    <button type="button" class="ag_disag_btn disag_empty_btn" id="empty_disagree<%= reviewList.get(i).getMvReviewNo() %>" onclick="disagreeInsert(<%= reviewList.get(i).getMvReviewNo() %>, this);"><img
                                                            class="ag_empty_img ag_disag_img"
                                                            src="<%= contextPath %>/resources/img/빈싫어요.png" alt=""></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="thumb_count">
                                        <span style="font-size: 8px; padding-left: 0px;">비공감 : <%= reviewList.get(i).getDisagreeCount() %></span>
                                    </div>
                                </div>
                                <div class="user_img_info">
                                <% if(reviewList.get(i).getMemImgPath() == null) { %>
                                    <div class="user_img" style="border: 2px solid <%= reviewList.get(i).getMemColor() %>" onclick="otherUser(<%= reviewList.get(i).getMemNo() %>)" ><i class="fa-solid fa-user" style="color: <%= reviewList.get(i).getMemColor() %>;"></i>
                                    </div>
                                <% } %>
                                    <div class="user_info">
                                        <span>LV. <%= reviewList.get(i).getMemLevel() %></span>
                                        <span style="margin-left: 10px;"><%= reviewList.get(i).getNickname() %></span>
                                    </div>
                                </div>
                                <div class="user_review_info">
                                    <div class="user_review_star">
                                        <div class="star-wrap">
                                        <% for(int j = 0; j < 5; j++) {%>
                                        <% if (j < (int)Double.parseDouble(reviewList.get(i).getLikePoint())) { %>
                                            <img class="starRating_img" src="<%= contextPath %>/resources/img/리뷰별.png" alt="">
                                        <% } else if(j < Math.ceil((Double.parseDouble(reviewList.get(i).getLikePoint()))) ) {%>
                                        	<img class="starRating_img" src="<%= contextPath %>/resources/img/리뷰반별.png" alt="">
                                        <% } else { %>
                                        	<img class="starRating_img" src="<%= contextPath %>/resources/img/리뷰빈별.png" alt="">
                                        <% } %>
                                        <% } %>
                                        </div>

                                    </div>
                                    <div class="user_review_date">
                                        <span><%= reviewList.get(i).getReviewDate().substring(0, 10) %></span>
                                    </div>
                                </div>
                                <div class="review_content">
                                <% if(reviewList.get(i).getReviewContent() != null) { %>
	                                <% if(reviewList.get(i).getReviewContent().length() > 300) { %>
	                                    <%= reviewList.get(i).getReviewContent().substring(0, 300) + "..." %>
	                                    <div class="more_info">
	                                        <a class="more_info_btn">더보기</a>
	                                    </div>
	                                <% } else {%>
	                                    <%= reviewList.get(i).getReviewContent() %>
	                                <% } %>
	                                </div>
	                                <div class="review_content_long">
	                                <% if(reviewList.get(i).getReviewContent().length() > 300) { %>
	                                    <%= reviewList.get(i).getReviewContent() %>
	                                    <div class="more_info_long">
	                                        <a class="more_info_btn_long">접기</a>
	                                    </div>
	                                <% } %> 
                                <% } %>  
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <% } %>
                    </div>
                </div>
                <div class="movie_relate">
                    <div class="movie_relate_title">
                        <h4>관련 영화</h4>
                    </div>
                    <div class="movie_relate_els">
                    
                    <% for(int i = 0; i < movieList.size(); i++) { %>
                    <% if(i % 5 == 0) { %>
                        <div class="movie_relate_els_<%= i == 0 ? "top" : (i == 5 ? "bottom" : "") %>">
                    <% } %>
                            <div class="thumbnail">
                                <a href="<%= contextPath %>/movieDetail.fp?movieNo=<%= movieList.get(i).getMvNo() %>"><img class="thumbnail_img" src="<%= movieList.get(i).getMvPoster() %>" alt=""></a>
                                <div class="thumbnail_title">
                                    <span><%= movieList.get(i).getMvName() %></span><br>
                                    <span>영화별점 : <%= movieList.get(i).getStarRatingAvg() != null ? movieList.get(i).getStarRatingAvg() : "-" %></span><br>
                                    <span>개봉연도 : <%= movieList.get(i).getMvOpenDate() %></span>
                                </div>
                            </div>
                    <% if(i % 5 == 4 || i == movieList.size() - 1) { %>
                        </div>
                    <% } %>
                    <% } %>
                       
                        
                    </div>
                </div>
            </div>
        </div>

        <%@ include file="/views/common/footer.jsp" %>


    </main>
    <script src="<%= contextPath %>/resources/assets/js/starRating.js"></script>
    <script src="<%= contextPath %>/resources/assets/js/starRating_forReviewTap.js"></script>
    <%-- <script src="<%= contextPath %>/resources/assets/js/like&dislike.js"></script> --%>
    <script src="<%= contextPath %>/resources/assets/js/reviewBtnHover.js"></script>
    <script>
		// 리뷰 더보기
        $(".more_info_btn").each(function (index, el) {
            $(this).click(function () {
                $(el).parent().parent(".review_content").next().css("display", "block");
                $(el).parent().parent(".review_content").css("display", "none");
            })
        })

        $(".more_info_btn_long").each(function (index, el) {
            $(this).click(function () {
                $(el).parent().parent(".review_content_long").prev().css("display", "block");
                $(el).parent().parent(".review_content_long").css("display", "none");
            })
        })

        $(".long_summary_btn").click(function() {
            $(this).parent().css("display", "none");
            $(this).parent().next().css("display", "block");
        })

        $(".short_summary_btn").click(function() {
            $(this).parent().css("display", "none");
            $(this).parent().prev().css("display", "block");
        })
        
       	//리뷰 공감|비공감
      	// 0일 경우 리뷰에 대해 공감 표시, 1일 경우 리뷰에 대해 공감 제거, 2일 경우 리뷰에 대해 비공감 표시, 3일 경우 리뷰에 대해 비공감 제거
       	<% if(loginMember != null) { %>
	     // 회원이 공감|비공감한 리뷰 표시
	    	<% if(reviewList != null) {%>
		    	<% for(int i = 0; i < reviewList.size(); i++) { %>
			    	<% if(apprList != null)  { %>
				    	<% for(int j = 0; j < apprList.size(); j++) { %>
				    		<% if(reviewList.get(i).getMvReviewNo() == apprList.get(j).getMvReviewNo()) {%>
				    			// 해당 리뷰에 이미 공감 표시한 경우
				    			<% if(apprList.get(j).getApprovalType() == 1) { %>
				    					$("#empty_agree<%= reviewList.get(i).getMvReviewNo() %>").parent().css("display", "none");
				    					$("#filled_agree<%= reviewList.get(i).getMvReviewNo() %>").parent().css("display", "block");
				    					
				    					// 비공감 버튼 비활성화
				    					$("#empty_agree<%= reviewList.get(i).getMvReviewNo() %>").parentsUntil(".thumb_btn").eq(3).siblings(".thumb_down").find(".ag_disag_btn").each(function (i, e) {
				    						$(e).addClass("disabled");
				    			            $(e).css("pointer-events", "none")
				    			        })
				    			// 해당 리뷰에 이미 비공감 표시한 경우
				    			<% } else if (apprList.get(j).getApprovalType() == 2) {%>
				    					$("#empty_disagree<%= reviewList.get(i).getMvReviewNo() %>").parent().css("display", "none");
				    					$("#filled_disagree<%= reviewList.get(i).getMvReviewNo() %>").parent().css("display", "block");
				    					
				    					// 공감 버튼 비활성화
				    					$("#empty_disagree<%= reviewList.get(i).getMvReviewNo() %>").parentsUntil(".thumb_btn").eq(3).siblings(".thumb_up").find(".ag_disag_btn").each(function (i, e) {
				    			            $(e).addClass("disabled");
				    			            $(e).css("pointer-events", "none")
				    			        })
				    			<% } %>
				    		<% } %>
				    	<% } %>
			    	<% } %>
		    	<% } %>
	    	<% } %>
       	
      	function agreeInsert(reviewNo, el) {        	
        	$(el).parent().css("display", "none");
	        // 숨겨진 버튼 display block
	        $(el).parent().prev().css("display", "block");
	
	        // 빈 좋아요 버튼을 눌러서 좋아요 표시를 하면 싫어요 버튼을 비활성화로
	        $(el).parentsUntil(".thumb_btn").eq(3).siblings(".thumb_down").find(".ag_disag_btn").each(function (i, e) {
	            $(e).addClass("disabled");
	            $(e).css("pointer-events", "none")
	        })
	        
	        $.ajax({
        			url:"<%= contextPath %>/agDisagInsert.fp"
        			, method:"post"
        			, data: {
        				reviewNo: reviewNo
        				, userNo: <%= loginMember.getMemNo()%>
        				, type: "0"
        			}
        			, success: function(msg) {
        			}
        			, error: function() {
        				console.log("AJAX 통신 실패");
        			}
        	})
        }
        
        function agreeDelete(reviewNo, el) {
	        // 누른 버튼 display none으로
	        $(el).parent().css("display", "none");
	        // 숨겨진 버튼 display block
	        $(el).parent().next().css("display", "block");
	
	        // 꽉찬 좋아요 버튼을 눌러서 좋아요 표시를 제거하면 싫어요 버튼을 활성화로
	        $(el).parentsUntil(".thumb_btn").eq(3).siblings(".thumb_down").find(".ag_disag_btn").each(function (i, e) {
	            $(e).removeClass("disabled");
	            $(e).css("pointer-events", "auto")
	        })
	        $.ajax({
        			url:"<%= contextPath %>/agDisagInsert.fp"
        			, method:"post"
        			, data: {
        				reviewNo: reviewNo
        				, userNo: <%= loginMember.getMemNo()%>
        				, type: "1"
        			}
        			, success: function(msg) {
        			}
        			, error: function() {
        				console.log("AJAX 통신 실패");
        			}
        	})
        }
       	        
		function disagreeInsert(reviewNo, el) {
	        // 누른 버튼 display none으로
	        $(el).parent().css("display", "none");
	        // 숨겨진 버튼 display block
	        $(el).parent().prev().css("display", "block");
	
	        // 빈 싫어요 버튼을 눌러서 싫어요 표시를 하면 좋아요 버튼을 비활성화로
	        $(el).parentsUntil(".thumb_btn").eq(3).siblings(".thumb_up").find(".ag_disag_btn").each(function (i, e) {
	            $(e).addClass("disabled");
	            $(e).css("pointer-events", "none")
	        })
	        $.ajax({
        			url:"<%= contextPath %>/agDisagInsert.fp"
        			, method:"post"
        			, data: {
        				reviewNo: reviewNo
        				, userNo: <%= loginMember.getMemNo()%>
        				, type: "2"
        			}
        			, success: function(msg) {
        			}
        			, error: function() {
        				console.log("AJAX 통신 실패");
        			}
        	})
		}
		
		function disagreeDelete(reviewNo, el) {
	        // 누른 버튼 display none으로
	        $(el).parent().css("display", "none");
	        // 숨겨진 버튼 display block
	        $(el).parent().next().css("display", "block");
	
	        // 꽉찬 싫어요 버튼을 눌러서 싫어요 표시를 제거하면 좋아요 버튼을 활성화로
	        $(el).parentsUntil(".thumb_btn").eq(3).siblings(".thumb_up").find(".ag_disag_btn").each(function (i, e) {
	            $(e).removeClass("disabled");
	            $(e).css("pointer-events", "auto")
	        })
	        $.ajax({
        			url:"<%= contextPath %>/agDisagInsert.fp"
        			, method:"post"
        			, data: {
        				reviewNo: reviewNo
        				, userNo: <%= loginMember.getMemNo()%>
        				, type: "3"
        			}
        			, success: function(msg) {
        			}
        			, error: function() {
        				console.log("AJAX 통신 실패");
        			}
        	})
		}
		//리뷰 공감|비공감
		<% } %>
        
        function otherUser(memNo) {        	
        	<% if(loginMember != null) {%>
        		if(memNo != <%= loginMember.getMemNo() %> ) {
        		location.href ="<%= contextPath %>/otherUser.fp?&&userNo=<%= loginMember.getMemNo() %>&&otherUserNo=" + memNo;
        		} else {
        			alert("자기 자신의 정보를 조회할 수 없습니다.");
        		}
        	<% } else {%>
        		alert("로그인 후 이용 가능한 서비스입니다.");
        	<% } %>
        }
        
        // 회원이 이미 좋아요 표시한 경우 화면에 표시
        <% if(countMovieLike > 0) {%>
        	$("#mainHeart").attr("checked", "checked");
        <% } %>
        
		// 좋아요 표시, 제거 함수
		function heartUpdate(mvNo) {
        	<% if(loginMember != null) { %>
        	console.log($("#mainHeart").is(':checked'));
        		$.ajax({
        			url:"<%= contextPath %>/updateheart.fp"
        			, method:"get"
        			, data: {
        				movieNo: mvNo
        				, userNo: <%= loginMember.getMemNo()%>
        				, isChecked: $("#mainHeart").is(':checked')
        			}
        			, success: function(msg) {
        			}
        			, error: function() {
        				console.log("AJAX 통신 실패");
        			}
        		})
	        <% } else { %>
	        	alert("로그인 후 이용 가능한 서비스입니다");
	        	$(".heart_checkbox").attr("disabled", true);
	        <% } %>
        }
        
        // 별점 매기기 함수
        $(".rating__input").each(function(index, el) {
        	$(this).click(function() {
        		<% if(loginMember != null) { %>
	        		$.ajax({
	        			url:"<%= contextPath %>/insertReview.fp"
	        			, method: "post"
	        			, data: {
	        				movieNo: <%= movie.getMvNo() %>
	        				, userNo: <%= loginMember.getMemNo()%>
	        				, likePoint: $(el).val()
	        				// 이미 남긴 리뷰 정보가 있을 경우 alreadyReview = 1, 없을 경우 0
	        				, alreadyReview : <% if (review != null) { %> <%= "1" %> <%} else { %> <%= "0" %> <% } %>
	        				<% if(review != null && review.getReviewContent() != null) { %>
	        				, reviewContent : "<%= review.getReviewContent() %>"
	        				<% } %>
	        			}
	        			, success: function(msg) {
	        				alert(msg);
	        			}
	        			, error: function() {
	        				console.log("AJAX 통신 실패");
	        			}
	        		})
    	        <% } else { %>
	        		alert("로그인 후 이용 가능한 서비스입니다");
	        		$(".heart_checkbox").attr("disabled", true);
	        	<% } %>
        	})
        })
        
        // 리뷰 페이지로 이동
        $(".ToReview").click(function() {
        	<% if(loginMember != null) { %>

       			location.href="<%= contextPath %>/reviewEnrollForm.fp?movieNo=<%= movie.getMvNo() %>"

        	<% } else { %>
        		alert("로그인 후 이용 가능한 서비스입니다.");
        	<% } %>
        })
        
        //사용자가 남긴 리뷰 정보가 있다면 해당 별점을 표시
       	<% if(review != null && review.getLikePoint() != null) {%>
       			$(".rating__input").each(function(index, el) {
       				if($(el).val() == <%= review.getLikePoint() %>) {
       					$(el).prop("checked", true);
       				}
       			})
       	<% } %>
       	
        $(".etc_poster").each(function(index, el) {
       	 $(el).click(function() {
       		console.log($(el).next());
       		$(el).next().css("display", "block");
       	 }) 
        })
        
        $(".close").each(function(index, el) {
       	 $(el).click(function() {
       		 $(el).parent().css("display", "none");
       	 })
        })
        
        $(".modal").each(function(index, el) {
       	 $(el).click(function() {
       		 $(el).css("display", "none");
       	 })
        })
    </script>
</body>

</html>