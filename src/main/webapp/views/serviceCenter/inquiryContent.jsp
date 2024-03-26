<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fp.inquiry.model.vo.*" %>
<%@ page import="com.fp.common.model.vo.*" %>
<%
	Inquiry inqu = (Inquiry)request.getAttribute("inqu");
	// 글번호,제목,내용,질문일,답변,답변일,관리자번호,관리자id,회원번호
	Attachment at = (Attachment)request.getAttribute("at");
	// null (첨부파일이 없을경우)
	// 파일번호,원본명,실제서버에업로드된파일명,저장경로
	int p = (int)request.getAttribute("p");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   /*컨텐츠부분*/
    /* .content_wrap {
    background: black;
    } */

    .background{
        margin: 50px;
        margin-bottom: 0px;
        background-color: rgb(39, 39, 39);
        display: flex;
        flex-direction: column;
        min-height: 600px;
    }

    .content_name{
        border: 1px solid white;
        width: 80%;
        height: 100px;
        margin: auto;
        border-left: none;
        border-right: none;
        margin-top: 60px;
        margin-bottom: 0px;
    }

    .question_title{
        font-weight: bold;
        font-size: 30px;
        margin-top: 10px;
    }

    .content_first{
        color: white;
        margin-bottom: 15px;

    }

    .content_second{
        color: rgb(158, 158, 158);
    }

    .question_q{
        color: white;
        margin-left: 140px;
        font-weight: bold;
        font-size: 25px;
    }

    .btnback{
        width: 10%;
        margin-bottom: 50px;
        margin-top: 30px;
        margin-left: 1110px;
    }

    .question_que{
        color: white;
        border-bottom: 1px solid rgb(158, 158, 158);
        width: 80%;
        min-height: 200px;
        margin: auto;
        font-size: 25px;
        margin-top: 0px;
        margin-bottom: 0px;
    }

    .question_a{
        color: white;
        margin-left: 140px;
        font-weight: bold;
        font-size: 25px;
    }

    .question_ans{
        color: white;
        border-bottom: 1px solid rgb(158, 158, 158);
        width: 80%;
        min-height: 200px;
        margin: auto;
        font-size: 25px;
        margin-top: 0px;
        margin-bottom: 0px;
    }
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>

	<!-- 컨텐츠 부분 시작 -->
    <section class="content_wrap" style="background: black; min-height: 1000px;">

        <div class="background">

            <div class="content_name">
                <div class="content_first">
                    <div class="question_title"><%=inqu.getInqryTitle()%></div>
                </div>
                <div class="content_second">
                    <div class="upload_date"><%=inqu.getInqryDate() + "  문의"%></div>
                </div>
            </div>
            <span class="question_q">Q</span>
            <div class="question_que"><%=inqu.getInqryContent()%><br><br><%if(at != null){ %><img style="width: 300px; height: 300px;" src="<%=contextPath+ "/" + at.getFilePath() + at.getChangeName()%>"><%} %><br><br></div>
            
            <span class="question_a">A</span>
            <!-- 답변이 없을 경우 -->
            <!-- <div class="question_ans">아직 답변이 없습니다.</div> -->
			<%if(inqu.getInqryAContent() != null){ %>
            <div class="question_ans"><%=inqu.getInqryAContent()%></div>
            <%}else{ %>
            <div class="question_ans">아직 답변이 없습니다.</div>
            <%} %>

            <button type="button" class="btn btn-secondary btnback" onclick="back(<%=p%>);">뒤로가기</button>
        
        </div><br><br><br>
    </section>
    
    <script>
    	function back(p){
			location.href="<%=contextPath%>/list.in?page=" + p;
		}
	</script>
    
    <!-- 컨텐츠 부분 종료 -->

	<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>