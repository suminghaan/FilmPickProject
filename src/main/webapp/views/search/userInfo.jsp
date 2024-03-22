<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.fp.movie.model.vo.Review" %>
    <% 
		Member otherUser = (Member)request.getAttribute("otherUser");
		ArrayList<Review> otherUserReviewList = ((ArrayList<Review>)request.getAttribute("otherUserReview"));
    %>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
    <title>FILM PICK</title>



    <style>

                /* 추가 내용 */
        .user_info_wrap {
            height: 2300px;
            width: 60%;
            background-color: rgb(15, 15, 15);
            border-radius: 20px;
            margin-left: 300px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }

        .user_info_large {
            height: 8%;
            background-color: rgb(20, 20, 20);
            border-radius: 20px;
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

        .user_reviews {
            height: 25%;
            background-color: rgb(20, 20, 20);
            border-radius: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }

        .both_interest {
            height: 18%;
            background-color: rgb(20, 20, 20);
            border-radius: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
        }

        .diff_eval {
            height: 15%;
            background-color: rgb(20, 20, 20);
            border-radius: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
        }

        .taste_analysis {
            height: 25%;
            background-color: rgb(20, 20, 20);
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            border-radius: 20px;
        }

        /*  큰 영역 나누기 끝 */
        .user_icon {
            width: 30%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .user_nickname {
            width: 40%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* 유저 정보 끝 */
        .review_title {
            height: 5%;
            padding-left: 50px;
        }

        .review_total_info {
            height: 7%;
            padding-left: 70px;
        }

        .reviews_wrap {
            height: 78%;
            display: flex;
            flex-direction: row;
            justify-content: space-around
        }

        .movie_review_el {
            width: 27%;
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
            height: 35%;
            display: flex;
            justify-content: flex-start;
        }

        .user_review_info {
            height: 10%;
            display: flex;
            justify-content: space-around;
        }

        .review_content {
            height: 45%;
            position: relative;
            margin-left: 10px;
            border-radius: 15px;
            font-size: 15px;
            word-break: break-all
        }

        .review_content_long {
            width: 100%;
            position: absolute;
            padding-left: 10px;
            top: 247px;
            font-size: 15px;
            background-color: rgb(20, 20, 20);
            border-radius: 15px;
            z-index: 20;
            display: none;
            word-break: break-all
        }

        .user_icon_wrap {
            width: 100px;
            height: 100px;
            border: 2px solid #F72798;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
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
            width: 40%;
            display: flex;
            border-radius: 50%;
            justify-content: center;
            align-items: center;
            margin-left: 10px;
            border: 2px solid #F72798;
        }

        .user_info {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-size: 12px;
            width: 60%;
            margin-left: 10px;
        }

        /* 리뷰 별점, 등록일 */
        .user_review_star {
            width: 50%;
        }

        .user_review_date {
            width: 90%;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
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
            font-size: 11px;
            border-bottom: none;
            color: white;
            cursor: pointer;
        }

        .star_img {
            height: 20px;
        }

        /* 사용자 리뷰 정보 끝 */
        .both_interest_title {
            height: 10%;
            padding-left: 50px;
        }

        .thumbnail_wrap {
            height: 80%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
        }

        .thumbnail {
            width: 25%;
            cursor: pointer;
            display: flex;
            padding-bottom: 10px;
            justify-content: center;
            /* 위치를 표시할 기준이 되는 부모 요소에 relative */
            position: relative;
        }

        .thumbnail_inReview {
            width: 40%;
            cursor: pointer;
            display: flex;
            padding-bottom: 10px;
            justify-content: center;
            /* 위치를 표시할 기준이 되는 부모 요소에 relative */
            position: relative;
        }

        .thumbnail_img {
            width: 100%;
            border-radius: 10px;
        }

        .thumbnail:hover>.thumbnail_title {
            display: block;
        }

        .thumbnail:hover>.thumbnail_img {
            opacity: 0.8;
        }

        .thumbnail_title {
            width: 100%;
            height: 50px;
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

        /* 둘 다 재밌게 본 작품 끝 */
        .diff_eval_title {
            height: 10%;
            padding-left: 50px;
        }

        .diff_eval_info {
            height: 80%;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
        }

        .diff_eval_movie {
            width: 40%;
        }

        .diff_eval_user {
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }

        .diff_thumbnail {
            height: 100%;
            display: flex;
            justify-content: center;
        }

        .diff_thumbnail_img {
            height: 100%;
            border-radius: 15px;
        }

        .diff_thumbnail_title {
            display: flex;
            flex-direction: column;
            font-size: 13px;
            justify-content: center;
            align-items: center;
        }

        .user_info_other,
        .user_info_me {
            height: 45%;
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

        .user_info_icon {
            width: 30%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .user_info_nickname {
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .user_info_nickname_info {
            height: 40%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .user_info_starRating {
            height: 40%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .starRating_img {
            height: 30px;
        }

        /* 평가가 엇갈린 작품 끝 */

        .taste_analysis_title {
            height: 5%;
            padding-left: 50px;
        }

        .taste_analysis_info {
            height: 5%;
            padding-left: 70px;
        }

        .taste_analysis_graph {
            height: 80%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
    <!-- 추가 내용 -->
    <link rel="stylesheet" href="../../resources/css/like&dislike_movieReviewDetail.css">
    <link rel="stylesheet" href="../../resources/css/starRating_forReviewTap.css">
    <script src="https://kit.fontawesome.com/12ec987af7.js" crossorigin="anonymous"></script>
</head>

<body>

    <main>
    <%@ include file="/views/common/header.jsp" %>
       


        <div class="content_wrap" style="background-color: black;">
            <div class="content">
                <div class="user_info_wrap">
                    <div class="user_info_large">
                        <div class="user_icon">
                            <div class="user_icon_wrap" style="border: 2px solid <%= otherUser.getMemColor() %>">
                            	<% if(otherUser.getMemImgPath() == null) {%>
                                	<i class="fa-solid fa-user fa-3x" style="color: <%= otherUser.getMemColor() %>;"></i>
                                <% } else {%>
                                	<img src="<%= otherUser.getMemImgPath() %>">
                                <% } %>
                            </div>
                        </div>
                        <div class="user_nickname">
                            <span>LV.<%= otherUser.getMemLevel() %></span>
                            <span style="margin-left: 10px;"><%= otherUser.getNickname() %></span>
                        </div>
                    </div>
                    <div class="user_reviews">
                        <div class="review_title">
                            <h4>리뷰</h4>
                        </div>
                        <div class="review_total_info">
                            <span>별점 남긴 횟수 : <%= otherUser.getReviewContentCnt() %></span> <br>
                            <span>별점 평균 : <%= otherUser.getAvgLikePoint() %></span>
                        </div>
                        <div class="reviews_wrap">
                        <% for(int i = 0; i < (otherUserReviewList.size() > 3 ? 3 : otherUserReviewList.size()); i++) {%>
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
                                            <span style="font-size: 8px; padding-left: 0px;">공감 : <%= otherUserReviewList.get(i).getAgreeCount() %></span>
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
                                            <span style="font-size: 8px; padding-left: 0px;">비공감 : <%= otherUserReviewList.get(i).getDisagreeCount() %></span>
                                        </div>
                                    </div>
                                    <div class="user_img_info">
                                        <div class="thumbnail_inReview">
                                            <img class="thumbnail_img" src="../../resources/img/듄2.jpeg" alt="">
                                        </div>
                                        <div class="user_info">
                                            <div class="user_level_nickname">
                                                <span>LV.<%= otherUser.getMemLevel() %></span><br>
                                                <span><%= otherUser.getNickname() %></span>
                                            </div>
                                            <div class="starRating">
                                                <% for(int j = 0; j < 5; j++) {%>
		                                        <% if (j < (int)Double.parseDouble(otherUserReviewList.get(j).getLikePoint())) { %>
		                                            <img class="star_img" src="<%= contextPath %>/resources/img/리뷰별.png" alt="">
		                                        <% } else if(j < Math.ceil((Double.parseDouble(otherUserReviewList.get(j).getLikePoint()))) ) {%>
		                                        	<img class="star_img" src="<%= contextPath %>/resources/img/리뷰반별.png" alt="">
		                                        <% } else { %>
		                                        	<img class="star_img" src="<%= contextPath %>/resources/img/리뷰빈별.png" alt="">
		                                        <% } %>
		                                        <% } %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="user_review_info">
                                        <div class="user_review_date">
                                            <div>
                                                <span>듄2</span>
                                            </div>
                                            <div>
                                                <span>작성일 : 2024-03-15</span>
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="review_content">
                                <% if(otherUserReviewList.get(i).getReviewContent().length() > 200) { %>
                                    <%= otherUserReviewList.get(i).getReviewContent().substring(0, 200) + "..." %>
                                    <div class="more_info">
                                        <a class="more_info_btn">더보기</a>
                                    </div>
                                <% } else {%>
                                    <%= otherUserReviewList.get(i).getReviewContent() %>
                                <% } %>
                                </div>
                                <div class="review_content_long">
                                <% if(otherUserReviewList.get(i).getReviewContent().length() > 200) { %>
                                    <%= otherUserReviewList.get(i).getReviewContent() %>
                                    <div class="more_info_long">
                                        <a class="more_info_btn_long">접기</a>
                                    </div>
                                <% } %>   
                                </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <div class="both_interest">
                        <div class="both_interest_title">
                            <h4>둘 다 재밌게 본 작품</h4>
                        </div>
                        <div class="thumbnail_wrap">
                            <div class="thumbnail">
                                <img class="thumbnail_img" src="../../resources/img/듄2.jpeg" alt="">
                                <div class="thumbnail_title">
                                    <span>영화제목</span><br>
                                    <span>영화별점</span><br>
                                    <span>개봉연도, 국가</span>
                                </div>
                            </div>
                            <div class="thumbnail">
                                <img class="thumbnail_img" src="../../resources/img/듄2.jpeg" alt="">
                                <div class="thumbnail_title">
                                    <span>영화제목</span><br>
                                    <span>영화별점</span><br>
                                    <span>개봉연도, 국가</span>
                                </div>
                            </div>
                            <div class="thumbnail">
                                <img class="thumbnail_img" src="../../resources/img/듄2.jpeg" alt="">
                                <div class="thumbnail_title">
                                    <span>영화제목</span><br>
                                    <span>영화별점</span><br>
                                    <span>개봉연도, 국가</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="diff_eval">
                        <div class="diff_eval_title">
                            <h4>평가가 엇갈린 작품</h4>
                        </div>
                        <div class="diff_eval_info">
                            <div class="diff_eval_movie">
                                <div class="diff_thumbnail">
                                    <img class="diff_thumbnail_img" src="../../resources/img/듄2.jpeg" alt="">
                                    <div class="diff_thumbnail_title">
                                        <div>
                                            <span>영화제목</span>
                                        </div>
                                        <div>
                                            <span>영화별점</span>
                                        </div>
                                        <div>
                                            <span>개봉연도, 국가</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="diff_eval_user">
                                <div class="user_info_other">
                                    <div class="user_info_icon">
                                        <div class="user_icon_wrap">
                                            <i class="fa-solid fa-user fa-3x" style="color: #F72798;"></i>
                                        </div>
                                    </div>
                                    <div class="user_info_nickname">
                                        <div class="user_info_nickname_info">
                                            <span>LV. 사용자 등급</span>
                                            <span> 사용자 닉네임</span>
                                        </div>
                                        <div class="user_info_starRating">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/빈별.png" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="user_info_me">
                                    <div class="user_info_icon">
                                        <div class="user_icon_wrap">
                                            <i class="fa-solid fa-user fa-3x" style="color: #F72798;"></i>
                                        </div>
                                    </div>
                                    <div class="user_info_nickname">
                                        <div class="user_info_nickname_info">
                                            <span>LV. 사용자 등급</span>
                                            <span> 사용자 닉네임</span>
                                        </div>
                                        <div class="user_info_starRating">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/빈별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/빈별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/빈별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/빈별.png" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="taste_analysis">
                        <div class="taste_analysis_title">
                            <h4>취향 분석</h4>
                        </div>
                        <div class="taste_analysis_info">
                            <span>
                                취향이 한결같은 '소나무파'
                            </span>
                        </div>
                        <div class="taste_analysis_graph">
                            <canvas id="starRating_chart" style="height: 200px;"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 내용 끝 -->

		<%@ include file="/views/common/footer.jsp" %>
    <!-- 추가 -->
    <script src="../../resources/assets/js/like&dislike.js"></script>
    <script src="../../resources/assets/js/starRating_forReviewTap.js"></script>

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

    <!-- chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
    <script>
        const chart = document.querySelector("#starRating_chart").getContext('2d');
        const myChart = new Chart(chart, {
            type: 'bar',
            data: {
                labels: ['0.5', '1', '1.5', '2', '2.5', '3', '3.5', '4', '4.5', '5'], // x축에 나올 값
                datasets: [{
                    label: '# of starRatings',
                    data: [0, 5, 8, 6, 7, 9, 18, 19, 20, 41], // x축 각각에 해당하는 값
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.8)',
                        'rgba(54, 162, 235, 0.8)',
                        'rgba(255, 206, 86, 0.8)',
                        'rgba(75, 192, 192, 0.8)',
                        'rgba(153, 102, 255, 0.8)',
                        'rgba(255, 159, 64, 0.8)'
                    ],
                    borderColor: [
                        'rgb(255, 99, 132)',
                        'rgb(54, 162, 235)',
                        'rgb(255, 206, 86)',
                        'rgb(75, 192, 192)',
                        'rgb(153, 102, 255)',
                        'rgb(255, 159, 64)'
                    ],
                }]
            },
            options: {
                plugins: {
                    legend: {
                        labels: {
                            font: {
                                size: 20,
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        })
    </script>


    <!-- 추가 끝 -->

</body>

</html>