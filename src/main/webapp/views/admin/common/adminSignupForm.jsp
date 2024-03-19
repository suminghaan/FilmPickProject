<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원가입</title>
<style>
	/* 회원가입페이지에서 추가적으로 작성한 style */
        .signup_content th, .signup_content td{
            vertical-align: middle; /*수직정렬 중 가운데정렬/안먹히는애들도 많음..?*/
        }
        .signup_content input[type=checkbox]{ margin: 10px;}
	
</style>
</head>
<body>

<div class="wrap">
        
        <%@ include file="/views/admin/common/header.jsp" %>

        <!-- Section start -->
        <section class="main_content">

            <div class="signup_content">
                <h2>회원가입</h2>
                <br><br>

                <form action="<%=contextPath %>/insert.ad" method="post">
                    <table class="table">
                        <!-- (tr>th+td*2)*9 -->
                        <tr>
                            <th>* 아이디</th>
                            <td><input type="text" class="form-control" placeholder="Enter ID" required name="adminId"></td>
                            <td><button type="button" class="btn btn-secondary btn-sm" onclick="idCheck()">중복확인</button></td>
                        </tr>
                        <tr>
                            <th>* 비밀번호</th>
                            <td><input type="password" class="form-control" placeholder="Enter Password" required name="adminPwd"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>* 비밀번호 확인</th>
                            <td><input type="password" class="form-control" placeholder="Enter Password Check" required></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>* 이름</th>
                            <td><input type="text" class="form-control" placeholder="Enter Name" required name="adminName"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>&nbsp;&nbsp;전화번호</th>
                            <td><input type="text" class="form-control" placeholder="Enter Phone Number(- include)" name="adminphone"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th colspan="3" style="text-align: center; padding-top: 20px;">
                                <button type="submit" class="btn btn-outline-primary" disabled>회원가입</button>
                                <button type="reset" class="btn btn-outline-warning">초기화</button>
                            </th>
                        </tr>
                    </table>
                </form>
                
                <script>
                	// 중복확인 버튼 클릭시 호출되는 함수 
                	function idCheck(){
                		// 사용자가 입력한 아이디값을 넘기면서 조회요청(존재하는지 안하는지) => 응답데이터 돌려받기
                		
                		
                		// 아이디 입력하는 input요소객체 
                		const $idInput = $(".signup_content input[name=adminId]")
                	
                		$.ajax({
                			url:"<%=contextPath%>/idCheck.ad",
                			data: {checkId:$idInput.val()},
                			success: function(result){
                				// 1) 사용불가능(NNNNN)일 경우 => alert로 메세지 출력, 다시 입력할 수 있도록 유도
                        		// 2) 사용 가능(NNNNY)일 경우 => 진짜 사용할건지 재차 물어보기 (confirm메소드)
                        								// > yes => 더이상 아이디 수정 못하게끔, 회원가입버튼 활성화
                        								// >  no => 다시 입력할 수 있도록 유도
                				if(result == "NNNNN"){
                					alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
                					$idInput.focus();
                				}else{
                					if(confirm("사용가능한 아이디입니다. 사용하시겠습니까? ")){
                						// 회원가입버튼 활성화
                						$(".signup_content :submit").removeAttr("disabled")
                						// 아이디입력하는 input요소 수정불가능한 속성 추가
                						$idInput.attr("readonly", true);
                						
                					}else{
                						// 아이디입력하는 input요소 focus
                						$idInput.select();
                					}
                				}
                			
                			},
                			error: function(){
                				console.log("아이디 중복체크용 ajax 통신 실패");
                			}
                				
                		});
                	
                	}
                </script>

            </div>


        </section>
        <!-- Section end -->

    </div>

</body>
</html>