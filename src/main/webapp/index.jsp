<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fp.movie.model.vo.Movie, java.util.List"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>firstPage</title>
<link rel="stylesheet" type="text/css" href="resources/css/slick-1.8.1/slick-1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/slick-1.8.1/slick-1.8.1/slick/slick-theme.css"/>
<!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<style>

    #wrap, #wrap *{
        box-sizing: border-box;
    }
    body{
        background-color: black;
    }
    #wrap{
        width: 100%;
        max-width: 1300px;
        height: 800px;
        margin: auto;
    }
    .content{
        background-color: rgb(8, 8, 8);
        padding-left: 20px;
    }
    .content_img{
    	width: 400px;
    	height: 570px;
    }
    .logo{
        margin: 30px;

    }
    .logo>a{
        color: #F62797;
        font-size: 40px;
        font-weight: bold;
        text-decoration: none;
    }
    #textplace{
    	padding-left: 10px;
    	padding-right : 10px;
    	font-size: 15px;
    }
    .search{
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        height: 90%;
    }
    .btn{
        border: 1px solid white;
        background-color: #F62797;
        color: white;
        width: 100px;
        height: 50px;
        font-size: large;
    }
    .text-box{
        border: 1px solid white;
        height: 50px;
        width: 300px;
        background-color: black;
        color: white;
    }
    .moving>a{
        color: white;
        text-decoration: none;
    }
    .slick-prev{
        size: 100px;
    }
	
</style>
</head>
<body>
    <div id="wrap">
    <div id="header">
        <div class="logo">
            <a href="<%= contextPath %>/mainpage.fp"><img src="resources/img/logo.png" alt="" style="width:200px"></a>
        </div>
    </div>
    <div id="movie_content" class="content">
        
      </div>
      <script>
      	$(function(){
      		movieList();
      	})
      	
      	function movieList(list){
      		$.ajax({
      			url: "<%= contextPath %>/firstmovie.co",
      			success:function(list){
      				let value = "";
      				if(list.length > 0){
      					for(let i = 0; i < list.length; i++){
      					value += "<div>"
      							+ "<a href='<%= contextPath %>/movieDetail.fp?movieNo=" + list[i].mvNo + "'>"
      	            			+	 "<img class='content_img' src='" + list[i].mvPoster + "'>"
      	            			+ "</a>"
      	         				+ "</div>";
      					}
      				}else{
      					value += "";
      				}
      				$("#movie_content").html(value);
      				console.log(list);
      				
      				$('.content').slick({
      		            
      		            dots: true,
      		            slidesToShow: 3,
      		            slidesToScroll: 1,
      		            autoplay: true,
      		            autoplaySpeed: 5000,
      		            centerMode: true,
      		            centerPadding: '0px',
      		            slidesToShow: 3,
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
      			}
      		})
      	}
      </script>
        <div>
            <form class="search" action="<%= contextPath %>/search.fp" method="get" role="search">
            <input id="textplace" name="searchKeyword" class="text-box form-control me-2" type="search" aria-label="Search" placeholder="영화, 인물">
            <button class="btn btn-outline-success" type="submit">검색</button>
            </form>
        </div>
    <br>
    <div class="moving" align="center" style="margin-top: -5px;">
        <a href="<%= contextPath %>/mainpage.fp">메인페이지로 이동 ></a>
    </div>

</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <script>
        /* $('.content').slick({
            
            dots: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 5000,
            centerMode: true,
            centerPadding: '0px',
            slidesToShow: 3,
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
        }); */
    </script>

    
</body>
</html>