<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fp.movie.model.vo.Movie, java.util.List, com.fp.board.model.vo.Board " %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fp.movie.model.vo.Review" %>
<%
	List<Movie> vlist = (List<Movie>)request.getAttribute("vlist");
	List<Movie> plist1 = (List<Movie>)request.getAttribute("plist1");
	List<Movie> plist2 = (List<Movie>)request.getAttribute("plist2");
	List<Movie> plist3 = (List<Movie>)request.getAttribute("plist3");
	List<Board> b = (List<Board>)request.getAttribute("b");
	ArrayList<Review> reviewList = ((ArrayList<Review>)request.getAttribute("reviewList"));
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Main Page</title>
    <link rel="stylesheet" type="text/css" href="resources/css/slick-1.8.1/slick-1.8.1/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/slick-1.8.1/slick-1.8.1/slick/slick-theme.css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	
    <style>
#wrap, #wrap * {
	box-sizing: border-box;
	color: white;
}

#wrap {
	border: 1px solid black;
	background-color: black;
	display: flex;
	flex-direction: column;
	width: 100%;
	max-width: 1300px;
	margin: auto;
	padding: 20px;
}

#main {
	min-height: 1500px;
	margin-top: 100px;
}

#main_movie {
	height: 400px;
	display: flex;
	flex-direction: row;
	/* justify-content: center; */
	/* align-items: center; */
}

#main_video {
	width: 55%;
	height: 400px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-left: 10px;
}

#main_content {
	width: 45%;
	height: 400px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin-right: 50px;
}

.title_font {
	font-size: 60px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.title_date {
	font-size: 30px;
}
.title_content{
	
	text-overflow: ellipsis;
	/*white-space: nowrap;*/
	overflow: hidden;
}

.topPage {
	position: sticky;
	right: 350px;
	bottom: 50px;
	display: flex;
	justify-content: flex-end;
	opacity: 0;
}

.box {
	background-color: rgb(20, 20, 20);
	padding: 20px;
	border-radius: 10px;
}

.box_font {
	width: 200px;
	height: 50px;
	font-size: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 5px;
	background-color: rgb(15, 15, 15);
	
}

.box_font>a {
	text-decoration: none;
}

.posi {
	display: flex;
}

#carousepost {
	display: flex;
    height: 310px;
    margin-left: 30px;
    margin-top: 10px;
    margin-bottom: -20px;
}
.slick-prev {
    left: -40px !important; 
}
.slick-next {
    right: 0px !important;
}
.slick-list {
    margin-left: 30px !important;
}
#poster {
	margin: 10px;
	width: 100%;
	height: 100%;
}

.poster_img {
	margin: 10px;
	width: 215px;
	height: 305px;
	border-radius: 10px;
}

.poster:hover {
	filter: brightness(1.03);
}

.poster:hover>div {
	display: block;
}

.box_context {
	margin: 10px;
	width: 215px;
	height: 50px;
	background-color: rgba(0, 0, 0, 0.2);
	font-size: 10px;
	display: none;
	position: absolute;
	top: 250px;
	padding: 5px;
	z-index: 10;
}

.post_context {
	width: 210px;
	color: white;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.commu {
	
}

.commu_box {
	display: flex;
	width: 1220px;
	height: 120px;
	justify-content: space-between;
	align-items: center;
	margin-top: 15px;
    margin-bottom: 15px;
}

.commu_list {
	background-color: rgb(119, 119, 119);
	width: 350px;
	height: 100px;
	border-radius: 10px;
	margin: 10px;
	padding-left: 10px;
	padding-right: 10px;
	overflow: hidden;
}

.commu_title {
	display: flex;
	align-items: center;
	width: 320px;
	height: 50px;
	font-size: 25px;
	height: 60px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.commu_title>a{
	text-decoration: none;
}

.movePage img {
	margin: auto;
	width: 50px;
}

.commu_wri {
	display: flex;
	justify-content: space-between;
	height: 40px;
	margin-top: 0px;
	margin-bottom: 5px;
}

#review {
	margin-top: 10px;
	margin-bottom: 10px;
	/*              
				display: flex;
			    width: 1220px;
			    height: 120px;
			    justify-content: space-between;
			    align-items: center;
			    */
}

.review_content {
	width: 300px;
	min-height: 400px;
}

.new_movie {
	height: 450px;
}

/* 리뷰 스타일 */
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
            /*
            width: 300px;
		    height: 110%;
		    position: relative;
		    margin-left: 10px;
		    border-radius: 15px;
		    font-size: 15px;
		    word-break: break-all;
		    */
		    width: 300px;
		    height: 110%;
		    position: relative;
		    margin-left: 10px;
		    /* top: 41px; */
		    font-size: 15px;
		    background-color: rgb(20, 20, 20);
		    border-radius: 15px;
		    z-index: 20;
		    word-break: break-all
        }

        .review_content_long {
            width: 300px;
		    height: 110%;
		    position: relative;
		    margin-left: 10px;
		    /* top: 41px; */
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
		    height: 40%;
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
        #reviewflex{
        	height: 400px;
        	display:flex;
        	justify-content: space-around;
        }
        /* 영화 리뷰 끝 */

