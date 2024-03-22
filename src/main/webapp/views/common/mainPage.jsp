<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fp.movie.model.vo.Movie, java.util.List" %>
<%
	List<Movie> vlist = (List<Movie>)request.getAttribute("vlist");
	List<Movie> plist1 = (List<Movie>)request.getAttribute("plist1");
	List<Movie> plist2 = (List<Movie>)request.getAttribute("plist2");
	List<Movie> plist3 = (List<Movie>)request.getAttribute("plist3");
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
}

.poster:hover {
	filter: brightness(1.03);
}

.poster:hover>div {
	display: block;
}

.box_context {
	margin: 10px;
	width: 100%;
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
	height: 100px;
	font-size: 20px;
	height: 60px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.movePage img {
	margin: auto;
	width: 50px;
}

.commu_wri {
	display: flex;
	justify-content: space-between;
	height: 40px;
	margin-top: -15px;
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
	height: 120px;
}

.new_movie {
	height: 450px;
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
									<video id="video_<%= i %>" width="560" height="315" controls autoplay>
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
				
				        // Function to pause videos in active item
				        function pauseVideos() {
				        	let activeItem = mainMovieCarousel.querySelector(".carousel-item.active");
				        	let videos = activeItem.querySelectorAll("video");
				
				            // Pause all videos in the active item
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
						<a class="post" href="<%= contextPath %>/movieDetail.fp?movieNo=<%= plist1.get(i).getMvNo() %>">
							<img class="poster_img" src="<%= plist1.get(i).getMvPoster() %>">
								<div class="box_context">
									<div class="post_context"><%= plist1.get(i).getMvName() %></div>
									<div class="post_context">"평균 별점 : " + <%= plist1.get(i).getStarRatingAvg() %></div>
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
						<a class="post" href="<%= contextPath %>/movieDetail.fp?movieNo=<%= plist2.get(i).getMvNo() %>">
							<img class="poster_img" src="<%= plist2.get(i).getMvPoster() %>">
								<div class="box_context">
									<div class="post_context"><%= plist2.get(i).getMvName() %></div>
									<div class="post_context">"평균 별점 : " + <%= plist2.get(i).getStarRatingAvg() %></div>
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
						<div class="commu_list">
							<div class="commu_title">글제목</div>
							<div class="commu_wri">
								<p style="color: rgb(52, 52, 52);">관리자</p>
								<p style="color: rgb(52, 52, 52);">2024.03.07</p>
							</div>
						</div>
						<div class="commu_list">
							<div class="commu_title">글글제목글글글글ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ제목글글제목글글제목글글제목글글제목</div>
							<div class="commu_wri">
								<p style="color: rgb(52, 52, 52);">관리자</p>
								<p style="color: rgb(52, 52, 52);">2024.03.07</p>
							</div>
						</div>
						<div class="commu_list">
							<div class="commu_title">글글제목글글글제목글글</div>
							<div class="commu_wri">
								<p style="color: rgb(52, 52, 52);">관리자</p>
								<p style="color: rgb(52, 52, 52);">2024.03.07</p>
							</div>
						</div>
						<div class="movePage">
							<a href="<%=contextPath%>/main.bo">
								<img src="<%= contextPath %>/resources/img/right_icon.png">
							</a>
						</div>
					</div>
					<div class="box_font">
						<a href="">최신등록 리뷰</a>
					</div>

					<div id="review" class="carousel slide">

						<div class="carousel-inner">
							<div class="carousel-item active">
								<div class="posi">
									<div class="review_content">div로 만들어야하나...</div>
									<div class="review_content">리뷰를 어케할까</div>
									<div class="review_content">리뷰를 어케할까</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="posi">
									<div class="review_content">기웅이가 만든거 긁어올껀데 div로 만들려나...?
									</div>
									<div class="review_content">리뷰를 어케할까</div>
									<div class="review_content">리뷰를 어케할까</div>
								</div>
							</div>
						</div>

						<div class="movePage">
							<a class="carousel-control-next" href="#review" type="button"
								data-bs-target="#review" style="justify-content: flex-end;"
								data-bs-slide="next"> 
								<img src="<%= contextPath %>/resources/img/right_icon.png"></a>
						</div>
					</div>
					<!-- <div class="review">
                            <div class="review_content">
                                기웅이가 만든거 긁어올껀데 div로 만들려나...?
                            </div>
                            <div class="review_content">
                                리뷰를 어케할까
                            </div>
                            <div class="review_content">
                                리뷰를 어케할까
                            </div>
                            <div class="review_content">
                                리뷰를 어케할까
                            </div>
                            -->

				 
			</div>
			<div class="new_movie box" style="margin-bottom: 10px;">
				<div class="box_font">
					<a href="">영화 평점순</a>
				</div>
				<div id="carousepost" class="poster_content">
						<% for(int i = 0; i < plist3.size(); i++){ %>
						<a class="post" href="<%= contextPath %>/movieDetail.fp?movieNo=<%= plist3.get(i).getMvNo() %>">
							<img class="poster_img" src="<%= plist3.get(i).getMvPoster() %>">
								<div class="box_context">
									<div class="post_context"><%= plist3.get(i).getMvName() %></div>
									<div class="post_context">"평균 별점 : " + <%= plist3.get(i).getStarRatingAvg() %></div>
									<div class="post_context"><%= plist3.get(i).getMvOpenDate() %></div>
								</div>
						</a> 
						<% } %>
					</div>
					 
			</div>
			<!-- 상단으로 올라가는 버튼 -->
			<div class="topPage" style="">
				<a href="#wrap"><img src="<%= contextPath %>/resources/img/up_icon.png" alt="up_icon" style="width: 50px;"></a>
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
			
             
		</div>
		</div>

	</section>
	<footer>

		<%@ include file="/views/common/footer.jsp"%>

	</footer>

</body>

</html>