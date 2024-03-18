<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .logo{
        margin: 30px;

    }
    .logo>a{
        color: #F62797;
        font-size: 40px;
        font-weight: bold;
        text-decoration: none;
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
    <div class="content">
        <div>
            <a href=""><img src="resources/img/파묘.jpeg" alt="" style="width: 400px; height: 600px;"></a>
        </div>
        <div>
            <a href=""><img src="resources/img/듄2.jpeg" alt="" style="width: 400px; height: 600px;"></a>
        </div>
        <div>
            <a href=""><img src="resources/img/건국전쟁.jpeg" alt="" style="width: 400px; height: 600px;"></a>
        </div>
        <div>
            <a href=""><img src="resources/img/웡카.jpeg" alt="" style="width: 400px; height: 600px;"></a>
        </div>
        <div>
            <a href=""><img src="resources/img/가여운것들.jpeg" alt="" style="width: 400px; height: 600px;"></a>
        </div>
      </div>
        <div>
            <form class="search">
            <input class="text-box form-control me-2" type="search" aria-label="Search">
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
    </script>

    
</body>
</html>