<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fp.board.model.vo.*" %>
<%@ page import="com.fp.common.model.vo.*" %>
<%
	Board b = (Board)request.getAttribute("b");
	// 글번호,카테고리명,제목,내용,작성자아이디, 작성자회원번호
	
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
         margin: auto;
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
   	
   	.coment>tbody td{
   		white-space: pre;
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
                            <a href="<%=contextPath%>/delete.bo?no=<%=b.getbNo()%>" class="btn btn-outline-danger btn-sm" onclick="return deleteBo();">삭제하기</a>
                            <%} %>
                            <%if(loginMember != null){ %>																					
                            <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#boardReport" onclick="boardHidden('<%=b.getbNo()%>', '<%=loginMember.getMemNo()%>', '<%=b.getMemberNo()%>', '1');">신고하기</button>
                            <button type="button" class="btn btn-outline-warning btn-sm" onclick="good();">추천가기</button>
                            <%} %>
                            <!-- ---------------------------------------------------------------- -->
                            <button type="button" class="btn btn-outline-warning btn-sm" onclick="history.back();">뒤로가기</button>
                        </td>
                    </tr>
                </tbody>
            </table>

            <!-- 댓글관련영역 -->
            <table class="table coment" align="center" id="reply_area"> 
                <thead>
                    <tr>
                        <th>댓글작성</th>
                        <%if(loginMember == null){ // 로그인 전일 경우%>
                        <th width="650px">
                        	<textarea rows="4" class="form-control" style="resize: none;" readonly>로그인 후 이용 가능한 서비스입니다.</textarea>
                        </th>
                        <td>
                        	<button class="btn btn-secondary btn-sm" disabled>댓글등록</button>
                        </td>
                        <td>
                        	<!--형식상 맞추려고 만든 td임 -->
                        </td>
                        <%}else{ %>
                        <th width="650px">
                        	<textarea rows="4" class="form-control" style="resize: none;" id="reply_content"></textarea>
                        </th>
                        <td>
                        	<button class="btn btn-secondary btn-sm" onclick="insertReply();">댓글등록</button>
                        </td>
                        <td>
                        	<!--형식상 맞추려고 만든 td임 -->
                        </td>
                        <%} %>
                    </tr>
                <tbody>

                </tbody>
                </thead>
    <script>
    
    $(function(){
    	selectReplyList();
    })
    
    
    // ajax로 댓글 등록 요청하는 용도의 함수
    function insertReply(){
    	$.ajax({
    		url:"<%=contextPath%>/rinsert.bo",
    		data:{
    			no:<%=b.getbNo()%>,
    			content:$("#reply_content").val()
    		},
    		type:"post",
    		success:function(result){
    			if(result > 0)//댓글작성성공
    				$("#reply_content").val("");
    				selectReplyList();
    		},error:function(){
    			console.log("댓글 등록용 ajax실패")
    		}
    	})
    }
    
	// ajax로 게시글 추천하는 함수
	function good(){
    	$.ajax({
    		url:"<%=contextPath%>/good.bo",
    		data:{no:<%=b.getbNo()%>},
    		success:function(result){
    			if(result > 0){
    				alert("게시글을 추천하였습니다.");
    			}
    		},error:function(){
    			console.log("게시글 추천용 ajax실패")
    		}
    	})
    }
	
	// ajax로 해당 이 게시글에 딸려있는 댓글 목록 조회용
	function selectReplyList(){
    	$.ajax({
    		url:"<%=contextPath%>/rlist.bo",
    		data:{no:<%=b.getbNo()%>},
    		success:function(list){
    			let value = "";
    			if(list.length > 0){
    				for(let i=0; i<list.length; i++){
    				    value += "<tr>"
    				           +  "<th>" + list[i].reMemNo + "</th>"                                                                                            
    				           +  "<td>" + list[i].replyContent + "</td>"   
    				           +  "<td>" + list[i].enrollDate + "</td>"
    				           +  "<td><img id='img1' class='img' data-toggle='modal' data-target='#replyReport'  src='<%=contextPath%>/resources/img/신고버튼.png'></td>"
    				           + "</tr>";
    				}
    			}else{
    				value += "<tr><td colspan='4'>존재하는 댓글이 없습니다.</td></tr>";
    			}
    			$("#reply_area tbody").html(value);
    		},
    		error:function(){
    			console.log("댓글목록 조회용 ajax실패")
    		}
    	})
    }                
    				
    function community_go(){
        location.href="<%= contextPath %>/main.bo";
    }
    
    function deleteBo(){
    	if(confirm("게시글을 삭제하시겠습니까??")){
    		return true;
    	}else{
    		return false;
    	}
    }
    
    
    // 댓글신고				 
    function hidden(replyNo, reportNo, reportedNo, typeNo){
    	// 전달받은 값들을 해당 input 요소에value로 대입하는 구문
        document.getElementById('replyNo').value = replyNo; //히든으로 넘길 댓글번호
        document.getElementById('replyReportNo').value = reportNo; //히든으로 넘길 신고한회원번호
        document.getElementById('replyReportedNo').value = reportedNo; //히든으로 넘길 신고받은회원번호
        document.getElementById('replyTypeNo').value = typeNo; //히든으로 넘길 신고타입 댓글은 2임
    }
    
    // 게시글신고				 
    function boardHidden(boardNo, reportNo, reportedNo, typeNo){
    	// 전달받은 값들을 해당 input 요소에value로 대입하는 구문
        document.getElementById('boardNo').value = boardNo; //히든으로 넘길 게시글번호
        document.getElementById('boardReportNo').value = reportNo; //히든으로 넘길 신고한회원번호
        document.getElementById('boardReportedNo').value = reportedNo; //히든으로 넘길 신고받은회원번호
        document.getElementById('boardTypeNo').value = typeNo; //히든으로 넘길 신고타입 게시글은 1임
    }
    
    </script>
				
				<!-- 게시글신고 The Modal -->
                <div class="modal" id="boardReport">
                    <div class="modal-dialog">
                        <div class="modal-content"> 
                            <div class="modal-body">
                            <form action="<%=contextPath%>/boReport.bo" method="post">
								<input type="hidden" id="boardNo" name="boardNo" value="">
                                <input type="hidden" id="boardReportNo" name="boardReportNo" value="">
                                <input type="hidden" id="boardReportedNo" name="boardReportedNo" value="">
                                <input type="hidden" id="boardTypeNo" name="boardTypeNo" value="">
                                    <p class="modal-text">
                                            <input class="ca" type="checkbox" name="notify" value="1"> 욕설 <br>
                                            <input class="ca" type="checkbox" name="notify" value="2"> 도배 <br>
                                            <input class="ca" type="checkbox" name="notify" value="3"> 음란성 및 선정성 <br>
                                            <input class="ca" type="checkbox" name="notify" value="4"> 기타 <br><br><br>
                                            자세한내용입력<br>
                                            <textarea id="texBo" rows="7" class="form-control" style="resize: none;" name="content"></textarea>
                                    </p> <br><br>
                                    <button type="button" class="btn btn-secondary modal-btn no" style="width: 100px;" data-dismiss="modal">취소</button>
                                    <button type="submit" class="btn btn-dark modal-btn" style="width: 100px;">신고하기</button>
                            </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- The Modal end-->
				
                <!-- 댓글신고 The Modal -->
                <div class="modal" id="replyReport">
                    <div class="modal-dialog">
                        <div class="modal-content"> 
                            <div class="modal-body">
                           	 <form action="<%=contextPath%>/boReReport.bo" method="post">
                                <input type="hidden" id="replyNo" name="replyNo" value="">
                                <input type="hidden" id="replyReportNo" name="replyReportNo" value="">
                                <input type="hidden" id="replyReportedNo" name="replyReportedNo" value="">
                                <input type="hidden" id="replyTypeNo" name="replyTypeNo" value="">
                                    <p class="modal-text">
                                            <input class="ca" type="checkbox" name="notify" value="1"> 욕설 <br>
                                            <input class="ca" type="checkbox" name="notify" value="2"> 도배 <br>
                                            <input class="ca" type="checkbox" name="notify" value="3"> 음란성 및 선정성 <br>
                                            <input class="ca" type="checkbox" name="notify" value="4"> 기타 <br><br><br>
                                            자세한내용입력<br>
                                            <textarea id="tex" rows="7" class="form-control" style="resize: none;" name=""></textarea>
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

    <!-- 컨텐츠부분 종료 -->
	
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>