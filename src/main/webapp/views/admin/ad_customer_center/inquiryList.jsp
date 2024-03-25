<%@page import="com.fp.inquiry.model.vo.Inquiry"%>
<%@page import="java.util.List"%>
<%@page import="com.fp.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	List<Inquiry> pageList = (List<Inquiry>) request.getAttribute("pageList");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 확인</title>
<style>
#select-user-title{
    margin-top: 50px;
}
table{
    margin-top: 20px;
}
.title>h1{
    font-weight: bold;
}

#table-head > tr > th{
    border-top: 1px solid rgb(67, 58, 58);
    border-bottom: 1px solid black;
    background-color: rgba(239, 239, 239, 0.58);
}

#table-body >  tr > td{
    border-top: 1px solid black;
}

tr[class*='reply']{
    display: none;
}

tr[class^='inquiry']:hover{
    cursor: pointer;
}

#modify-reply1, #modify-reply2{
    display: none;
}
</style>
</head>
<body>
	<%@ include file="/views/admin/common/header.jsp" %>
    	<div class="container-fluid">
    		<div class="container">
        <div id="title" class="title">
            <h1 id="select-user-title">1:1문의 확인</h1>
        </div>
        <hr>
            <div class="container">
            <table class="table ">
                <thead id="table-head">
                <tr class="table-active">
                    <th>번호</th>
                    <th>제목</th>
                    <th>상태</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <tbody id="table-body">
                <% if(pageList.isEmpty()){ %>
                <tr>
                	<td colspan="5" style="text-align: center;">문의글이 존재하지 않습니다.</td>
                </tr>
                	<% } else { %>
	                	<% for(Inquiry i : pageList){ %>
	                	<!-- 제목행 -->
		                <tr class="inquiry3">
		                    <td><%=i.getInqryNo()%></td>
		                    <td><%=i.getInqryTitle()%></td>
		                    <td>
		                    	<% if(i.getInqryStatus().equals("답변대기")){ %>
				                <button type="button" class="btn btn-outline-primary btn-sm disabled">답변대기</button>
					            <% } else { %>
					                <button type="button" class="btn btn-primary btn-sm disabled">답변완료</button>
					            <% } %>
		                    </td>
		                    <td><%=i.getInqryDate()%></td>
		                </tr>
		                <!-- 문의행 -->
		                <tr class="write-reply1">
		                    <td colspan="5" rowspan="1" style="height: 100px;">
		                        <div class="container" style="margin-top: 25px;">
		                            <%= i.getInqryContent() %>
		                        </div>
		                    </td>
		                </tr>
		                
		                
	                
		                <% 
							System.out.println(i.getInqryStatus());	                
		                if(i.getInqryStatus().equalsIgnoreCase("답변대기")) { %> 
		                <tr class="write-reply1">
		                    <td colspan="5" rowspan="1" style="height: 100px;">
		                        <div class="container">
		                            <textarea class="form-control" rows="6" placeholder="답변을 작성해주세요" style="resize: none;"></textarea>
		                        </div>
		                        <div class="d-flex justify-content-end container">
		                            <button type="button" class="btn btn-secondary btn-sm" style="margin-top: 10px;" onclick="alert('답변 작성이 완료되었습니다.')">작성</button>
		                        </div>
		                    </td>
		                </tr>
		                 <% } else { %>
		                 <tr class="reply">
		                    <td colspan="5" rowspan="1" style="height: 100px;">
		                        <div class="container">
		                            <p style="color: rgb(41, 128, 185); font-weight: bold;">답변</p>
		                            <p id="reply-text1"><%= i.getInqryAContent() == "없음" ? "없음" : i.getInqryAContent() %><br><br>
		                            	<img src="../ad_resources/img/board_content_img.png"><br>
                                		<u>첨부파일명.jpg</u>
		                            </p>
		                            <textarea id="modify-reply1" class="form-control" style="height: 300px;"></textarea>
		                        </div>
		                        <div class="d-flex justify-content-end container">
		                            <button type="button" class="btn btn-secondary btn-sm" style="margin-top: 10px; margin-right: 20px;" id="modifyBtn1">수정</button>
		                            <button type="button" class="btn btn-secondary btn-sm" style="margin-top: 10px; margin-right: 20px;" id="registBtn1" onclick="confirm('답변을 수정하시겠습니까?')">등록</button>
		                            <button type="button" class="btn btn-secondary btn-sm" style="margin-top: 10px;" id="deleteBtn1" onclick="confirm('답변을 삭제하시겠습니까?')">삭제</button>
		                        </div>
		                    </td>
		                </tr>
		                 <% } %> 
                
                
		                <% } %>
		                <% } %>
               <!--  <tr class="inquiry2">
                    <td>6</td>
                    <td>제목명</td>
                    <td><button type="button" class="btn btn-primary btn-sm disabled">답변완료</button></td>
                    <td>2024-02-05</td>
                </tr> -->
                <tr class="reply2">
                    <td colspan="5" rowspan="1" style="height: 100px;">
                        <div class="container" style="margin-top: 25px;">
                            <p>
                                분명히 회원가입을 했는데 로그인이 되지 않습니다.<br><br>
                                확인 후 답변 부탁드리겠습니다.<br><br>
                                <img src="../ad_resources/img/board_content_img.png"><br>
                                <u>첨부파일명.jpg</u>
                            </p>
                        </div>
                    </td>
                </tr>
                <tr class="reply2">
                    <td colspan="5" rowspan="1" style="height: 100px;">
                        <div class="container">
                            <p style="color: rgb(41, 128, 185); font-weight: bold;">답변</p>
                            <p id="reply-text2">안녕하세요. 문의주신 내용에 대해 답변 드립니다.<br><br>Microsoft Edge 브라우저로 로그인 시 로그인이 안되는 현상이 발생하고 있습니다.<br><br>당분간 Chrome 브라우저로 로그인 부탁드리겠습니다.<br><br>좋은 하루 되세요.</p>
                            <textarea id="modify-reply2" class="form-control" style="height: 300px;"></textarea>
                        </div>
                        <div class="d-flex justify-content-end container">
                            <button type="button" class="btn btn-secondary btn-sm" style="margin-top: 10px; margin-right: 20px;" id="modifyBtn2">수정</button>
                            <button type="button" class="btn btn-secondary btn-sm" style="margin-top: 10px; margin-right: 20px;" id="registBtn2" onclick="confirm('답변을 수정하시겠습니까?')">등록</button>
                            <button type="button" class="btn btn-secondary btn-sm" style="margin-top: 10px;" id="deleteBtn2" onclick="confirm('답변을 삭제하시겠습니까?')">삭제</button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            </div>
            <div class="d-flex justify-content-center container">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
	                <% if(pi.getCurrentPage() == 1){ %>
	                	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                <% } else { %>
	                    <li class="page-item"><a class="page-link" href="<%= contextPath %>/list.iq?page=<%=pi.getCurrentPage() - 1%>">Previous</a></li>
	                <% } %>    
                    <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                    <% if(p == pi.getCurrentPage()){ %>
	                    	<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
	                    <% } else { %>
	                    	<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.iq?page=<%= p %>"><%= p %></a></li>
	                    <% } %>
                    <% } %>
                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    <% } else { %>
                    	<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.iq?page=<%= pi.getCurrentPage() + 1%>">Next</a></li>
                  	<% } %>
                  </ul>
            </nav>
        </div>
    </div>

    <script>
        /* $(function(){
            $('.inquiry1').click(function(){
                const $reply = $('.reply1');

                if($reply.css('display') == 'none'){

                    $reply.slideDown();
                    $('#registBtn1').hide();
                } else {
                    $reply.slideUp();
                }
            });
        });

        $(function(){
            $('.inquiry2').click(function(){
                const $reply = $('.reply2');

                if($reply.css('display') == 'none'){

                    $reply.slideDown();
                    $('#registBtn2').hide();
                } else {
                    $reply.slideUp();
                }
            });
        });
 */
		 $(function(){
			    $('.inquiry3').click(function(){
			        const $writeReply = $(this).next(); // 문의내용
			        const $reply = $(this).next().next(); // 답변내용 또는 답변작성textarea
			        
			        const buttonText = $(this).find('.btn').text().trim(); // 버튼의 텍스트 가져오기
		
			        $writeReply.show();
			        $reply.show();
			        /*
			        if(buttonText === '답변대기') { 
			            $writeReply.slideToggle();
			            $reply.slideUp();
			        } else if(buttonText === '답변완료') { 
			            $reply.slideToggle();
			            $writeReply.slideUp();
			        }
			        */
			    });
			});

       /*  $(function(){
            $('.inquiry4').click(function(){
                const $writeReply = $('.write-reply2');

                if($writeReply.css('display') == 'none'){
                    $writeReply.slideDown();
                } else {
                    $writeReply.slideUp();
                }
            });
        }); */

        $(function(){
            $('#modifyBtn1').click(function(){
                const replyText = $('#reply-text1').html().replace(/<br\s*\/?>/g,"\n");
                $('#reply-text1').hide();
                $('#modify-reply1').show();
                $('#modify-reply1').val(replyText);
                
                $(this).hide();
                $('#registBtn1').show();
                $('#deleteBtn1').hide();
            });
        });

        $(function(){
            $('#modifyBtn2').click(function(){
                const replyText = $('#reply-text2').html().replace(/<br\s*\/?>/g,"\n");
                $('#reply-text2').hide();
                $('#modify-reply2').show();
                $('#modify-reply2').val(replyText);
                
                $(this).hide();
                $('#registBtn2').show();
                $('#deleteBtn2').hide();
            });
        });
    </script>
    	</div>
</body>
</html>