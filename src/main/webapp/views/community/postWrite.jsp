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
        min-height: 500px;
        margin: 50px;
        background-color: rgb(39, 39, 39);
        flex-direction: column;
        padding-top: 30px;
        padding-bottom: 30px;
    }

    .text{
        color: white;
        margin-left: 130px;
        font-size: 20px;
    }
    .back{
        color: rgb(158, 158, 158);
        cursor: pointer;
        margin-left: 800px;
    }
    .table{
        width: 80% !important;
        margin: auto;
        /* 절때 건들이면 안되는 스타일 */
        --bs-table-bg: rgb(39, 39, 39) !important;
        --bs-table-color: white !important;
        border-top: 1px solid white;
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
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>
	
	<!-- 컨텐츠부분 시작 -->
    <section class="content_wrap" style="background: black; min-height: 800px;">
      <div class="background">
          <span class="text">글쓰기</span>
          <!--
          <span class="back" onclick="history.back();">뒤로가기</span>
          -->
          <br><br>

          <form action="<%= contextPath %>/post.bo" method="post" enctype="multipart/form-data">
              <table class="table">
                  <tr>
                      <th width="100px" style="color: white;">카테고리</th>
                      <td>
                          <select name="category" class="form-control">
                              <option value="1">영화</option>
                              <option value="2">잡담</option>
                          </select>
                      </td>
                  </tr>
                  <tr>
                      <th style="color: white;">제목</th>
                      <td><input type="text" class="form-control" required name="title"></td>
                  </tr>
                  <tr>
                      <th style="color: white;">내용</th>
                      <td><textarea cols="130" rows="10" class="form-control-file" style="resize: none;" required name="content"></textarea></td>
                  </tr>
                  <tr>
                      <th style="color: white;">첨부파일</th>
                      <td>
                          <input type="file" class="form-control-file" name="upfile">
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" align="center">
                          <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#myModal">등록하기</button>
                          <button type="reset" class="btn btn-outline-danger btn-sm">초기화</button>
                          <button type="button" class="btn btn-outline-warning btn-sm" onclick="history.back();">뒤로가기</button>
                      </td>
                  </tr>
              </table>
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

      </div> <br><br>
  </section>
  <!-- Section end -->

  <script>
      function community_go(){
          location.href="http://www.naver.com";
      }

      function community_check(){
          location.href="http://www.naver.com";
      }

      function movie_go(){
          location.href="http://www.naver.com";
      }

      function update(){
          location.href="http://www.naver.com";
      }

      function delete1(){
          location.href="http://www.naver.com";
      }
  </script>
  <!--
  삭제하기 버튼 클릭시 /delete.no라는 url로 요청되도록 단,
  삭제할 글 번호를 넘기면서 요청 ( /delete.no?no=번호 )
  
  해당 요청을 받아서 처리해주는 Servlet 클래스를 만들어서 
  넘어온 글 번호를 가지고 해당 공지사항의 글의 status 컬럼값을 'N'으로 변경
  
  성공했을 경우 => 목록페이지 보여지도록 + alert "성공적으로 공지사항 삭제"
  실패했을 경우 =? 에러페이지 보여지도록 + 에러문구 "공지사항 삭제 실패"

  수정하기 버튼 클릭시는 수정할 글 번호를 넘기면서 요청
  -->
    <!-- 컨텐츠부분 종료 -->
	
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>