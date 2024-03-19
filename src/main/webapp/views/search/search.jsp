<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.fp.movie.model.vo.Movie" %>
    <%@ page import="com.fp.common.model.vo.Attachment" %>
    <% 
    	ArrayList<Movie> movieList = ((ArrayList<Movie>)request.getAttribute("movieList")); 
    	ArrayList<Attachment> posterList = ((ArrayList<Attachment>)request.getAttribute("posterList"));
    %>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>

  <title>FILM PICK</title>


  <style>
    /* 추가 내용 */

    .search_info {
      height: 2%;
      background-color: rgb(48, 48, 48);
      padding-top: 2px;
      padding-left: 50px;
      border-radius: 10px;
    }

    .mp_bar {
      padding-left: 50px;
      padding-top: 10px;
      font-weight: bold;
      font-size: 30px;
      height: 5%;
      color: white;
    }

    .movie_info {
      height: 58%;
      background-color: rgb(12, 12, 12);
      border-radius: 10px;
    }

    .person_info {
      height: 25%;
      margin-top: 1%;
      background-color: rgb(12, 12, 12);
      border-radius: 10px;
    }

    .movie_list {
      padding: 0px 80px;
      height: 100%;
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
    }

    .person_list {
      height: 100%;
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
    }

    .thumbnail {
      /* width: 20%; */
      height: 42%;
      margin: 10px 25px 25px 5px;
      /* border: 1px solid lightgray; */
      padding: 5px;
      cursor: pointer;
      display: flex;
      padding-bottom: 10px;
      justify-content: center;
      /* 위치를 표시할 기준이 되는 부모 요소에 relative */
      position: relative;
    }

    .person_wrap {
      height: 70%;
      margin: 0px 120px 25px 80px;
      /* border: 1px solid lightgray; */
      padding: 5px;
      display: flex;
      flex-direction: row;
      justify-content: center;
    }

    /* .thumbnail:hover>img,
    .thumbnail_etc {
      opacity: 0.95;
    } */

    .thumbnail_img {
      width: 240px;
      height: 330px;
      border-radius: 10px;
    }

    .person_img {
      width: 150px;
      height: 210px;
      border-radius: 20px;
    }

    .information {
      font-size: 15px;
      padding-left: 20px;
      margin: auto;
    }

    .thumbnail:hover>.thumbnail_title {
      display: block;
    }

    .thumbnail:hover> .thumbnail_img {
            opacity: 0.8;
        }

    .thumbnail_title {
      width: 240px;
      height: 50px;
      background-color: rgba(0, 0, 0, 0.2);
      font-size: 13px;
      color: white;
      text-align: left;
      /* 위치를 이동시킬 요소에 absolute. top. left, right 등으로 위치 조절 */
      position: absolute;
      bottom: 10px;
      /* 요소가 겹쳐있을 때 무엇을 더 위에 표현할지. z-index 값이 클수록 위에 옴 */
      z-index: 10;
      display: none;
    }

    .thumbnail_etc {
      display: flex;
      justify-content: space-between;
    }
  </style>
  <!-- Custom styles for this template -->
</head>

