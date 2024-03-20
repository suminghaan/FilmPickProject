<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fp.board.model.vo.*" %>
<%@ page import="com.fp.common.model.vo.*" %>
<%
	Board b = (Board)request.getAttribute("b");
	// 글번호,카테고리명,제목,내용,작성자아이디
	
	Attachment at = (Attachment)request.getAttribute("at");
	// null (첨부파일이 없을경우)
	// 파일번호,원본명,실제서버에업로드된파일명,저장경로
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /*컨텐츠부분*/
     .background{
         min-height: 500px;
         margin: 50px;
         background-color: rgb(39, 39, 39);
         flex-direction: column;
         padding-top: 30px;
         padding-bottom: 30px;
     }
     
     .table{
         border-bottom: 1px solid white;
         width: 90% !important;
         margin-top: 10px;
         /* 절때 건들이면 안되는 스타일임 */
         --bs-table-bg: rgb(39, 39, 39) !important;
         --bs-table-color: white !important;
         /* background-color: rgb(39, 39, 39); */
     }

     .title{
         color: white;
         font-size: 20px;
     }
     .writer{
         color: rgb(158, 158, 158);
         margin-left: 60px;
         margin-bottom: 800px;
     }
     .content{
         color: white;
         font-size: 20px;
     }
     
     .img{
         width: 30px;
         cursor: pointer;
     }
     .coment{
         color: white;
     }

     .no{
         margin-left: 260px;
     }

    .community_logo{
       color: white;
       cursor: pointer;
       font-size: 25px;
       margin-left: 30px;
   	}
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>
	
	<!-- 컨텐츠부분 시작 -->
    <section class="content_wrap" style="background: black; min-height: 1200px;">

        <div class="background">
            <br>
            <span class="community_logo" onclick="community_go();">커뮤니티</span><br><br><br>
            <span class="writer"><%=b.getMemNo() + " / " + b.getbRegistDate() %></span> <br>
            <table class="tableb table" align="center">
                <thead>
                    <tr>
                        <td class="title"><%=b.getbNo() + " [" + b.getbCategory() + "] " + b.getbTitle() %></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="content"><p style="min-height: 300px; white-space:pre"><%= b.getbContent() %><br><br><%if(at != null){ %><img style="width: 300px; height: 300px;" src="<%=contextPath+ "/" + at.getFilePath() + at.getChangeName()%>"><%} %></p></td>
                    </tr>
                    <tr>
                        <td colspan="6" align="center">
                            <!-- 현재 로그인한 사용자가 해당 게시글 작성자일 경우 보여지는 버튼 요소-->
                            <%if(loginMember != null && loginMember.getMemId().equals(b.getMemNo())){ %>
                            <a href="<%= contextPath %>/updateForm.bo?no=<%= b.getbNo() %>" class="btn btn-outline-secondary btn-sm">수정하기</a>
                            <a class="btn btn-outline-danger btn-sm">삭제하기</a>
                            <%} %>
                            <!-- ---------------------------------------------------------------- -->
                            <button type="button" class="btn btn-outline-warning btn-sm" onclick="history.back();">뒤로가기</button>
                            <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#img1">신고하기</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            

            <!-- 댓글관련영역 -->
            <table class="table coment" align="center">
                <thead>
                    <tr>
                        <form action="" method="">
                            <th>댓글작성</th>
                            <th width="650px"><textarea rows="4" class="form-control" style="resize: none;" name=""></textarea></th>
                            <td><button type="submit" class="btn btn-secondary btn-sm">댓글등록</button></td>
                        </form>
                        <td></td><!--형식상 맞추려고 만든 td임 -->
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>user01</th>
                        <td>댓글내용입니다~~~~~</td>
                        <td>2024/01/12</td>
                        <td><img id="img1" class="img" data-toggle="modal" data-target="#img1" src="<%=contextPath %>/resources/img/신고버튼.png"></td>
                    </tr>
                    <tr>
                        <th>user01</th>
                        <td>댓글내용입니다~~~~~</td>
                        <td>2024/01/12</td>
                        <td><img id="img1" class="img" data-toggle="modal" data-target="#myModal" src="<%=contextPath %>/resources/img/신고버튼.png"></td>
                    </tr>
                    <tr>
                        <th>user01</th>
                        <td>댓글내용입니다~~~~~</td>
                        <td>2024/01/12</td>
                        <td><img id="img1" class="img" data-toggle="modal" data-target="#myModal" src="<%=contextPath %>/resources/img/신고버튼.png"></td>
                    </tr>
                    <tr>
                        <th>user01</th>
                        <td>댓글내용입니다~~~~~</td>
                        <td>2024/01/12</td>
                        <td><img id="img1" class="img" data-toggle="modal" data-target="#myModal" src="<%=contextPath %>/resources/img/신고버튼.png"></td>
                    </tr>
                </tbody>

                <!-- The Modal -->
                <div class="modal" id="img1">
                    <div class="modal-dialog">
                        <div class="modal-content"> 
                            <div class="modal-body">
                                <form action="" method="">
                                    <p class="modal-text">
                                            <input type="checkbox" name="notify" value="욕설"> 욕설 <br>
                                            <input type="checkbox" name="notify" value="도배"> 도배 <br>
                                            <input type="checkbox" name="notify" value="음란성 및 선정성"> 음란성 및 선정성 <br>
                                            <input type="checkbox" name="notify" value="기타"> 기타 <br><br><br>
                                            자세한내용입력<br>
                                            <textarea rows="7" class="form-control" style="resize: none;" name=""></textarea>
                                    </p> <br><br>
                                    <button type="button" class="btn btn-secondary modal-btn no" style="width: 100px;" data-dismiss="modal">취소</button>
                                    <button type="submit" class="btn btn-dark modal-btn" style="width: 100px;">신고하기</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- The Modal end-->

            </table>

        </div> <br><br>
    </section>
    <!-- Section end -->

    <script>
    function community_go(){
        location.href="<%= contextPath %>/main.bo";
    }
    </script>
    <!-- 컨텐츠부분 종료 -->
	
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>