<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        }

        .review_content_long {
            width: 100%;
            height: 110%;
            position: absolute;
            padding-left: 10px;
            top: 142px;
            font-size: 15px;
            background-color: rgb(20, 20, 20);
            border-radius: 15px;
            z-index: 20;
            display: none;
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
                    <div class="movie_review_el">
                        <div class="movie_review_part">
                            <div class="thumb_btn">
                                <div class="thumb_up">
                                    <div class="ag_disag_wrap">
                                        <div class="ag">
                                            <div class="ag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn ag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/좋아요.png" alt=""></button>
                                            </div>
                                            <div class="ag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn ag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈좋아요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">공감 수</span>
                                </div>
                                <div class="thumb_down">
                                    <div class="ag_disag_wrap">
                                        <div class="disag">
                                            <div class="disag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn disag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/싫어요.png" alt=""></button>
                                            </div>
                                            <div class="disag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn disag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈싫어요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">비공감 수</span>
                                </div>
                            </div>
                            <div class="user_img_info">
                                <div class="user_img"><i class="fa-solid fa-user" style="color: #F72798;;"></i>
                                </div>
                                <div class="user_info">
                                    <span>LV. 사용자 등급</span>
                                    <span style="margin-left: 10px;"> 사용자 닉네임</span>
                                </div>
                            </div>
                            <div class="user_review_info">
                                <div class="user_review_star">
                                    <div class="star-wrap">
                                        <div class="rating_small">
                                            <label class="rating__label_small rating__label--half" for="starhalf">
                                                <input type="radio" id="starhalf" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star1">
                                                <input type="radio" id="star1" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star1half">
                                                <input type="radio" id="star1half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star2">
                                                <input type="radio" id="star2" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star2half">
                                                <input type="radio" id="star2half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star3">
                                                <input type="radio" id="star3" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star3half">
                                                <input type="radio" id="star3half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star4">
                                                <input type="radio" id="star4" class="rating__input_small" name="rating"
                                                    checked value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__labe_smalll rating__label--half" for="star4half">
                                                <input type="radio" id="star4half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star5">
                                                <input type="radio" id="star5" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="user_review_date">
                                    <span>2024-03-15</span>
                                </div>
                            </div>
                            <div class="review_content">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                <div class="more_info">
                                    <a class="more_info_btn">더보기</a>
                                </div>
                            </div>
                            <div class="review_content_long">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi alias temporibus sequi similique, obcaecati inventore est cum perspiciatis
                                nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                alidasfasdfsdafsdafsadasds
                                <div class="more_info_long">
                                    <a class="more_info_btn_long">접기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="movie_review_el">
                        <div class="movie_review_part">
                            <div class="thumb_btn">
                                <div class="thumb_up">
                                    <div class="ag_disag_wrap">
                                        <div class="ag">
                                            <div class="ag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn ag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/좋아요.png" alt=""></button>
                                            </div>
                                            <div class="ag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn ag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈좋아요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">공감 수</span>
                                </div>
                                <div class="thumb_down">
                                    <div class="ag_disag_wrap">
                                        <div class="disag">
                                            <div class="disag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn disag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/싫어요.png" alt=""></button>
                                            </div>
                                            <div class="disag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn disag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈싫어요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">비공감 수</span>
                                </div>
                            </div>
                            <div class="user_img_info">
                                <div class="user_img"><i class="fa-solid fa-user" style="color: #F72798;;"></i>
                                </div>
                                <div class="user_info">
                                    <span>LV. 사용자 등급</span>
                                    <span style="margin-left: 10px;"> 사용자 닉네임</span>
                                </div>
                            </div>
                            <div class="user_review_info">
                                <div class="user_review_star">
                                    <div class="star-wrap">
                                        <div class="rating_small readonly" readonly>
                                            <label class="rating__label_small rating__label--half" for="starhalf_1">
                                                <input type="radio" id="starhalf_1" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star1_1">
                                                <input type="radio" id="star1_1" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star1half_1">
                                                <input type="radio" id="star1half_1" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star2_1">
                                                <input type="radio" id="star2_1" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star2half_1">
                                                <input type="radio" id="star2half_1" class="rating__input_small"
                                                    name="rating" value="" disabled checked>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star3_1">
                                                <input type="radio" id="star3_1" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star3half_1">
                                                <input type="radio" id="star3half_1" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star4_1">
                                                <input type="radio" id="star4_1" class="rating__input_small" name="rating"
                                                    checked value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__labe_smalll rating__label--half" for="star4half_1">
                                                <input type="radio" id="star4half_1" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star5_1">
                                                <input type="radio" id="star5_1" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="user_review_date">
                                    <span>2024-03-15</span>
                                </div>
                            </div>
                            <div class="review_content">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                <div class="more_info">
                                    <a class="more_info_btn">더보기</a>
                                </div>
                            </div>
                            <div class="review_content_long">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi alias temporibus sequi similique, obcaecati inventore est cum perspiciatis
                                nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                alidasfasdfsdafsdafsadasds
                                <div class="more_info_long">
                                    <a class="more_info_btn_long">접기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="movie_review_el">
                        <div class="movie_review_part">
                            <div class="thumb_btn">
                                <div class="thumb_up">
                                    <div class="ag_disag_wrap">
                                        <div class="ag">
                                            <div class="ag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn ag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/좋아요.png" alt=""></button>
                                            </div>
                                            <div class="ag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn ag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈좋아요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">공감 수</span>
                                </div>
                                <div class="thumb_down">
                                    <div class="ag_disag_wrap">
                                        <div class="disag">
                                            <div class="disag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn disag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/싫어요.png" alt=""></button>
                                            </div>
                                            <div class="disag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn disag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈싫어요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">비공감 수</span>
                                </div>
                            </div>
                            <div class="user_img_info">
                                <div class="user_img"><i class="fa-solid fa-user" style="color: #F72798;;"></i>
                                </div>
                                <div class="user_info">
                                    <span>LV. 사용자 등급</span>
                                    <span style="margin-left: 10px;"> 사용자 닉네임</span>
                                </div>
                            </div>
                            <div class="user_review_info">
                                <div class="user_review_star">
                                    <div class="star-wrap">
                                        <div class="rating_small">
                                            <label class="rating__label_small rating__label--half" for="starhalf">
                                                <input type="radio" id="starhalf" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star1">
                                                <input type="radio" id="star1" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star1half">
                                                <input type="radio" id="star1half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star2">
                                                <input type="radio" id="star2" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star2half">
                                                <input type="radio" id="star2half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star3">
                                                <input type="radio" id="star3" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star3half">
                                                <input type="radio" id="star3half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star4">
                                                <input type="radio" id="star4" class="rating__input_small" name="rating"
                                                    checked value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__labe_smalll rating__label--half" for="star4half">
                                                <input type="radio" id="star4half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star5">
                                                <input type="radio" id="star5" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="user_review_date">
                                    <span>2024-03-15</span>
                                </div>
                            </div>
                            <div class="review_content">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                <div class="more_info">
                                    <a class="more_info_btn">더보기</a>
                                </div>
                            </div>
                            <div class="review_content_long">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi alias temporibus sequi similique, obcaecati inventore est cum perspiciatis
                                nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                alidasfasdfsdafsdafsadasds
                                <div class="more_info_long">
                                    <a class="more_info_btn_long">접기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="movie_review_el">
                        <div class="movie_review_part">
                            <div class="thumb_btn">
                                <div class="thumb_up">
                                    <div class="ag_disag_wrap">
                                        <div class="ag">
                                            <div class="ag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn ag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/좋아요.png" alt=""></button>
                                            </div>
                                            <div class="ag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn ag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈좋아요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">공감 수</span>
                                </div>
                                <div class="thumb_down">
                                    <div class="ag_disag_wrap">
                                        <div class="disag">
                                            <div class="disag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn disag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/싫어요.png" alt=""></button>
                                            </div>
                                            <div class="disag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn disag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈싫어요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">비공감 수</span>
                                </div>
                            </div>
                            <div class="user_img_info">
                                <div class="user_img"><i class="fa-solid fa-user" style="color: #F72798;;"></i>
                                </div>
                                <div class="user_info">
                                    <span>LV. 사용자 등급</span>
                                    <span style="margin-left: 10px;"> 사용자 닉네임</span>
                                </div>
                            </div>
                            <div class="user_review_info">
                                <div class="user_review_star">
                                    <div class="star-wrap">
                                        <div class="rating_small">
                                            <label class="rating__label_small rating__label--half" for="starhalf_2">
                                                <input type="radio" id="starhalf_2" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star1_2">
                                                <input type="radio" id="star1_2" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star1half_2">
                                                <input type="radio" id="star1half_2" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star2_2">
                                                <input type="radio" id="star2_2" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star2half_2">
                                                <input type="radio" id="star2half_2" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star3_2">
                                                <input type="radio" id="star3_2" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star3half_2">
                                                <input type="radio" id="star3half_2" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star4_2">
                                                <input type="radio" id="star4_2" class="rating__input_small" name="rating"
                                                    checked value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__labe_smalll rating__label--half" for="star4half_2">
                                                <input type="radio" id="star4half_2" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star5_2">
                                                <input type="radio" id="star5_2" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="user_review_date">
                                    <span>2024-03-15</span>
                                </div>
                            </div>
                            <div class="review_content">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                <div class="more_info">
                                    <a class="more_info_btn">더보기</a>
                                </div>
                            </div>
                            <div class="review_content_long">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi alias temporibus sequi similique, obcaecati inventore est cum perspiciatis
                                nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                alidasfasdfsdafsdafsadasds
                                <div class="more_info_long">
                                    <a class="more_info_btn_long">접기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="movie_review_el">
                        <div class="movie_review_part">
                            <div class="thumb_btn">
                                <div class="thumb_up">
                                    <div class="ag_disag_wrap">
                                        <div class="ag">
                                            <div class="ag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn ag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/좋아요.png" alt=""></button>
                                            </div>
                                            <div class="ag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn ag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈좋아요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">공감 수</span>
                                </div>
                                <div class="thumb_down">
                                    <div class="ag_disag_wrap">
                                        <div class="disag">
                                            <div class="disag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn disag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/싫어요.png" alt=""></button>
                                            </div>
                                            <div class="disag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn disag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈싫어요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">비공감 수</span>
                                </div>
                            </div>
                            <div class="user_img_info">
                                <div class="user_img"><i class="fa-solid fa-user" style="color: #F72798;;"></i>
                                </div>
                                <div class="user_info">
                                    <span>LV. 사용자 등급</span>
                                    <span style="margin-left: 10px;"> 사용자 닉네임</span>
                                </div>
                            </div>
                            <div class="user_review_info">
                                <div class="user_review_star">
                                    <div class="star-wrap">
                                        <div class="rating_small">
                                            <label class="rating__label_small rating__label--half" for="starhalf">
                                                <input type="radio" id="starhalf" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star1">
                                                <input type="radio" id="star1" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star1half">
                                                <input type="radio" id="star1half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star2">
                                                <input type="radio" id="star2" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star2half">
                                                <input type="radio" id="star2half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star3">
                                                <input type="radio" id="star3" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star3half">
                                                <input type="radio" id="star3half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star4">
                                                <input type="radio" id="star4" class="rating__input_small" name="rating"
                                                    checked value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__labe_smalll rating__label--half" for="star4half">
                                                <input type="radio" id="star4half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star5">
                                                <input type="radio" id="star5" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="user_review_date">
                                    <span>2024-03-15</span>
                                </div>
                            </div>
                            <div class="review_content">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                <div class="more_info">
                                    <a class="more_info_btn">더보기</a>
                                </div>
                            </div>
                            <div class="review_content_long">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi alias temporibus sequi similique, obcaecati inventore est cum perspiciatis
                                nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                alidasfasdfsdafsdafsadasds
                                <div class="more_info_long">
                                    <a class="more_info_btn_long">접기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="movie_review_el">
                        <div class="movie_review_part">
                            <div class="thumb_btn">
                                <div class="thumb_up">
                                    <div class="ag_disag_wrap">
                                        <div class="ag">
                                            <div class="ag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn ag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/좋아요.png" alt=""></button>
                                            </div>
                                            <div class="ag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn ag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈좋아요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">공감 수</span>
                                </div>
                                <div class="thumb_down">
                                    <div class="ag_disag_wrap">
                                        <div class="disag">
                                            <div class="disag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn disag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/싫어요.png" alt=""></button>
                                            </div>
                                            <div class="disag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn disag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈싫어요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">비공감 수</span>
                                </div>
                            </div>
                            <div class="user_img_info">
                                <div class="user_img"><i class="fa-solid fa-user" style="color: #F72798;;"></i>
                                </div>
                                <div class="user_info">
                                    <span>LV. 사용자 등급</span>
                                    <span style="margin-left: 10px;"> 사용자 닉네임</span>
                                </div>
                            </div>
                            <div class="user_review_info">
                                <div class="user_review_star">
                                    <div class="star-wrap">
                                        <div class="rating_small readonly" readonly>
                                            <label class="rating__label_small rating__label--half" for="starhalf_3">
                                                <input type="radio" id="starhalf_3" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star1_3">
                                                <input type="radio" id="star_31" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star1half_3">
                                                <input type="radio" id="star1half_3" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star2_3">
                                                <input type="radio" id="star2_3" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star2half_3">
                                                <input type="radio" id="star2half_3" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star3_3">
                                                <input type="radio" id="star3_3" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star3half_3">
                                                <input type="radio" id="star3half_3" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star4_3">
                                                <input type="radio" id="star4_3" class="rating__input_small" name="rating"
                                                    checked value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__labe_smalll rating__label--half" for="star4half_3">
                                                <input type="radio" id="star4half_3" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star5_3">
                                                <input type="radio" id="star5_3" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="user_review_date">
                                    <span>2024-03-15</span>
                                </div>
                            </div>
                            <div class="review_content">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                <div class="more_info">
                                    <a class="more_info_btn">더보기</a>
                                </div>
                            </div>
                            <div class="review_content_long">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi alias temporibus sequi similique, obcaecati inventore est cum perspiciatis
                                nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                alidasfasdfsdafsdafsadasds
                                <div class="more_info_long">
                                    <a class="more_info_btn_long">접기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="movie_review_el">
                        <div class="movie_review_part">
                            <div class="thumb_btn">
                                <div class="thumb_up">
                                    <div class="ag_disag_wrap">
                                        <div class="ag">
                                            <div class="ag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn ag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/좋아요.png" alt=""></button>
                                            </div>
                                            <div class="ag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn ag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈좋아요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">공감 수</span>
                                </div>
                                <div class="thumb_down">
                                    <div class="ag_disag_wrap">
                                        <div class="disag">
                                            <div class="disag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn disag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/싫어요.png" alt=""></button>
                                            </div>
                                            <div class="disag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn disag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈싫어요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">비공감 수</span>
                                </div>
                            </div>
                            <div class="user_img_info">
                                <div class="user_img"><i class="fa-solid fa-user" style="color: #F72798;;"></i>
                                </div>
                                <div class="user_info">
                                    <span>LV. 사용자 등급</span>
                                    <span style="margin-left: 10px;"> 사용자 닉네임</span>
                                </div>
                            </div>
                            <div class="user_review_info">
                                <div class="user_review_star">
                                    <div class="star-wrap">
                                        <div class="rating_small">
                                            <label class="rating__label_small rating__label--half" for="starhalf">
                                                <input type="radio" id="starhalf" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star1">
                                                <input type="radio" id="star1" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star1half">
                                                <input type="radio" id="star1half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star2">
                                                <input type="radio" id="star2" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star2half">
                                                <input type="radio" id="star2half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star3">
                                                <input type="radio" id="star3" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star3half">
                                                <input type="radio" id="star3half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star4">
                                                <input type="radio" id="star4" class="rating__input_small" name="rating"
                                                    checked value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__labe_smalll rating__label--half" for="star4half">
                                                <input type="radio" id="star4half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star5">
                                                <input type="radio" id="star5" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="user_review_date">
                                    <span>2024-03-15</span>
                                </div>
                            </div>
                            <div class="review_content">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                <div class="more_info">
                                    <a class="more_info_btn">더보기</a>
                                </div>
                            </div>
                            <div class="review_content_long">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi alias temporibus sequi similique, obcaecati inventore est cum perspiciatis
                                nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                alidasfasdfsdafsdafsadasds
                                <div class="more_info_long">
                                    <a class="more_info_btn_long">접기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="movie_review_el">
                        <div class="movie_review_part">
                            <div class="thumb_btn">
                                <div class="thumb_up">
                                    <div class="ag_disag_wrap">
                                        <div class="ag">
                                            <div class="ag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn ag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/좋아요.png" alt=""></button>
                                            </div>
                                            <div class="ag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn ag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈좋아요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">공감 수</span>
                                </div>
                                <div class="thumb_down">
                                    <div class="ag_disag_wrap">
                                        <div class="disag">
                                            <div class="disag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn disag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/싫어요.png" alt=""></button>
                                            </div>
                                            <div class="disag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn disag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈싫어요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">비공감 수</span>
                                </div>
                            </div>
                            <div class="user_img_info">
                                <div class="user_img"><i class="fa-solid fa-user" style="color: #F72798;;"></i>
                                </div>
                                <div class="user_info">
                                    <span>LV. 사용자 등급</span>
                                    <span style="margin-left: 10px;"> 사용자 닉네임</span>
                                </div>
                            </div>
                            <div class="user_review_info">
                                <div class="user_review_star">
                                    <div class="star-wrap">
                                        <div class="rating_small">
                                            <label class="rating__label_small rating__label--half" for="starhalf">
                                                <input type="radio" id="starhalf" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star1">
                                                <input type="radio" id="star1" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star1half">
                                                <input type="radio" id="star1half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star2">
                                                <input type="radio" id="star2" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star2half">
                                                <input type="radio" id="star2half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star3">
                                                <input type="radio" id="star3" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star3half">
                                                <input type="radio" id="star3half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star4">
                                                <input type="radio" id="star4" class="rating__input_small" name="rating"
                                                    checked value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__labe_smalll rating__label--half" for="star4half">
                                                <input type="radio" id="star4half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star5">
                                                <input type="radio" id="star5" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="user_review_date">
                                    <span>2024-03-15</span>
                                </div>
                            </div>
                            <div class="review_content">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                <div class="more_info">
                                    <a class="more_info_btn">더보기</a>
                                </div>
                            </div>
                            <div class="review_content_long">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi alias temporibus sequi similique, obcaecati inventore est cum perspiciatis
                                nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                alidasfasdfsdafsdafsadasds
                                <div class="more_info_long">
                                    <a class="more_info_btn_long">접기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="movie_review_el">
                        <div class="movie_review_part">
                            <div class="thumb_btn">
                                <div class="thumb_up">
                                    <div class="ag_disag_wrap">
                                        <div class="ag">
                                            <div class="ag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn ag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/좋아요.png" alt=""></button>
                                            </div>
                                            <div class="ag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn ag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈좋아요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">공감 수</span>
                                </div>
                                <div class="thumb_down">
                                    <div class="ag_disag_wrap">
                                        <div class="disag">
                                            <div class="disag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn disag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/싫어요.png" alt=""></button>
                                            </div>
                                            <div class="disag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn disag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈싫어요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">비공감 수</span>
                                </div>
                            </div>
                            <div class="user_img_info">
                                <div class="user_img"><i class="fa-solid fa-user" style="color: #F72798;;"></i>
                                </div>
                                <div class="user_info">
                                    <span>LV. 사용자 등급</span>
                                    <span style="margin-left: 10px;"> 사용자 닉네임</span>
                                </div>
                            </div>
                            <div class="user_review_info">
                                <div class="user_review_star">
                                    <div class="star-wrap">
                                        <div class="rating_small">
                                            <label class="rating__label_small rating__label--half" for="starhalf">
                                                <input type="radio" id="starhalf" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star1">
                                                <input type="radio" id="star1" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star1half">
                                                <input type="radio" id="star1half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star2">
                                                <input type="radio" id="star2" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star2half">
                                                <input type="radio" id="star2half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star3">
                                                <input type="radio" id="star3" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star3half">
                                                <input type="radio" id="star3half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star4">
                                                <input type="radio" id="star4" class="rating__input_small" name="rating"
                                                    checked value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__labe_smalll rating__label--half" for="star4half">
                                                <input type="radio" id="star4half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star5">
                                                <input type="radio" id="star5" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="user_review_date">
                                    <span>2024-03-15</span>
                                </div>
                            </div>
                            <div class="review_content">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                <div class="more_info">
                                    <a class="more_info_btn">더보기</a>
                                </div>
                            </div>
                            <div class="review_content_long">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi alias temporibus sequi similique, obcaecati inventore est cum perspiciatis
                                nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                alidasfasdfsdafsdafsadasds
                                <div class="more_info_long">
                                    <a class="more_info_btn_long">접기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="movie_review_el">
                        <div class="movie_review_part">
                            <div class="thumb_btn">
                                <div class="thumb_up">
                                    <div class="ag_disag_wrap">
                                        <div class="ag">
                                            <div class="ag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn ag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/좋아요.png" alt=""></button>
                                            </div>
                                            <div class="ag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn ag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈좋아요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">공감 수</span>
                                </div>
                                <div class="thumb_down">
                                    <div class="ag_disag_wrap">
                                        <div class="disag">
                                            <div class="disag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn disag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/싫어요.png" alt=""></button>
                                            </div>
                                            <div class="disag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn disag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈싫어요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">비공감 수</span>
                                </div>
                            </div>
                            <div class="user_img_info">
                                <div class="user_img"><i class="fa-solid fa-user" style="color: #F72798;;"></i>
                                </div>
                                <div class="user_info">
                                    <span>LV. 사용자 등급</span>
                                    <span style="margin-left: 10px;"> 사용자 닉네임</span>
                                </div>
                            </div>
                            <div class="user_review_info">
                                <div class="user_review_star">
                                    <div class="star-wrap">
                                        <div class="rating_small">
                                            <label class="rating__label_small rating__label--half" for="starhalf">
                                                <input type="radio" id="starhalf" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star1">
                                                <input type="radio" id="star1" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star1half">
                                                <input type="radio" id="star1half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star2">
                                                <input type="radio" id="star2" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star2half">
                                                <input type="radio" id="star2half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star3">
                                                <input type="radio" id="star3" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star3half">
                                                <input type="radio" id="star3half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star4">
                                                <input type="radio" id="star4" class="rating__input_small" name="rating"
                                                    checked value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__labe_smalll rating__label--half" for="star4half">
                                                <input type="radio" id="star4half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star5">
                                                <input type="radio" id="star5" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="user_review_date">
                                    <span>2024-03-15</span>
                                </div>
                            </div>
                            <div class="review_content">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                <div class="more_info">
                                    <a class="more_info_btn">더보기</a>
                                </div>
                            </div>
                            <div class="review_content_long">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi alias temporibus sequi similique, obcaecati inventore est cum perspiciatis
                                nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                alidasfasdfsdafsdafsadasds
                                <div class="more_info_long">
                                    <a class="more_info_btn_long">접기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="movie_review_el">
                        <div class="movie_review_part">
                            <div class="thumb_btn">
                                <div class="thumb_up">
                                    <div class="ag_disag_wrap">
                                        <div class="ag">
                                            <div class="ag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn ag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/좋아요.png" alt=""></button>
                                            </div>
                                            <div class="ag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn ag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈좋아요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">공감 수</span>
                                </div>
                                <div class="thumb_down">
                                    <div class="ag_disag_wrap">
                                        <div class="disag">
                                            <div class="disag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn disag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/싫어요.png" alt=""></button>
                                            </div>
                                            <div class="disag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn disag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈싫어요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">비공감 수</span>
                                </div>
                            </div>
                            <div class="user_img_info">
                                <div class="user_img"><i class="fa-solid fa-user" style="color: #F72798;;"></i>
                                </div>
                                <div class="user_info">
                                    <span>LV. 사용자 등급</span>
                                    <span style="margin-left: 10px;"> 사용자 닉네임</span>
                                </div>
                            </div>
                            <div class="user_review_info">
                                <div class="user_review_star">
                                    <div class="star-wrap">
                                        <div class="rating_small">
                                            <label class="rating__label_small rating__label--half" for="starhalf">
                                                <input type="radio" id="starhalf" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star1">
                                                <input type="radio" id="star1" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star1half">
                                                <input type="radio" id="star1half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star2">
                                                <input type="radio" id="star2" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star2half">
                                                <input type="radio" id="star2half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star3">
                                                <input type="radio" id="star3" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star3half">
                                                <input type="radio" id="star3half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star4">
                                                <input type="radio" id="star4" class="rating__input_small" name="rating"
                                                    checked value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__labe_smalll rating__label--half" for="star4half">
                                                <input type="radio" id="star4half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star5">
                                                <input type="radio" id="star5" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="user_review_date">
                                    <span>2024-03-15</span>
                                </div>
                            </div>
                            <div class="review_content">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                <div class="more_info">
                                    <a class="more_info_btn">더보기</a>
                                </div>
                            </div>
                            <div class="review_content_long">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi alias temporibus sequi similique, obcaecati inventore est cum perspiciatis
                                nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                alidasfasdfsdafsdafsadasds
                                <div class="more_info_long">
                                    <a class="more_info_btn_long">접기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="movie_review_el">
                        <div class="movie_review_part">
                            <div class="thumb_btn">
                                <div class="thumb_up">
                                    <div class="ag_disag_wrap">
                                        <div class="ag">
                                            <div class="ag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn ag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/좋아요.png" alt=""></button>
                                            </div>
                                            <div class="ag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn ag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈좋아요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">공감 수</span>
                                </div>
                                <div class="thumb_down">
                                    <div class="ag_disag_wrap">
                                        <div class="disag">
                                            <div class="disag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn disag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/싫어요.png" alt=""></button>
                                            </div>
                                            <div class="disag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn disag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈싫어요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">비공감 수</span>
                                </div>
                            </div>
                            <div class="user_img_info">
                                <div class="user_img"><i class="fa-solid fa-user" style="color: #F72798;;"></i>
                                </div>
                                <div class="user_info">
                                    <span>LV. 사용자 등급</span>
                                    <span style="margin-left: 10px;"> 사용자 닉네임</span>
                                </div>
                            </div>
                            <div class="user_review_info">
                                <div class="user_review_star">
                                    <div class="star-wrap">
                                        <div class="rating_small">
                                            <label class="rating__label_small rating__label--half" for="starhalf">
                                                <input type="radio" id="starhalf" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star1">
                                                <input type="radio" id="star1" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star1half">
                                                <input type="radio" id="star1half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star2">
                                                <input type="radio" id="star2" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star2half">
                                                <input type="radio" id="star2half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star3">
                                                <input type="radio" id="star3" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star3half">
                                                <input type="radio" id="star3half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star4">
                                                <input type="radio" id="star4" class="rating__input_small" name="rating"
                                                    checked value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__labe_smalll rating__label--half" for="star4half">
                                                <input type="radio" id="star4half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star5">
                                                <input type="radio" id="star5" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="user_review_date">
                                    <span>2024-03-15</span>
                                </div>
                            </div>
                            <div class="review_content">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                <div class="more_info">
                                    <a class="more_info_btn">더보기</a>
                                </div>
                            </div>
                            <div class="review_content_long">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi alias temporibus sequi similique, obcaecati inventore est cum perspiciatis
                                nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                alidasfasdfsdafsdafsadasds
                                <div class="more_info_long">
                                    <a class="more_info_btn_long">접기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="movie_review_el">
                        <div class="movie_review_part">
                            <div class="thumb_btn">
                                <div class="thumb_up">
                                    <div class="ag_disag_wrap">
                                        <div class="ag">
                                            <div class="ag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn ag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/좋아요.png" alt=""></button>
                                            </div>
                                            <div class="ag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn ag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈좋아요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">공감 수</span>
                                </div>
                                <div class="thumb_down">
                                    <div class="ag_disag_wrap">
                                        <div class="disag">
                                            <div class="disag_filled filled_wrap">
                                                <button type="button" class="ag_disag_btn disag_filled_btn"><img
                                                        class="ag_filled_img ag_disag_img"
                                                        src="../../resources/img/싫어요.png" alt=""></button>
                                            </div>
                                            <div class="disag_empty empty_wrap">
                                                <button type="button" class="ag_disag_btn disag_empty_btn"><img
                                                        class="ag_empty_img ag_disag_img"
                                                        src="../../resources/img/빈싫어요.png" alt=""></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_count">
                                    <span style="font-size: 8px; padding-left: 0px;">비공감 수</span>
                                </div>
                            </div>
                            <div class="user_img_info">
                                <div class="user_img"><i class="fa-solid fa-user" style="color: #F72798;;"></i>
                                </div>
                                <div class="user_info">
                                    <span>LV. 사용자 등급</span>
                                    <span style="margin-left: 10px;"> 사용자 닉네임</span>
                                </div>
                            </div>
                            <div class="user_review_info">
                                <div class="user_review_star">
                                    <div class="star-wrap">
                                        <div class="rating_small">
                                            <label class="rating__label_small rating__label--half" for="starhalf">
                                                <input type="radio" id="starhalf" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star1">
                                                <input type="radio" id="star1" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star1half">
                                                <input type="radio" id="star1half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star2">
                                                <input type="radio" id="star2" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star2half">
                                                <input type="radio" id="star2half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star3">
                                                <input type="radio" id="star3" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--half" for="star3half">
                                                <input type="radio" id="star3half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star4">
                                                <input type="radio" id="star4" class="rating__input_small" name="rating"
                                                    checked value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__labe_smalll rating__label--half" for="star4half">
                                                <input type="radio" id="star4half" class="rating__input_small"
                                                    name="rating" value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                            <label class="rating__label_small rating__label--full" for="star5">
                                                <input type="radio" id="star5" class="rating__input_small" name="rating"
                                                    value="" disabled>
                                                <span class="star-icon_small"></span>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="user_review_date">
                                    <span>2024-03-15</span>
                                </div>
                            </div>
                            <div class="review_content">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                <div class="more_info">
                                    <a class="more_info_btn">더보기</a>
                                </div>
                            </div>
                            <div class="review_content_long">
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi alias temporibus sequi similique, obcaecati inventore est cum perspiciatis
                                nesciunt
                                aliquam nobis illum dolorem molestiae incidunt cumque blanditiis!
                                aliquam nobis illum dolorem molestiae incidunt cumque blandit
                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Adipisci, iure quos.
                                Excepturi
                                alias temporibus sequi similique, obcaecati inventore est cum perspiciatis nesciunt
                                alidasfasdfsdafsdafsadasds
                                <div class="more_info_long">
                                    <a class="more_info_btn_long">접기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
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