.star_img {
	height: 20px;
}
</style>
</head>

<body>
	<header>

		<%@ include file="/views/common/header.jsp"%>

	</header>

	<section>

		<div id="wrap">
			<div id="main">
				<div id="main_movie" class="carousel slide">

					<!-- The slideshow -->
					<div class="carousel-inner">
						<% for(int i = 0; i < vlist.size(); i++){ %>
						<div class="carousel-item <%= i == 0 ? "active" : "" %>">
							<div class="posi">
								<div id="main_video">
									<video id="video_<%= i %>" width="560" height="315" controls>
									    <source src="<%= vlist.get(i).getMvPreview() %>" type="video/mp4">
									</video>
								</div>
								<div id="main_content">
									<div class="title_font"><%= vlist.get(i).getMvName() %></div>
									<div class="title_date"><%= vlist.get(i).getMvOpenDate() %></div>
									<div class="title_content"><%= vlist.get(i).getMvStory() %></div>
								</div>
							</div>
						</div>
						<% } %>
					</div>

					<a class="carousel-control-prev" href="#main_movie" type="button" data-bs-target="#main_movie" style="margin-left: -50px; justify-content: center;" data-bs-slide="prev"> 
						<span>
							<i class="fa-solid fa-arrow-left" style="color: #ffffff;"></i>
						</span>
					</a> 
					<a class="carousel-control-next" href="#main_movie" type="button" data-bs-target="#main_movie" style="margin-right: -50px; justify-content: center;" data-bs-slide="next"> 
						<span>
							<i class="fa-solid fa-arrow-right" style="color: #ffffff;"></i>
						</span>
					</a>
				</div>
				
				<script>
				    document.addEventListener("DOMContentLoaded", function() {
				        let mainMovieCarousel = document.getElementById("main_movie");
				        let prevButton = mainMovieCarousel.querySelector(".carousel-control-prev");
				        let nextButton = mainMovieCarousel.querySelector(".carousel-control-next");
				
				        // 비디오요소를 찾아서 일시정지 하는 구문
				        function pauseVideos() {
				        	let activeItem = mainMovieCarousel.querySelector(".carousel-item.active");
				        	let videos = activeItem.querySelectorAll("video");
				
				            videos.forEach(function(video) {
				                video.pause();
				            });
				        }
				
				        // 이전, 다음 버튼 클릭 시 비디오 일시정지 버튼
				        prevButton.addEventListener("click", pauseVideos);
				        nextButton.addEventListener("click", pauseVideos);
				    });
				</script>

				<div class="being_movie box">
					<div class="box_font">
						<a href="">최신 영화</a>
					</div>
				 	<div id="carousepost" class="poster_content">
						<% for(int i = 0; i < plist1.size(); i++){ %>
						<a class="poster" href="<%= contextPath %>/movieDetail.fp?movieNo=<%= plist1.get(i).getMvNo() %>">
							<img class="poster_img" src="<%= plist1.get(i).getMvPoster() %>">
								<div class="box_context">
									<div class="post_context"><%= plist1.get(i).getMvName() %></div>
									<div class="post_context">평균 별점 : <%= (plist1.get(i).getStarRatingAvg() != null) ? plist1.get(i).getStarRatingAvg() : "-" %></div>
									<div class="post_context"><%= plist1.get(i).getMvOpenDate() %></div>
								</div>
						</a> 
						<% } %>
					</div>
					
					<br> <br>
					<div class="box_font">
						<a href="">영화 인기작</a>
					</div>
					<div id="carousepost" class="poster_content">
					<input type="hidden" name="1">
						<% for(int i = 0; i < plist2.size(); i++){ %>
						<a class="poster" href="<%= contextPath %>/movieDetail.fp?movieNo=<%= plist2.get(i).getMvNo() %>">
							<img class="poster_img" src="<%= plist2.get(i).getMvPoster() %>">
								<div class="box_context">
									<div class="post_context"><%= plist2.get(i).getMvName() %></div>
									<div class="post_context">평균 별점 : <%= (plist2.get(i).getStarRatingAvg() != null) ? plist2.get(i).getStarRatingAvg() : "-" %></div>
									<div class="post_context"><%= plist2.get(i).getMvOpenDate() %></div>
								</div>
						</a> 
						<% } %>
					</div>
				</div>
				<div class="commu box">
					<div class="box_font">
						<a href="<%=contextPath%>/main.bo">커 뮤 니 티</a>
					</div>
					<div class="commu_box">
						<% for(int i = 0; i < b.size(); i++){ %>
							<div class="commu_list">
								<div class="commu_title">
									<a href="<%=contextPath%>/detail.bo?no=<%= b.get(i).getbNo() %>"><%= b.get(i).getbTitle() %></a>
								</div>
								<div class="commu_wri">
									<p style="color: rgb(52, 52, 52);"><%= b.get(i).getMemNickname() %></p>
									<p style="color: rgb(52, 52, 52);"><%= b.get(i).getbRegistDate() %></p>
								</div>
							</div>
						<% } %>
						
						<div class="movePage">
							<a href="<%=contextPath%>/main.bo">
								<img src="<%= contextPath %>/resources/img/right_icon.png">
							</a>
						</div>
					</div>
					<!--
					<div class="box_font">
						<a href="">최신등록 리뷰</a>
					</div>

					<div id="review" class="carousel slide">
						<div class="carousel-inner">
								
						<% for(int i = 0; i < reviewList.size(); i++) { %>
						
						<% if(i % 4 == 0) { %>
                        <div class="carousel-item <%= i == 0 ? "active" : "" %>">
						<div id="reviewflex">
                        <% } %>
                        <div class="movie_review_el">
                            <div class="movie_review_part">
                                <div class="thumb_btn">
                                    <div class="thumb_up">
                                        <div class="ag_disag_wrap">
                                            <div class="ag">
                                                <div class="ag_filled filled_wrap">
                                                    <button type="button" class="ag_disag_btn ag_filled_btn"><img
                                                            class="ag_filled_img ag_disag_img"
                                                            src="<%= contextPath %>/resources/img/좋아요.png" alt=""></button>
                                                </div>
                                                <div class="ag_empty empty_wrap">
                                                    <button type="button" class="ag_disag_btn ag_empty_btn"><img
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
                                                    <button type="button" class="ag_disag_btn disag_filled_btn"><img
                                                            class="ag_filled_img ag_disag_img"
                                                            src="<%= contextPath %>/resources/img/싫어요.png" alt=""></button>
                                                </div>
                                                <div class="disag_empty empty_wrap">
                                                    <button type="button" class="ag_disag_btn disag_empty_btn"><img
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
                                </div>
                            </div>
                        </div>
                        <% if(i % 4 == 3 || i == (reviewList.size() - 1)) {%>
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
						-->
				</div>

			<div class="new_movie box" style="margin-bottom: 10px;">
				<div class="box_font">
					<a href="">영화 평점순</a>
				</div>
				<div id="carousepost" class="poster_content">
						<%
						for (int i = 0; i < plist3.size(); i++) {
						%>
						<a class="poster" href="<%=contextPath%>/movieDetail.fp?movieNo=<%=plist3.get(i).getMvNo()%>">
							<img class="poster_img" src="<%=plist3.get(i).getMvPoster()%>">
								<div class="box_context">
									<div class="post_context"><%=plist3.get(i).getMvName()%></div>
									<div class="post_context">평균 별점 : <%= (plist3.get(i).getStarRatingAvg() != null) ? plist3.get(i).getStarRatingAvg() : "-" %></div>
									<div class="post_context"><%=plist3.get(i).getMvOpenDate()%></div>
								</div>
						</a> 
						<%
 						}
 						%>
					</div>
					 
			</div>
			
			</div>
			<!-- 상단으로 올라가는 버튼 -->
			<div class="topPage" style="">
				<a href="#wrap"><img src="<%=contextPath%>/resources/img/up_icon.png" alt="up_icon" style="width: 50px;"></a>
			</div>
			 
			 <script>
			 $(document).ready(function() {
		         $('.poster_content').slick({
		            
		            //dots: true,
		            slidesToShow: 4,
		            slidesToScroll: 1,
		            autoplay: true,
		            autoplaySpeed: 7000,
		            centerMode: false,
		            centerPadding: '0px',
		            initialSlide: 0,
		            responsive: [{
		                breakpoint: 0,
		                settings: {
		                    slidesToShow: 3,
		                    slidesToScroll: 3,
		                    infinite: true,
		                    dots: true
		                }
		            },
		            {
		                breakpoint: 0,
		                settings: {
		                    slidesToShow: 2,
		                    slidesToScroll: 2
		                }
		            },
		            {
		                breakpoint: 0,
		                settings: {
		                    slidesToShow: 1,
		                    slidesToScroll: 1
		                }
		            }
		            ]
		        });
			 });
		    </script>
			
			
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
			 
			
			
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
		<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script>
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
		</script>
             
		</div>
		</div>

	</section>
	<footer>

		<%@ include file="/views/common/footer.jsp"%>

	</footer>

</body>

</html>