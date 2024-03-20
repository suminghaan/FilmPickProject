<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Main Page</title>

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
}

.title_date {
	font-size: 30px;
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
	background-color: rgb(46, 46, 46);
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
	background-color: rgb(19, 19, 19);
}

.box_font>a {
	text-decoration: none;
}

.posi {
	display: flex;
}
/*.carousel-item.active {
                display: flex !important;
            } */
.box_post {
	display: flex;
	height: 300px;
}

.post {
	margin: 10px;
	width: 100%;
	height: 100%;
}

.post:hover {
	filter: brightness(1.03);
}

.post:hover>div {
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

	<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">  -->
	<section>

		<div id="wrap">
			<div id="main">
				<div id="main_movie" class="carousel slide">

					<!-- The slideshow -->
					<div class="carousel-inner">
						<div class="carousel-item active main_item">
							<div class="posi">
								<div id="main_video">
									<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/rjW9E1BR_30?si=tmWSvmdDWIBUaMH3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe> -->
									<!-- <video width="560" height="315" src="<%= contextPath %>resources/upfiles/20240318104140_63098.mp4"></video>  -->
									<video width="560" height="315" controls>
										<source
											src="<%= contextPath %>/resources/upfiles/20240318104140_63098.mp4"
											type="video/mp4">
									</video>
								</div>
								<div id="main_content">
									<div class="title_font">파묘</div>
									<div class="title_date">2024.02.22</div>
									<div class="title_content">미국 LA, 거액의 의뢰를 받은 무당
										‘화림’(김고은)과 ‘봉길’(이도현)은 기이한 병이 대물림되는 집안의 장손을 만난다. 조상의 묫자리가 화근임을
										알아챈 ‘화림’은 이장을 권하고, 돈 냄새를 맡은 최고의 풍수사 ‘상덕’(최민식)과 장의사 ‘영근’(유해진)이
										합류한다. “전부 잘 알 거야… 묘 하나 잘못 건들면 어떻게 되는지” 절대 사람이 묻힐 수 없는 악지에 자리한
										기이한 묘. ‘상덕’은 불길한 기운을 느끼고 제안을 거절하지만, ‘화림’의 설득으로 결국 파묘가 시작되고…
										나와서는 안될 것이 나왔다.</div>
								</div>
							</div>
						</div>
						<div class="carousel-item main_item">
							<div class="posi">
								<div id="main_video">
									<iframe width="560" height="315"
										src="https://www.youtube.com/embed/81JOj5-xNGc?si=Cpdu4fFLjHGq67a1"
										title="YouTube video player" frameborder="0"
										allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
										allowfullscreen></iframe>
								</div>
								<div id="main_content">
									<div class="title_font">듄: 파트2</div>
									<div class="title_date">2024.02.28</div>
									<div class="title_content">황제의 모략으로 멸문한 가문의 유일한 후계자
										폴.(티모시 샬라메) 어머니 레이디 제시카(레베카 퍼거슨)와 간신히 목숨만 부지한 채 사막으로 도망친다.
										그곳에서 만난 반란군들과 숨어 지내다 그들과 함께 황제의 모든 것을 파괴할 전투를 준비한다. 한편 반란군들의
										기세가 높아질수록 불안해진 황제와 귀족 가문은 잔혹한 암살자 페이드 로타(오스틴 버틀러)를 보내 반란군을
										몰살하려 하는데… 운명의 반격이 시작된다!</div>
								</div>
							</div>
						</div>
					</div>

					<a class="carousel-control-prev" href="#main_movie" type="button"
						data-bs-target="#main_movie"
						style="margin-left: -50px; justify-content: center;"
						data-bs-slide="prev"> <span><i
							class="fa-solid fa-arrow-left" style="color: #ffffff;"></i></span>

					</a> <a class="carousel-control-next" href="#main_movie" type="button"
						data-bs-target="#main_movie"
						style="margin-right: -50px; justify-content: center;"
						data-bs-slide="next"> <span><i
							class="fa-solid fa-arrow-right" style="color: #ffffff;"></i></span>

					</a>

				</div>

				<!-- <div id="main_video">
	                    <iframe width="560" height="315" src="https://www.youtube.com/embed/rjW9E1BR_30?si=tmWSvmdDWIBUaMH3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
	                </div> -->
				<!-- <div id="main_content">
	                    <div class="title_font">파묘</div>
	                    <div class="title_date">2024.02.22</div>
	                    <div class="title_content">미국 LA, 거액의 의뢰를 받은 무당 ‘화림’(김고은)과 ‘봉길’(이도현)은 기이한 병이 대물림되는 집안의 장손을 만난다. 조상의 묫자리가 화근임을 알아챈 ‘화림’은 이장을 권하고, 돈 냄새를 맡은 최고의 풍수사 ‘상덕’(최민식)과 장의사 ‘영근’(유해진)이 합류한다. “전부 잘 알 거야… 묘 하나 잘못 건들면 어떻게 되는지” 절대 사람이 묻힐 수 없는 악지에 자리한 기이한 묘. ‘상덕’은 불길한 기운을 느끼고 제안을 거절하지만, ‘화림’의 설득으로 결국 파묘가 시작되고… 나와서는 안될 것이 나왔다.</div>
	                </div> -->

				<div class="being_movie box">
					<div class="box_font">
						<a href="">현재 상영중인 영화</a>
					</div>
					<div class="box_post">
						<a class="post" href=""><img class="post"
							src="../../resources/img/듄2.jpeg" alt="">
							<div class="box_context">
								<div class="post_context">어디까지길게쓰면글자가짤리게될까가나다가가나나아자차카타파하가</div>
								<div class="post_context">별점</div>
								<div class="post_context">개봉연도,국가</div>
							</div> </a> <a class="post" href=""><img class="post"
							src="<%= contextPath %>/resources/img/파묘.jpeg" alt="">
							<div class="box_context">
								<div class="post_context">파묘</div>
								<div class="post_context">별점</div>
								<div class="post_context">개봉연도,국가</div>
							</div> </a> <a class="post" href=""><img class="post"
							src="../../resources/img/가여운것들.jpeg" alt="">
							<div class="box_context">
								<div class="post_context">가여운것들</div>
								<div class="post_context">별점</div>
								<div class="post_context">개봉연도,국가</div>
							</div> </a> <a class="post" href=""><img class="post"
							src="../../resources/img/건국전쟁.jpeg" alt="">
							<div class="box_context">
								<div class="post_context">건국전쟁</div>
								<div class="post_context">별점</div>
								<div class="post_context">개봉연도,국가</div>
							</div> </a> <a class="post" href=""><img class="post"
							src="../../resources/img/웡카.jpeg" alt="">
							<div class="box_context">
								<div class="post_context">웡카</div>
								<div class="post_context">별점</div>
								<div class="post_context">개봉연도,국가</div>
							</div> </a>
					</div>
					<br> <br>
					<div class="box_font">
						<a href="">영화 인기작</a>
					</div>
					<div class="box_post">
						<a class="post" href=""><img class="post"
							src="../../resources/img/듄2.jpeg" alt="">
							<div class="box_context">
								<div class="post_context">어디까지길게쓰면글자가짤리게될까가나다가가나나아자차카타파하가</div>
								<div class="post_context">별점</div>
								<div class="post_context">개봉연도,국가</div>
							</div> </a> <a class="post" href=""><img class="post"
							src="../../resources/img/파묘.jpeg" alt="">
							<div class="box_context">
								<div class="post_context">파묘</div>
								<div class="post_context">별점</div>
								<div class="post_context">개봉연도,국가</div>
							</div> </a> <a class="post" href=""><img class="post"
							src="../../resources/img/가여운것들.jpeg" alt="">
							<div class="box_context">
								<div class="post_context">가여운것들</div>
								<div class="post_context">별점</div>
								<div class="post_context">개봉연도,국가</div>
							</div> </a> <a class="post" href=""><img class="post"
							src="../../resources/img/건국전쟁.jpeg" alt="">
							<div class="box_context">
								<div class="post_context">건국전쟁</div>
								<div class="post_context">별점</div>
								<div class="post_context">개봉연도,국가</div>
							</div> </a> <a class="post" href=""><img class="post"
							src="../../resources/img/웡카.jpeg" alt="">
							<div class="box_context">
								<div class="post_context">웡카</div>
								<div class="post_context">별점</div>
								<div class="post_context">개봉연도,국가</div>
							</div> </a>
					</div>
				</div>
				<div class="commu box">
					<div class="box_font">
						<a href="">커 뮤 니 티</a>
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
							<a href=""><img
								src="<%= contextPath %>/resources/img/right_icon.png"
								alt="up_icon"></a>
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
								data-bs-slide="next"> <img
								src="<%= contextPath %>/resources/img/right_icon.png"
								alt="up_icon"></a> </a>
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
					<a href="">사용자영화 최신순</a>
				</div>
				<div class="box_post">
					<a class="post" href=""><img class="post"
						src="../../resources/img/듄2.jpeg" alt="">
						<div class="box_context">
							<div class="post_context">어디까지길게쓰면글자가짤리게될까가나다가가나나아자차카타파하가</div>
							<div class="post_context">별점</div>
							<div class="post_context">개봉연도,국가</div>
						</div> </a> <a class="post" href=""><img class="post"
						src="../../resources/img/파묘.jpeg" alt="">
						<div class="box_context">
							<div class="post_context">파묘</div>
							<div class="post_context">별점</div>
							<div class="post_context">개봉연도,국가</div>
						</div> </a> <a class="post" href=""><img class="post"
						src="../../resources/img/가여운것들.jpeg" alt="">
						<div class="box_context">
							<div class="post_context">가여운것들</div>
							<div class="post_context">별점</div>
							<div class="post_context">개봉연도,국가</div>
						</div> </a> <a class="post" href=""><img class="post"
						src="../../resources/img/건국전쟁.jpeg" alt="">
						<div class="box_context">
							<div class="post_context">건국전쟁</div>
							<div class="post_context">별점</div>
							<div class="post_context">개봉연도,국가</div>
						</div> </a> <a class="post" href=""><img class="post"
						src="../../resources/img/웡카.jpeg" alt="">
						<div class="box_context">
							<div class="post_context">웡카</div>
							<div class="post_context">별점</div>
							<div class="post_context">개봉연도,국가</div>
						</div> </a>
				</div>
			</div>
			<!-- 상단으로 올라가는 버튼 -->
			<div class="topPage">
				<a href="#wrap"><img src="<%= contextPath %>/resources/img/up_icon.png" alt="up_icon" style="width: 50px;"></a>
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
		</div>
		</div>

	</section>
	<footer>

		<%@ include file="/views/common/footer.jsp"%>

	</footer>

</body>

</html>