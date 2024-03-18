<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            height: 3%;
            margin-top: 1%;
            font-size: 13px;
            padding-left: 60px;
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
            height: 24%;
            background-color: rgb(20, 20, 20);
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
        }

        /* =============영화 포스터, 예고편 스타일================ */

        .movie_mainPoster {
            width: 35%;
            padding: 0px 50px;
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
            height: 100%;
        }

        .mainPreview {
            width: 90%;
        }

        .poster_info {
            margin-top: 20px;
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
            /* width: 90%; */
        }

        /* ==================영화 리뷰=================== */

        .movie_like {
            width: 30%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }

        .movie_btn_wrap {
            height: 10%;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
        }

        .like_review_btn_wrap {
            height: 50%;
            margin-bottom: 20%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .like_review_btn {
            height: 50%;
            width: 100%;
            display: flex;
            flex: row;
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
            height: 50%;
        }

        /* ==================출연/제작 스타일=================== */

        .movie_people {
            width: 60%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }

        .movie_summary {
            height: 25%;
            background-color: rgb(15, 15, 15);
            border-radius: 10px;
            margin: 20px;
            padding: 20px;
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
            font-size: 10px;
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
            font-size: 10px;
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
            display: flex;
            padding-bottom: 10px;
            justify-content: center;
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
    </style>

    <!-- starRating css -->
    <link rel="stylesheet" href="../../resources/css/starRating.css">
    <link rel="stylesheet" href="../../resources/css/heart_movieDetail.css">
    <link rel="stylesheet" href="../../resources/css/starRating_forReviewTap.css">
    <link rel="stylesheet" href="../../resources/css/like&dislike_movieDetail.css">
</head>

<body>
    <%@ include file="/views/common/header.jsp" %>

        <div class="content_wrap" style="background-color: black; height: 2500px;">
            <div class="content">
                <div class="search_info">
                    <span>"다크나이트"</span> 검색 결과
                </div>
                <div class="movie_info">
                    <span>영화제목</span><br>
                    <span>개봉연도</span><span>장르</span><span>국가</span><br>
                    <span>영화 러닝타임</span><br>
                </div>
                <div class="movie_poster_preview">
                    <div class="movie_mainPoster">
                        <div id="carouselPoster" class="carousel slide">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="mainPoster" src="../../resources/img/다크나이트.webp" alt="">
                                </div>
                                <div class="carousel-item">
                                    <img class="mainPoster" src="../../resources/img/다크나이트2.jpeg" alt="">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselPoster"
                                data-bs-slide="prev">
                                <span><i class="fa-solid fa-arrow-left fa-2x"
                                        style="color: RGB(247, 39, 152);"></i></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselPoster"
                                data-bs-slide="next">
                                <span><i class="fa-solid fa-arrow-right fa-2x"
                                        style="color: RGB(247, 39, 152);"></i></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                        <div class="poster_info">
                            <span>영화제목</span><br>
                            <span>영화별점</span><br>
                            <span>개봉연도, 국가</span>
                        </div>
                    </div>
                    <div class="movie_preview_etc">
                        <div class="movie_mainPreview">
                            <video class="mainPreview" autoplay muted controls loop
                                src="../../resources/video/다크나이트.mp4" type="video/mp4"></video>
                        </div>
                        <div class="movie_etc">
                            <div id="carouselEtc" class="carousel slide">
                                <div class="carousel-inner carousel-inner_etc">
                                    <div class="carousel-item active">
                                        <div class="etcList_wrap">
                                            <img class="etc_poster" src="../../resources/img/다크나이트.webp" alt="">
                                            <img class="etc_poster" src="../../resources/img/다크나이트2.jpeg" alt="">
                                            <img class="etc_poster" src="../../resources/img/다크나이트2.jpeg" alt="">
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="etcList_wrap">
                                            <img class="etc_poster" src="../../resources/img/다크나이트.webp" alt="">
                                            <img class="etc_poster" src="../../resources/img/다크나이트2.jpeg" alt="">
                                            <img class="etc_poster" src="../../resources/img/다크나이트2.jpeg" alt="">
                                        </div>
                                    </div>
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
                                <span class="star-rating_avg">영화 평균 별점</span><br>
                                <span class="star-rating_count" style="font-size: 10px; padding-left: 10px;">별점 매긴 사람
                                    수</span>
                            </div>
                            <div class="star-wrap">
                                <div class="rating">
                                    <label class="rating__label rating__label--half" for="starhalf_main">
                                        <input type="radio" id="starhalf_main" class="rating__input" name="rating"
                                            value="">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--full" for="star1_main">
                                        <input type="radio" id="star1_main" class="rating__input" name="rating"
                                            value="">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--half" for="star1half_main">
                                        <input type="radio" id="star1half_main" class="rating__input" name="rating"
                                            value="">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--full" for="star2_main">
                                        <input type="radio" id="star2_main" class="rating__input" name="rating"
                                            value="">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--half" for="star2half_main">
                                        <input type="radio" id="star2half_main" class="rating__input" name="rating"
                                            value="">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--full" for="star3_main">
                                        <input type="radio" id="star3_main" class="rating__input" name="rating"
                                            value="">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--half" for="star3half_main">
                                        <input type="radio" id="star3half_main" class="rating__input" name="rating"
                                            value="">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--full" for="star4_main">
                                        <input type="radio" id="star4_main" class="rating__input" name="rating"
                                            value="">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--half" for="star4half_main">
                                        <input type="radio" id="star4half_main" class="rating__input" name="rating"
                                            value="">
                                        <span class="star-icon"></span>
                                    </label>
                                    <label class="rating__label rating__label--full" for="star5_main">
                                        <input type="radio" id="star5_main" class="rating__input" name="rating"
                                            value="">
                                        <span class="star-icon"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="like_review_btn_wrap">
                            <div class="like_review_btn">
                                <div class="like_btn_wrap">
                                    <div class="like_btn">
                                        <label for="checkbox" style="margin-top: 20px;">
                                            <input type="checkbox" id="checkbox" hidden>
                                            <svg t="1689815540548" class="icon" viewBox="0 0 1024 1024" version="1.1"
                                                xmlns="http://www.w3.org/2000/svg" p-id="2271">
                                                <path
                                                    d="M742.4 101.12A249.6 249.6 0 0 0 512 256a249.6 249.6 0 0 0-230.72-154.88C143.68 101.12 32 238.4 32 376.32c0 301.44 416 546.56 480 546.56s480-245.12 480-546.56c0-137.92-111.68-275.2-249.6-275.2z"
                                                    fill="#231F20" p-id="2272" id="heart"></path>
                                            </svg>
                                            <span></span>
                                        </label>
                                    </div>
                                    <div style="margin-left: 10px;">
                                        좋아요
                                    </div>
                                </div>
                                <div class="review_btn_wrap">
                                    <div class="review_btn">
                                        <button type="button"><i class="fa-solid fa-pen-to-square fa-4x"
                                                style="color: #F72798;"></i></button>
                                    </div>
                                    <div style="margin-left: 30px;">
                                        리뷰
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="movie_people">
                        <div class="movie_summary" style="margin: 20px;">
                            각종 범죄가 난무하는 고담시를 지키는 배트맨, 어느 날 도시에 광기 어린 악당 조커가 등장해 사람들을 두려움에 빠뜨린다. 조커는 배트맨이 정체를 밝힐 때까지 사람들을
                            죽이겠다고
                            협박하고, 배트맨은 자신의 모든 것을 걸고 최악의 악당 조커와 맞서기 시작한다.
                        </div>
                        <div class="movie_people_info">
                            <h4>출연/제작</h4>
                            <div class="movie_people_top">
                                <div class="people_img_info_wrap">
                                    <div class="people_img_wrap">
                                        <img class="people_img" src="../../resources/img/공효진.jpeg" alt="">
                                    </div>
                                    <div class="people_info_wrap">
                                        <span>이름 : </span><br>
                                        <span>배역 : </span>
                                    </div>
                                    <div class="people_tooltip">
                                        <span>생년월일 : </span><br>
                                        <span>국적 : </span><br>
                                        <span>대표작 : (2~3개만)</span>
                                    </div>
                                </div>
                                <div class="people_img_info_wrap">
                                    <div class="people_img_wrap">
                                        <img class="people_img" src="../../resources/img/공효진.jpeg" alt="">
                                    </div>
                                    <div class="people_info_wrap">
                                        <span>이름 : </span><br>
                                        <span>배역 : </span>
                                    </div>
                                    <div class="people_tooltip">
                                        <span>생년월일 : </span><br>
                                        <span>국적 : </span><br>
                                        <span>대표작 : (2~3개만)</span>
                                    </div>
                                </div>
                                <div class="people_img_info_wrap">
                                    <div class="people_img_wrap">
                                        <img class="people_img" src="../../resources/img/공효진.jpeg" alt="">
                                    </div>
                                    <div class="people_info_wrap">
                                        <span>이름 : </span><br>
                                        <span>배역 : </span>
                                    </div>
                                    <div class="people_tooltip">
                                        <span>생년월일 : </span><br>
                                        <span>국적 : </span><br>
                                        <span>대표작 : (2~3개만)</span>
                                    </div>
                                </div>
                            </div>
                            <div class="movie_people_bottom">
                                <div class="people_img_info_wrap">
                                    <div class="people_img_wrap">
                                        <img class="people_img" src="../../resources/img/공효진.jpeg" alt="">
                                    </div>
                                    <div class="people_info_wrap">
                                        <span>이름 : </span><br>
                                        <span>배역 : </span>
                                    </div>
                                    <div class="people_tooltip">
                                        <span>생년월일 : </span><br>
                                        <span>국적 : </span><br>
                                        <span>대표작 : (2~3개만)</span>
                                    </div>
                                </div>
                                <div class="people_img_info_wrap">
                                    <div class="people_img_wrap">
                                        <img class="people_img" src="../../resources/img/공효진.jpeg" alt="">
                                    </div>
                                    <div class="people_info_wrap">
                                        <span>이름 : </span><br>
                                        <span>배역 : </span>
                                    </div>
                                    <div class="people_tooltip">
                                        <span>생년월일 : </span><br>
                                        <span>국적 : </span><br>
                                        <span>대표작 : (2~3개만)</span>
                                    </div>
                                </div>
                                <div class="people_img_info_wrap">
                                    <div class="people_img_wrap">
                                        <img class="people_img" src="../../resources/img/공효진.jpeg" alt="">
                                    </div>
                                    <div class="people_info_wrap">
                                        <span>이름 : </span><br>
                                        <span>배역 : </span>
                                    </div>
                                    <div class="people_tooltip">
                                        <span>생년월일 : </span><br>
                                        <span>국적 : </span><br>
                                        <span>대표작 : (2~3개만)</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="movie_review">
                    <div class="movie_review_title">
                        <h4 style="margin-left: 50px;">리뷰</h4>
                        <a style="border: none; color: white;" href="">더보기</a>
                    </div>
                    <div class="movie_review_info">
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
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
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
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/빈별.png" alt="">
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
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/빈별.png" alt="">
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
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/별.png" alt="">
                                            <img class="starRating_img" src="../../resources/img/빈별.png" alt="">
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
                <div class="movie_relate">
                    <div class="movie_relate_title">
                        <h4>관련 영화</h4>
                    </div>
                    <div class="movie_relate_els">
                        <div class="movie_relate_els_top">
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
                            <div class="thumbnail">
                                <img class="thumbnail_img" src="../../resources/img/듄2.jpeg" alt="">
                                <div class="thumbnail_title">
                                    <span>영화제목</span><br>
                                    <span>영화별점</span><br>
                                    <span>개봉연도, 국가</span>
                                </div>
                            </div>
                        </div>
                        <div class="movie_relate_els_bottom">
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
                </div>
            </div>
        </div>

        <%@ include file="/views/common/footer.jsp" %>


    </main>
    <script src="../../resources/assets/js/starRating.js"></script>
    <script src="../../resources/assets/js/starRating_forReviewTap.js"></script>
    <script src="../../resources/assets/js/like&dislike.js"></script>
    <script src="../../resources/assets/js/reviewBtnHover.js"></script>
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
</body>

</html>