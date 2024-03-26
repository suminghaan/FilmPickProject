<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.signup_content{
		background-color: white;
		color: black;
		width: 600px;
		height: 500px;
		border-radius: 0.7em;
		margin: auto;
	}
	
	#checkAll{
		margin-top: 20px;
		margin-left: 30px;
	}
	
	#termsOfUse, #privacyPolicy{
    	margin-top: 5px;
    	margin-left: 30px;
	}

    .buttonArea button: disabled {
		color: blue;
    }
    
    #signupCheckFormSubmit{
    	margin: auto;
		display: block;
    }
</style>
</head>
<body>

	<main>
  
	<%@ include file="/views/common/header.jsp" %>

	<div class="content_wrap" style="margin-top: 100px;">
		<div class="content">
			<div class="signup_content" id="signup_content">
			<div>
			<div class="termCheckAll">
				<input type='checkbox' class='checkAll' name='checkAll' id="checkAll" value='checkAll'onclick='selectAll(this)'> <b>전체 동의하기</b>
			</div>
			<hr>
			<div class="inputCheck">
			<input type='checkbox' class='agreement' name='agreement' id='termsOfUse' value='termsOfUse'> [필수] FILM PICK 이용약관
			<textarea name="termsOfUse" id="termsOfUse" cols="70" rows="5" style="background-color:transparent; color: black; width:540px">
환영합니다!
필름픽 서비스 및 제품(이하 '서비스')를 이용해 주셔서 감사합니다. 본 약관은 다양한 필름픽의 이용과 관련하여 필름픽 서비스를 제공하는 필름픽과 이를 이용하는 필름픽 서비스 회원(이하 '회원') 또는 비회원과의 관계를 설명하며, 아울러 여러분
환영합니다!
필름픽 서비스 및 제품(이하 '서비스')를 이용해 주셔서 감사합니다. 본 약관은 다양한 필름픽의 이용과 관련하여 필름픽 서비스를 제공하는 필름픽과 이를 이용하는 필름픽 서비스 회원(이하 '회원') 또는 비회원과의 관계를 설명하며, 아울러 여러분
환영합니다!
필름픽 서비스 및 제품(이하 '서비스')를 이용해 주셔서 감사합니다. 본 약관은 다양한 필름픽의 이용과 관련하여 필름픽 서비스를 제공하는 필름픽과 이를 이용하는 필름픽 서비스 회원(이하 '회원') 또는 비회원과의 관계를 설명하며, 아울러 여러분
			</textarea>
			</div>
			<br>
			<div class="inputCheck">
			<input type='checkbox' class='agreement' name='agreement' id='privacyPolicy' value='privacyPolicy'> [필수] 개인정보 수집 및 이용 동의
			<textarea name="privacyPolicy" id="privacyPolicy" cols="70" rows="5" style="background-color:transparent; color: black; width:540px">
개인정보보호법에 따라 필름픽에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
1. 수집하는 개인정보
개인정보보호법에 따라 필름픽에 회원가입 신청하시는 분꼐 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
1. 수집하는 개인정보
개인정보보호법에 따라 필름픽에 회원가입 신청하시는 분꼐 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
1. 수집하는 개인정보
개인정보보호법에 따라 필름픽에 회원가입 신청하시는 분꼐 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
1. 수집하는 개인정보
			</textarea>
			</div>
			<br>
			</div>
			<div class="buttonArea">
			<form action="">
			<button type="button" class="btn btn-outline-light" id="signupCheckFormSubmit" onclick="location.href='<%=contextPath%>/insert.me'" disabled
					style="width: 300px;
						 --bs-btn-border-color: RGB(247, 39, 140);
						 --bs-btn-color:RGB(247, 39, 140);
						 --bs-btn-hover-color: #ffffff;
						 --bs-btn-hover-bg: RGB(247, 39, 140);
						 --bs-btn-hover-border-color: #ffffff;
						 
						 --bs-btn-disabled-color: RGB(247, 39, 140);
						 --bs-btn-disabled-bg: #ffffff;
						 --bs-btn-disabled-border-color: RGB(247, 39, 140);">확인</button>
			</form>
			</div>
		</div>
   
		<script>
		$(document).ready(function(){

			// 전체 동의하기 체크박스 클릭 시, 나머지 체크박스도 선택되게 
			$("#checkAll").click(function(){
			var checkAll=$("#checkAll").prop("checked");

				if(checkAll){
					$(".agreement").prop("checked",true);
			        $(".buttonArea button").css({"backgroundColor":"RGB(247, 39, 140)", "border-color": "RGB(247, 39, 140)","color":"RGB(247, 39, 140)",
			        	"hover-color": "#ffffff","hover-bg": "RGB(247, 39, 140)","hover-border-color": "#ffffff","cursor":"pointer","color":"#fff"}).prop("disabled",false);
			    }
			    else{
			        $(".agreement").prop("checked",false);
			        $(".buttonArea button").css({"backgroundColor":"#ffffff", "border-color": "RGB(247, 39, 140)", "cursor":"auto","color":"#303033"}).prop("disabled",true);
			    	$(".buttonArea button").css("color", "RGB(247, 39, 140)");
			    }
			});

			// 모든 체크박스를 클릭하면 버튼 활성화
			$('.agreement').click(function(){
			    var tmpp = $(this).prop('checked'); 
			    //자식 체크박스 전체 체크시, 부모 체크박스 체크 됨
			    var agreement = $(".agreement").length;
			    var checkedAgreement = $(".agreement:checked").length;
			    
			  // 선택한 체크박스 값이 true 이거나 체크박스 2개 체크시 버튼 활성화
			    if(tmpp==true && checkedAgreement == 2){
			    	$(".buttonArea button").css({"backgroundColor":"RGB(247, 39, 140)", "border-color": "RGB(247, 39, 140)","color":"RGB(247, 39, 140)",
		        		"hover-color": "#ffffff","hover-bg": "RGB(247, 39, 140)","hover-border-color": "#ffffff","cursor":"pointer","color":"#fff"}).prop("disabled",false);
			    }
			    else{
				    $(".buttonArea button").css({"backgroundColor":"#ffffff", "border-color": "RGB(247, 39, 140)", "cursor":"auto","color":"#303033"}).prop("disabled",true);
				    $(".buttonArea button").css("color", "RGB(247, 39, 140)");
			    }
			    
			    
			    // 체크박스가 모두 선택되었을 때 상위 체크박스 선택되도록 설정
			    if(agreement == checkedAgreement){
			    	$("#checkAll").prop("checked",true);
			    }else{
			    	$("#checkAll").prop("checked",false);
			    }
			    
				});
			  
			  
			});
		</script>

		</div>
	</div> 

    
	<%@ include file="/views/common/footer.jsp" %>

	</main>
	<script src="../../resources/assets/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>