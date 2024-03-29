<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "com.fp.movie.model.vo.Movie" %>
<%
	
	List<Movie> movieStarRatingList = (List<Movie>)request.getAttribute("starratinglist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
      height: 67%;
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
      flex-direction: column;
      justify-content: center;
      /* 위치를 표시할 기준이 되는 부모 요소에 relative */
      position: relative;
      align-items: center;
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
      font-size: 10px;
      color: white;
      text-align: left;
      /* 위치를 이동시킬 요소에 absolute. top. left, right 등으로 위치 조절 */
      position: absolute;
      bottom: 90px;
      /* 요소가 겹쳐있을 때 무엇을 더 위에 표현할지. z-index 값이 클수록 위에 옴 */
      z-index: 10;
      display: none;
    }

    .thumbnail_etc {
      display: flex;
      justify-content: space-between;
    }

    .heart{
      position: absolute;
      top: 10px;
      right: 10px;
    }  
    
	.starRating_img {
      height: 25px;
    }
    
</style>
<link rel="stylesheet" href="../../resources/css/heart_movielike.css">
</head>
<body>
  <main>
    
	<%@ include file="/views/common/header.jsp" %>
	
	
    <div class="content_wrap" name="movie-starRating" style="background-color: black;">
      <div class="content">
      
      	<div class="mp_bar">
          	<h2>별점 남긴 영화</h2> 
          </div>
          <br><br>
          <div id="carouselMovie" class="carousel slide" style="height: 85%;">
            <div class="carousel-inner">
                <% for(int i = 0; i < movieStarRatingList.size(); i++) { %>
                <% if(i % 8 == 0) {%>
                	<div class="carousel-item <%= i == 0 ? "active" : ""%>">
                	<div class="movie_list">
                <% } %>
                  <div class="thumbnail">
                    <a href="<%= contextPath %>/movieDetail.fp?movieNo=<%= movieStarRatingList.get(i).getMvNo() %>"><img class="thumbnail_img" src="<%= movieStarRatingList.get(i).getMvPoster() %>" alt=""></a>
                    <div class="thumbnail_title"">
                      <span><%= movieStarRatingList.get(i).getMvName() %></span><br>
                      <span>평균 별점 : <%= movieStarRatingList.get(i).getStarRatingAvg() != null ? movieStarRatingList.get(i).getStarRatingAvg() : "정보없음"%></span><br>
                      <span><%= movieStarRatingList.get(i).getMvOpenDate() %></span>
                    </div>
                    <div class="user_review_star">
                   		<div class="star-wrap">
                        <% for(int j = 0; j < 5; j++) {%>
	                        <% if (j < (int)Double.parseDouble(movieStarRatingList.get(i).getStarRating())) { %>
	                            <img class="starRating_img" src="<%= contextPath %>/resources/img/리뷰별.png" alt="">
	                            <% } else if(j < Math.ceil((Double.parseDouble(movieStarRatingList.get(i).getStarRating()))) ) {%>
	                            <img class="starRating_img" src="<%= contextPath %>/resources/img/리뷰반별.png" alt="">
	                        <% } else { %>
	                             <img class="starRating_img" src="<%= contextPath %>/resources/img/리뷰빈별.png" alt="">
	                        <% } %>
                        <% } %>
                        </div>
                    </div>
                    <br>
                    <div class="review_btn">
                      <button class="btn-reviewEdit" id="re1" onclick="location.href='<%=contextPath%>/movieStarRatingListDetail?movieNo=<%= movieStarRatingList.get(i).getMvNo() %>'" style="background: none; border: none;">
                        <i class="fa-solid fa-pen-to-square fa-2x" style="color: #F72798;"></i></button>
                    </div>
                  </div>
                  <% if(i % 8 == 7 || i == (movieStarRatingList.size() - 1)) {%>
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
    </div>

    <%@ include file="/views/common/footer.jsp" %>

  </main>
  <script src="<%= contextPath %>/resources/assets/dist/js/bootstrap.bundle.min.js"></script>
  <script src="<%= contextPath %>/resources/assets/js/reviewBtnHover.js"></script>

    
	
</body>
</html>