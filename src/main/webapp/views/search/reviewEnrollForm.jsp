<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.fp.movie.model.vo.Movie" %>
    <%@ page import="com.fp.movie.model.vo.Review" %>
    <%
    	Movie movie = (Movie)request.getAttribute("movie");
    	Review review = (Review)request.getAttribute("review");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 영화 포스터 눌렀을때 나오는 페이지 스타일 */

    .test1 {
      background-color: rgb(15, 15, 15);
      border-radius: 10px;
      width: 80%;
      height: 80%;
      display: flex;
      flex-direction: row;
      justify-content: space-evenly;

    }

    /* 포스터, 영화정보 */
    .test2,
    .test3 {
      background-color: black;
      border-radius: 10px;
      width: 45%;
      display: flex;
      flex-direction: column;
      justify-content: space-around;
    }

    .moviePoster {
      height: 50%;
    }

    .movieExplanation {
      height: 45%;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .thumbnail_title {
      height: 15%;
      border-radius: 10px;
      background-color: rgb(0, 0, 0)
    }

    .movieStory {
      height: 80%;
      border-radius: 10px;
      background-color: black
    }

    /* 별점, 공감비공감, 리뷰 */
    .movieStarRating,
    .movieLikeDislike {
      height: 10%;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .movieRewiew {
      height: 60%;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }

    .movieReviewDetail {
      width: 100%;
      height: 80%;
      margin: auto;
    }

    .thumb_btn {
      width: 100%;
      display: flex;
      flex-direction: row;
      justify-content: center;
    }

    .thumb_up,
    .thumb_down {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 20%;
    }

    .thumb_count {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 10%;
    }

    #reviewContent {
      height: 100%;
      width: 100%;
    }


    /* 영화 포스터 */
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

    /* 영화 별점 */
    .wrap {
      width: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    
    .reviewForm {
	    height: 100%;
	    display: flex;
	    flex-direction: column;
	    justify-content: space-around;
    }
</style>


</head>
<body>

	  <%@ include file="/views/common/header.jsp" %>
	<link href="<%= contextPath %>/resources/css/starRating.css" rel="stylesheet">
    <div class="content_wrap" style="background-color: black;">
      <div class="content" style="display: flex;
      align-items: center;
      justify-content: center;
      height: 1000px;">

        <div class="test1">
          <div class="test2">
            <div class="moviePoster">
              <div class="thumbnail">
                <a><img class="thumbnail_img" src="<%= movie.getMvPoster() %>" alt=""></a>
              </div>
            </div>
            <div class="movieExplanation">
              <div class="thumbnail_title">
                <span><%= movie.getMvName() %></span><br>
                <span><%= movie.getStarRatingAvg() %></span><br>
                <span><%= movie.getMvOpenDate() %></span>
              </div>
              <div class="movieStory">
                <%= movie.getMvStory() %>
              </div>

            </div>
          </div>

          <div class="test3">

			<form id="reviewForm" action="<%= contextPath %>/reviewEnroll.fp?movieNo=<%= movie.getMvNo() %>&&alreadyReview=<%= review != null ? "1" : "0" %>" method="post" class="reviewForm">
				<!-- 별점 -->
	            <div class="movieStarRating">
	              <div class="wrap">
	                <div class="rating" style="width: 100%; display: flex; align-items: center; justify-content: center;">
	                  <label class="rating__label rating__label--half" for="starhalf">
	                    <input type="radio" id="starhalf" class="rating__input" name="rating" value="0.5">
	                    <span class="star-icon"></span>
	                  </label>
	                  <label class="rating__label rating__label--full" for="star1">
	                    <input type="radio" id="star1" class="rating__input" name="rating" value="1">
	                    <span class="star-icon"></span>
	                  </label>
	                  <label class="rating__label rating__label--half" for="star1half">
	                    <input type="radio" id="star1half" class="rating__input" name="rating" value="1.5">
	                    <span class="star-icon"></span>
	                  </label>
	                  <label class="rating__label rating__label--full" for="star2">
	                    <input type="radio" id="star2" class="rating__input" name="rating" value="2">
	                    <span class="star-icon"></span>
	                  </label>
	                  <label class="rating__label rating__label--half" for="star2half">
	                    <input type="radio" id="star2half" class="rating__input" name="rating" value="2.5">
	                    <span class="star-icon"></span>
	                  </label>
	                  <label class="rating__label rating__label--full" for="star3">
	                    <input type="radio" id="star3" class="rating__input" name="rating" value="3">
	                    <span class="star-icon"></span>
	                  </label>
	                  <label class="rating__label rating__label--half" for="star3half">
	                    <input type="radio" id="star3half" class="rating__input" name="rating" value="3.5">
	                    <span class="star-icon"></span>
	                  </label>
	                  <label class="rating__label rating__label--full" for="star4">
	                    <input type="radio" id="star4" class="rating__input" name="rating" value="4">
	                    <span class="star-icon"></span>
	                  </label>
	                  <label class="rating__label rating__label--half" for="star4half">
	                    <input type="radio" id="star4half" class="rating__input" name="rating" value="4.5">
	                    <span class="star-icon"></span>
	                  </label>
	                  <label class="rating__label rating__label--full" for="star5">
	                    <input type="radio" id="star5" class="rating__input" name="rating" value="5">
	                    <span class="star-icon"></span>
	                  </label>
	                </div>
	              </div>
	            </div>
	            <!-- 별점 -->
	
	            <!-- 공감/비공감 -->
	            <div class="movieLikeDislike">
	              <div class="thumb_btn" style="display: flex;">
	                <!-- 공감 -->
	                <div class="thumb_up">
	                  <div class="ag_disag_wrap">
	                    <div class="ag">
	                      <div class="ag_filled filled_wrap">
	                        <button type="button" class="ag_disag_btn ag_filled_btn"><img class="ag_filled_img ag_disag_img"
	                            src="<%= contextPath %>/resources/img/좋아요.png" alt=""></button>
	                      </div>
	                      <div class="ag_empty empty_wrap">
	                        <button type="button" class="ag_disag_btn ag_empty_btn"><img class="ag_empty_img ag_disag_img"
	                            src="<%= contextPath %>/resources/img/빈좋아요.png" alt=""></button>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	                <div class="thumb_count">
	                  <span style="font-size: 8px; padding-left: 0px;">공감 수</span>
	                </div>
	                <!-- 공감 -->
	
	                <!-- 비공감 -->
	                <div class="thumb_down">
	                  <div class="ag_disag_wrap">
	                    <div class="disag">
	                      <div class="disag_filled filled_wrap">
	                        <button type="button" class="ag_disag_btn disag_filled_btn"><img
	                            class="ag_filled_img ag_disag_img" src="<%= contextPath %>/resources/img/싫어요.png" alt=""></button>
	                      </div>
	                      <div class="disag_empty empty_wrap">
	                        <button type="button" class="ag_disag_btn disag_empty_btn"><img
	                            class="ag_empty_img ag_disag_img" src="<%= contextPath %>/resources/img/빈싫어요.png" alt=""></button>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	                <div class="thumb_count">
	                  <span style="font-size: 8px; padding-left: 0px;">비공감 수</span>
	                </div>
	                <!-- 비공감 -->
	              </div>
	            </div>
	
	            <!-- 내가 남긴 리뷰 -->
	            <div class="movieRewiew">
	              <div class="movieReviewDetail">
	                <textarea name="reviewContent" id="reviewContent" resize="none" placeholder="리뷰를 작성해주세요"><% if(review != null) { %><%= review.getReviewContent() != null ? review.getReviewContent() : "" %><% } %></textarea>
	              </div>
	              <button type="submit" class="btn btn-outline-light" id="formSubmit" style="--bs-btn-border-color: RGB(247, 39, 140);
	              --bs-btn-color: RGB(247, 39, 140);
	              --bs-btn-hover-color: #000;
	              --bs-btn-hover-bg: RGB(247, 39, 140);
	              --bs-btn-hover-border-color: #000;">등록하기</button>
	            </div>
			</form>

            
          </div>
        </div>
      </div>
    </div>

    <%@ include file="/views/common/footer.jsp" %>
      <script src="<%= contextPath %>/resources/assets/js/starRating.js"></script>
      <script>
      var ischecked = false;
      
      $("#reviewForm").submit(function(event) {
    	  event.preventDefault();
    	  
    	  $(".rating__input").each(function(index, el) {
    		  if($(el).is(":checked")) {
    			  ischecked = true;
    		  } 
    	  })
    	  if (!ischecked) {
    		  alert("별점을 매겨주세요!");
   		  } else {
   			  this.submit();
   		  }
      })
      
      $(".rating__input").each(function(index, el) {
    	  console.log($(el).val())
    	  <% if(review != null)  {%>
	    	  <% if(review.getLikePoint() != null) { %>
	    	  	
	    	  <% } %>
    	  <% } %>
      })
      
/*
 *       $(".rating__input").each(function(index, el) {
   	$(this).click(function() {
  		console.log($(el).val());
  	})	
})

 */
      </script>

</body>
</html>