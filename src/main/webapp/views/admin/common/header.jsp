<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.fp.admin.model.vo.Admin" %>
    
<%
	String contextPath = request.getContextPath();

	Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");

	String alertMsg = (String) session.getAttribute("alertMsg");

%>
<!DOCTYPE html>
<html>
<head>

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    

<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Page</title>
    

    <!-- Custom fonts for this template-->
    <link href="<%=contextPath%>/views/admin/ad_resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%=contextPath%>/views/admin/ad_resources/css/sb-admin-2.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>header</title>
<style>
#accordionSidebar {
background-color: black!important;
} 

#navbar{
    background-color: black!important;
}
.nav-link {
    display: flex;
    align-items: center; /* 수직 가운데 정렬 */
}

.nav-link img {
    margin-right: 5px; /* 이미지와 텍스트 사이 간격 조정 */
}

.nav-link div {
    margin: 0 auto; /* 수평 가운데 정렬 */
    display: inline-block;
}

#content{
	background-color: white!important;
}

#text-admin{ font-size: 100px; font-weight: bold; color: black;}
#text-welcome { font-size: 60px; }

.align-center{ /* 중앙 정렬 */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* 화면 전체 높이를 차지하도록 설정 */
}

.container-fluid, .table{
	color: black!important;
}
</style>
</head>
<body>
	<% if(alertMsg != null){ // alert 시킬만한 알람문구가 존재할 경우 %>
		<script>
			alert('<%= alertMsg %>'); 
		</script>
	<% 
			session.removeAttribute("alertMsg"); 
		} 
	%>
	<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-info-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=contextPath%>/main.ad">
                <div class="sidebar-brand-text mx-3">FILM PICK ADMIN</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            
            <!-- Divider -->
            <hr class="sidebar-divider">
            
            <% if(loginAdmin == null) { %>
			<!-- case1. 로그인 전  -->
			<!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <span>회원관리</span>
                </a>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>영화관리</span>
                </a>
            </li>

           <!-- Nav Item - Pages Collapse Menu -->
           <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                aria-expanded="true" aria-controls="collapsePages">
                <span>커뮤니티</span>
            </a>
        </li>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
                aria-expanded="true" aria-controls="collapseThree">
                <span>고객센터</span>
            </a>           
        </li>

		
            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" id="navbar">

                    
                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars">FILM PICK ADMIN</i>
                    </button>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div>
                                <img class="img-profile rounded-circle"
                                    src="<%=contextPath%>/views/admin/ad_resources/img/icon_person_white.svg">
                                </div><br><br>
                                    <div>관리자</div>
                            </a>
                            
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown" style="width:300px">
                                <form action="<%=contextPath %>/login.ad" method="post">
			                        <table>
			                            <tr>
			                                <th>아이디</th>
			                                <td><input class="form-control" type="text" placeholder="Enter Your ID" name="adminId" required></td>
			                            </tr>
			                            <tr>
			                                <th>비밀번호</th>
			                                <td><input class="form-control" type="password" placeholder="Enter Your Password" name="adminPwd" required></td>
			                            </tr>
			                            <tr>
			                                <td colspan="2" style="text-align: center; padding-top: 10px;" >
			                                    <button type="submit" class="btn-secondary btn-sm">로그인</button>
			                                    <button type="button" class="btn-secondary btn-sm" id="signup_btn">회원가입</button>
			                                </td>
			                            </tr>
			                        </table>
			                        
			                    </form>
			                    <script>
			                    	$(function(){
			                    		$("#signup_btn").click(function(){
											console.log("선택되는지");
			                    			location.href = "<%=contextPath%>/adminSignupForm.ad";
			                    		})
			                    	})
			                    </script>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->
			
			
			<% }else { %>
			<!-- case2. 로그인 후  -->
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <span>회원관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<%=contextPath%>/selectlist.me?page=1">회원조회</a>
                        <a class="collapse-item" href="<%=contextPath%>/cclist.me?page=1">탈퇴회원조회</a>
                        <a class="collapse-item" href="<%=contextPath%>/rplist.me?page=1">신고회원관리</a>
                        <a class="collapse-item" href="<%=contextPath%>/rslist.me?page=1">이용제한회원조회</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>영화관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="../ad_movie/movieEnrollForm.jsp">신규영화 등록</a>
                        <a class="collapse-item" href="<%=contextPath%>/list.admo?page=1">등록된영화 조회</a>
                        <a class="collapse-item" href="<%=contextPath%>/movieCategoryForm.admo">영화 카테고리 관리</a>
                        <a class="collapse-item" href="../ad_movie/movieSelect.jsp">메인페이지 노출영화 선택</a>
                        <a class="collapse-item" href="<%=contextPath%>/movieCastingList.admo?page=1">인물관리</a>
                    </div>
                </div>
            </li>

           <!-- Nav Item - Pages Collapse Menu -->
           <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                aria-expanded="true" aria-controls="collapsePages">
                <span>커뮤니티</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="<%=contextPath%>/list.co?page=1">공지사항</a>
                    <a class="collapse-item" href="<%=contextPath%>/blindList.co?page=1">블라인드 게시글 관리</a>
                    <a class="collapse-item" href="<%=contextPath%>/reportBoardList.co?page=1">신고된 게시글 관리</a>
                    <a class="collapse-item" href="<%=contextPath%>/reportCommentList.co?page=1">신고된 댓글 관리</a>
                    <div class="collapse-divider"></div>
                </div>
            </div>
        </li>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
                aria-expanded="true" aria-controls="collapseThree">
                <span>고객센터</span>
            </a>
            <div id="collapseThree" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="../ad_customer_center/inquiryList.jsp">1대1문의 확인</a>
                    <a class="collapse-item" href="<%=contextPath%>/list.nm?page=1">없는 영화 신청 확인</a>
                    <div class="collapse-divider"></div>
                </div>
            </div>
        </li>

		
            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" id="navbar">

                    
                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars">FILM PICK ADMIN</i>
                    </button>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div>
                                <img class="img-profile rounded-circle"
                                    src="<%=contextPath%>/views/admin/ad_resources/img/icon_person_white.svg">
                                </div><br><br>
                                    <div>관리자</div>
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" data-toggle="modal" data-target="#logoutModal" href="#">
                                    로그아웃
                                </a>
                                <a class="dropdown-item" href="<%=contextPath%>">
                                    홈페이지
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->
                <% } %> 
                
                <!-- Begin Page Content -->
                <div class="container-fluid">

                </div>
                <!-- /.container-fluid -->
                
                <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃을 하시겠습니까??</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃을 누르시면 처음화면으로 돌아갑니다.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="<%=contextPath%>/logout.ad">Logout</a>
                </div>
            </div>
        </div>
    </div>
    

    <!-- Bootstrap core JavaScript-->
    <script src="<%=contextPath%>/views/admin/ad_resources/vendor/jquery/jquery.min.js"></script>
    <script src="<%=contextPath%>/views/admin/ad_resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%=contextPath%>/views/admin/ad_resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%=contextPath%>/views/admin/ad_resources/js/sb-admin-2.min.js"></script>

    

    <!-- Page level custom scripts -->
    <script src="<%=contextPath%>/views/admin/ad_resources/js/demo/chart-area-demo.js"></script>
    <script src="<%=contextPath%>/views/admin/ad_resources/js/demo/chart-pie-demo.js"></script>
                
</body>
</html>