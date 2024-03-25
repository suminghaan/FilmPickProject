<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.fp.movie.model.vo.Review" %>
    <%
    	ArrayList<Review> reviewList = ((ArrayList<Review>)request.getAttribute("reviewList"));
    %>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
    <title>FILM PICK</title>

    <style>

        /* 추가 내용 */

        .content {
            display: flex;
            flex-direction: column;
        }

        .review_title {
            padding-left: 50px;
            padding-top: 10px;
            height: 3%;
            border-radius: 20px;
            background-color: rgb(15, 15, 15);
        }

        .reviews_wrap {
            height: 90%;
            border-radius: 20px;
            background-color: rgb(15, 15, 15);
            display: flex;
            flex-wrap: wrap;
            align-content: space-around;
            justify-content: space-around;
        }

        .movie_review_el {
            height: 380px;
            width: 20%;
            position: relative;
            background-color: rgb(20, 20, 20);
            border-radius: 15px;
            margin: 30px
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
    		top: 132px;
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
            width: 15%;
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
        
       .starRating_img {
            height: 25px;
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


        <!-- 내용 시작 -->
        <div class="content_wrap" style="background-color: black;">
            <div class="content">
                <div class="review_title">
                    <h5><span>검색결과</span> 리뷰</h5>
                </div>
                <div class="reviews_wrap">
                <% if(reviewList != null) { %>
                    	<% for(int i = 0; i < reviewList.size(); i++) { %>
                    	<!-- reviewContent가 있는 리뷰만 조회 -->
                    	<% if(reviewList.get(i).getReviewContent() != null) {%>
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
                                        <span style="font-size: 8px; padding-left: 0px;">공감 수 : <%= reviewList.get(i).getAgreeCount() %></span>
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
                                        <span style="font-size: 8px; padding-left: 0px;">비공감 수 : <%= reviewList.get(i).getDisagreeCount() %></span>
                                    </div>
                                </div>
                                <div class="user_img_info">
                                <% if(reviewList.get(i).getMemImgPath() == null) { %>
                                    <div class="user_img" style="border: 2px solid <%= reviewList.get(i).getMemColor() %>"><i class="fa-solid fa-user" style="color: <%= reviewList.get(i).getMemColor() %>;"></i>
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
                        <% } %>
                        <% } %> 
                    <% } %>                  
                </div>
            </div>
        </div>
        <!-- 내용 끝 -->


        <%@ include file="/views/common/footer.jsp" %>


    </main>
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
    <!-- 추가 끝 -->

</body>

</html>