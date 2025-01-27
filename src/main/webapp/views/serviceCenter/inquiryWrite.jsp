<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*컨텐츠부분*/
    .background{
        margin: 50px;
        background-color: rgb(39, 39, 39);
        padding-bottom: 30px;
    }

    .content_link{
        display: flex;
        padding-top: 50px;
        padding-left: 120px;
    }

    .content_link>a{
        text-decoration: none;
        letter-spacing: 5px;
    }

    .division{
        margin-left: 20px;
        margin-right: 20px;
    }

    .tableback{
        background: white;
        width: 80% !important;
        margin: auto;
    }

    th{background-color:rgb(240, 234, 234);}

    .notice_title>th {
        width: 33%;
    }

    #head{cursor: pointer;}

    #head>th{border: 1px solid gray}
    
    .comment{
        resize: none;
        margin: auto;
        width: 95%;
    }

    .modal-content{
        display: flex;
        height: 220px;
        width: 400px;
        margin-top: 300px;
        align-items: center;
        text-align: center;
    }

    .modal-body{
        align-items: center;
        text-align: center;
        height: 100%;
    }

    .modal-text{
        font-size: 25px;
        margin-top: 25px;
    }

    .modal-dialog{max-width: 400px;}

    .content-btn{
        margin-left: 950px;
    }
</style>
</head>
<body>
	
	<%@ include file="/views/common/header.jsp" %>
	
	<!-- 컨텐츠 부분 시작 -->
    <section class="content_wrap" style="background: black; min-height: 1000px;">
        <div class="background">
            <div class="content_link"">
            	<!-- 추후 링크 수정 @@@@@@@@@@ -->
                <a href="<%=contextPath%>/list.no?page=1" style="color: rgb(158, 158, 158);"><h2>공지사항</h2></a> <h2 class="division" style="color: rgb(158, 158, 158);">|</h2>
                <%if(loginMember != null){ %>
                <a href="<%=contextPath%>/list.in?page=1" style="color: rgb(255, 255, 255);"><h2>고객센터</h2></a>
                <%}else{ %>
                <a href="<%=contextPath%>/loginForm.me" style="color: rgb(255, 255, 255);"><h2>고객센터</h2></a>
                <%} %>
            </div>
            <br> 
            <table class="tableback table" id="question_list">
                <thead>
                    <tr class="notice_title" align="center" id="head">
                        <th style="color: rgb(158, 158, 158);" onclick="question_list();">문의현황확인</th>
                        <th style="color: rgb(158, 158, 158);" onclick="nomv(<%=loginMember.getMemNo()%>);">없는영화신청</th>
                        <th onclick="mantoman();">1대1 문의</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="3" class="mantoman_background">
                            <form action="<%= contextPath %>/inquiry.no" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                  <div style="margin-left: 30px; margin-bottom: 5px; font-size: large;">제목</div>
                                  <textarea class="form-control comment" rows="1" placeholder="제목을 입력해주세요" name="title"></textarea>  
                                </div>
                                <div class="form-group"> 
                                  <div style="margin-left: 30px; margin-bottom: 5px; font-size: large;">문의내용</div>
                                  <textarea class="form-control comment" rows="15" placeholder="내용을 입력해주세요" name="content"></textarea>
                                </div> <br>
                                <input type="file" class="form-control-file" name="upfile" style="margin-left: 25px; width: 250px;">
                                <p class="bt">
                                    <button type="reset" class="btn btn-secondary content-btn">초기화</button>
                                    <%if(loginMember != null){ %>
                                    <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal">등록</button>
                               		<%} %>
                                </p>

                            <!-- The Modal -->
                            <div class="modal" id="myModal">
                                <div class="modal-dialog">
                                    <div class="modal-content"> 
                                        <div class="modal-body">
                                            <p class="modal-text">등록하시겠습니까?</p> <br><br>
                                            <button type="button" class="btn btn-secondary modal-btn" style="width: 100px;" data-dismiss="modal">취소</button>
                                            <button type="submit" class="btn btn-dark modal-btn" style="width: 100px;">OK</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- The Modal end-->
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>

        </div> <br><br>
    </section>

    <script>

        function question_list(){
            location.href="<%=contextPath%>/list.in?page=1";
        }
        
        function nomv(memNo){
            location.href="<%=contextPath%>/list.noMv?memNo=" + memNo + "&page=" + 1;
        }

        function mantoman(){
            location.href="inquiryWrite.jsp"; // 추후 수정
        }
        
    </script>

    <!-- 컨텐츠 부분 종료 -->
    
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>