<body>

  <main>
    <%@ include file="/views/common/header.jsp" %>

    <div class="content_wrap" style="background-color: black;">
      <div class="content" style="height: 1500px;'">
        <div class="search_info">
          사용자 검색 결과
        </div>
        <div class="mp_bar">
          영화 / 인물 <%= posterList.size() %>
        </div>
        <div class="movie_info">
          <div style="padding: 10px 0px 0px 100px; color: white;">
            <h4>영화</h4>
          </div>
          <div id="carouselMovie" class="carousel slide" style="height: 85%;">
            <div class="carousel-inner">
                <% for(int i = 0; i < movieList.size(); i++) { %>
                <% if(i % 8 == 0) {%>
                	<div class="carousel-item <%= i == 0 ? "active" : ""%>">
                	<div class="movie_list">
                <% } %>
                  <div class="thumbnail">
                    <img class="thumbnail_img" src="<%= posterList.get(i).getFilePath() %>" alt="">
                    <div class="thumbnail_title"">
                      <span><%= movieList.get(i).getMvName() %></span><br>
                      <span>평균 별점 : <%= movieList.get(i).getStarRatingAvg() != null ? movieList.get(i).getStarRatingAvg() : "정보없음"%></span><br>
                      <span><%= movieList.get(i).getMvOpenDate() %></span>
                    </div>
                  </div>
                  <% if(i % 8 == 7 || i == (movieList.size() - 1)) {%>
                  </div>
                  </div>
                  <% } %>
                <% } %>

            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselMovie" data-bs-slide="prev">
              <span><i class="fa-solid fa-arrow-left fa-2x" style="color: RGB(247, 39, 152);"></i></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselMovie" data-bs-slide="next">
              <span><i class="fa-solid fa-arrow-right fa-2x" style="color: RGB(247, 39, 152);"></i></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
        </div>
        <div class="person_info">
          <div style="padding: 10px 0px 0px 100px; color: white;">
            <h4>인물</h4>
          </div>
          <div id="carouselPerson" class="carousel slide">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <div class="person_list" >
                  <div class="person_wrap">
                    <img class="person_img" src="../../resources/img/공유.jpg" alt="">
                    <div class="information">
                      <span>이름 :</span><br>
                      <span>출생연도 : </span><br>
                      <span>국적 : </span><br>
                      <span>직업 : </span>
                    </div>
                  </div>
                  <div class="person_wrap">
                    <img class="person_img" src="../../resources/img/공유.jpg" alt="">
                    <div class="information">
                      <span>이름 :</span><br>
                      <span>출생연도 : </span><br>
                      <span>국적 : </span><br>
                      <span>직업 : </span>
                    </div>
                  </div>
                  <div class="person_wrap">
                    <img class="person_img" src="../../resources/img/공유.jpg" alt="">
                    <div class="information">
                      <span>이름 :</span><br>
                      <span>출생연도 : </span><br>
                      <span>국적 : </span><br>
                      <span>직업 : </span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="carousel-item">
                <div class="person_list" >
                  <div class="person_wrap">
                    <img class="person_img" src="../../resources/img/공효진.jpeg" alt="">
                    <div class="information">
                      <span>이름 :</span><br>
                      <span>출생연도 : </span><br>
                      <span>국적 : </span><br>
                      <span>직업 : </span>
                    </div>
                  </div>
                  <div class="person_wrap">
                    <img class="person_img" src="../../resources/img/공효진.jpeg" alt="">
                    <div class="information">
                      <span>이름 :</span><br>
                      <span>출생연도 : </span><br>
                      <span>국적 : </span><br>
                      <span>직업 : </span>
                    </div>
                  </div>
                  <div class="person_wrap">
                    <img class="person_img" src="../../resources/img/공효진.jpeg" alt="">
                    <div class="information">
                      <span>이름 :</span><br>
                      <span>출생연도 : </span><br>
                      <span>국적 : </span><br>
                      <span>직업 : </span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="carousel-item">
                <div class="person_list" >
                  <div class="person_wrap">
                    <img class="person_img" src="../../resources/img/고경표.jpeg" alt="">
                    <div class="information">
                      <span>이름 :</span><br>
                      <span>출생연도 : </span><br>
                      <span>국적 : </span><br>
                      <span>직업 : </span>
                    </div>
                  </div>
                  <div class="person_wrap">
                    <img class="person_img" src="../../resources/img/고경표.jpeg" alt="">
                    <div class="information">
                      <span>이름 :</span><br>
                      <span>출생연도 : </span><br>
                      <span>국적 : </span><br>
                      <span>직업 : </span>
                    </div>
                  </div>
                  <div class="person_wrap">
                    <img class="person_img" src="../../resources/img/고경표.jpeg" alt="">
                    <div class="information">
                      <span>이름 :</span><br>
                      <span>출생연도 : </span><br>
                      <span>국적 : </span><br>
                      <span>직업 : </span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselPerson" data-bs-slide="prev">
              <span><i class="fa-solid fa-arrow-left fa-2x" style="color: RGB(247, 39, 152);"></i></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselPerson" data-bs-slide="next">
              <span><i class="fa-solid fa-arrow-right fa-2x" style="color: RGB(247, 39, 152);"></i></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>


        </div>
      </div>
    </div>

    <%@ include file="/views/common/footer.jsp" %>

</body>

</html>