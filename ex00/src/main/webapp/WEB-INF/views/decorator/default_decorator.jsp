<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : 함수진 -->
<!-- 작성일 : 2024-06-28 -->
<!-- 최종수정일 : 2024-07-19 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator"
   uri="http://www.opensymphony.com/sitemesh/decorator"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- Font Awesome CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- JQuery UI - datepicker -->
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>

<!-- 개발자가 작성한 title을 가져다가 사용 -->
<title>BGS<decorator:title /></title>

<style>
/* 구글 폰트 */
@import
   url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&display=swap')
   ;

@import
   url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&family=Jua&display=swap')
   ;

@font-face {
   font-family: 'goorm-sans-code';
   src:
      url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/goorm-sans-code.woff2')
      format('woff2');
   font-weight: normal;
   font-style: normal;
}

* {
   box-sizing: border-box;
}

body {
   margin: 0;
   font-family: 'goorm-sans-code', Arial, Helvetica, sans-serif;
}

/* Style the top navbar */
.navbar-custom {
   border-bottom: 1px solid #e6e6e6;
   background-color: #fff;
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   z-index: 1;
}

.navbar-custom .navbar-brand img {
   width: 160px;
   height: 45px;
}

/* Style the side navigation */
.sidenav {
   height: calc(100% - 56px); /* Adjust height based on navbar height */
   width: 230px;
   position: fixed;
   top: 56px; /* Offset from navbar height */
   left: 0;
   background-color: #ff9933;
   overflow-x: hidden;
   padding-top: 20px;
}

/* Side navigation links */
.sidenav a {
   color: black;
   padding: 16px;
   text-decoration: none;
   display: block;
}

/* Change color on hover */
.sidenav a:hover {
   opacity: 30%;
   background-color: #fff;
   color: black;
}

.sidenav a {
   color: white;
}

/* Style the content */
.content {
   margin-left: 200px;
   padding: 80px 20px 20px;
   /* Adjust padding for content below navbar and sidenav */
}

.footer {
   text-align: center;
   padding: 10px;
   background-color: #f1f1f1;
   border-top: 1px solid #ddd;
}

.modal-header img {
   width: 160px;
   height: 45px;
}

.sidenav>.fa {
   color: white;
   text-shadow: 0px 1px 0px #666666;
}

.hr-text {
   position: relative;
   border: none;
   height: 1px;
   background: #bfbfbf;
}

.hr-text::before {
   content: attr(data-content);
   position: absolute;
   top: -10px;
   left: 50%;
   transform: translateX(-50%);
   background-color: #fff;
   padding: 0 10px;
   color: #a6a6a6;
   font-weight: bold;
}
/* 상단 네비게이션 바 스타일 */
.navbar-custom {
   border-bottom: 1px solid #e6e6e6;
   background-color: #fff;
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   z-index: 1;
}

/* 네비게이션 바 브랜드 이미지 정렬 */
.navbar-custom .navbar-brand {
   margin-top: -10px; /* 상단 여백 조정 */
}

/* 네비게이션 바 브랜드 이미지 크기 조정 */
.navbar-custom .navbar-brand img {
   width: 160px;
   height: 45px;
}

/* 네비게이션 바 링크와 버튼 정렬 */
.navbar-custom .navbar-nav {
   flex-direction: row;
   align-items: center;
}

.navbar-custom .navbar-nav .btn {
   margin-left: 10px; /* 버튼 간격 추가 */
}

/* 네비게이션 바 토글 버튼 위치 조정 */
.navbar-toggler {
   border: none;
}

/* 사이드 네비게이션 */
.sidenav {
   height: calc(100% - 56px); /* Adjust height based on navbar height */
   width: 230px;
   position: fixed;
   top: 56px; /* Offset from navbar height */
   left: 0;
   background-color: #ff9933;
   overflow-x: hidden;
   padding-top: 20px;
}

/* 사이드 네비게이션 링크 스타일 */
.sidenav a {
   color: white;
   padding: 16px;
   text-decoration: none;
   display: block;
}

/* 사이드 네비게이션 링크 hover 스타일 */
.sidenav a:hover {
   opacity: 0.7;
   background-color: #fff;
   color: black;
}

/* 사이드 메뉴바가 숨겨질 때의 스타일 */
.sidenav.d-none {
   display: none;
}

/* 사이드 메뉴바가 열리면 컨텐츠의 왼쪽 여백 조정 */
.content.expanded {
   margin-left: 0;
}
/* 버튼 스타일을 일정하게 맞추기 위한 CSS 추가 */
.btn-custom {
   width: 120px; /* 원하는 너비 지정 */
   height: 45px; /* 원하는 높이 지정 */
   display: flex;
   align-items: center;
   justify-content: center;
   padding: 0; /* 버튼 내부 여백 제거 */
   font-size: 16px; /* 텍스트 크기 조정 */
}

.btn-custom i {
   margin-right: 8px; /* 아이콘과 텍스트 사이의 간격 조정 */
}

/* datepicker UI */
.ui-datepicker-inline {
	width:90%;
	height:400px;
	margin: 0 auto;
	border-radius:10px;
	border:2px solid rgba(255, 255, 255, 0) !important;
	background-color: rgba(255, 255, 255, 0) !important;
}
.ui-datepicker-title {
	margin: 0 auto;
	height: 50px;
	
}
.ui-datepicker-header {
	background-color:#FFE3CD;
	border-radius:10px;
	padding:3px;
	height:60px;
	margin-bottom:5px;
}

.ui-icon-circle-triangle-e {
	color: #e0e0e0;
}
.ui-datepicker-month {
	height: 80%;
	text-align:center;
	font-weight:bold;
	border-radius:10px;
}
.ui-datepicker-year {
	height: 80%;
	text-align:center;
	font-weight:bold;
	border-radius:10px;
}
th {
	background-color:#FF9C2A;
	margin-left:2px;
	margin-right:2px;
	color:#ffffff;
	width:30px;
	font-weight:bold;

}
table {
	border-radius: 10px;
}
th.ui-datepicker-week-end {
	background-color:#FF7145;
}
td.ui-datepicker-week-end {
	background-color:#FFF7DF;
}
td {
	height:57px;
	font-weight:bold;
}
.ui-state-default {
	height:90%;
	width:90%;
	border-radius:5px;
	border:2px solid rgba(255, 255, 255, 0) !important;
	background-color: rgba(255, 255, 255, 0) !important;
}
.ui-state-hover {
	background-color: #FFC720 !important;
}
.ui-state-active {
	background-color: #FF9C2A !important;
	color: #444;
}
.ui-state-default, 
.ui-widget-content .ui-state-default, 
.ui-widget-header .ui-state-default, 
.ui-button, 
html .ui-button.ui-state-disabled:hover, 
html .ui-button.ui-state-disabled:active {
	text-align: center;
	font-weight:bold;
}

.flex-container {
  display: flex;
  align-items: center;  /* 수직 정렬 */
  justify-content: space-between;  /* 수평으로 공간 분배 */
  width: 100%;
}
</style>

<script type="text/javascript">
   $(function() {
      // 취소 버튼 이벤트
      $(".cancelBtn").click(function() {
         history.back();
      });
      // datepicker 설정
	   // Datepicker를 초기화
	      $('.datepicker').datepicker({
	      	// 입력란의 데이터 포맷 
	  		dateFormat: "yy-mm-dd",
	  		// 월 선택 입력 추가
	  		changeMonth: true,
	  		// 년 선택 입력 추가
	  		changeYear: true,
	  		// 월 선택할 때의 이름 - 원래는 영어가 기본
	  		monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
	  		// 달력의 요일 표시
	  		dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
	  		// 오늘까지만의 날짜를 선택 가능
      });
      
   });
</script>

<script type="text/javascript">
   $(document).ready(function() {
      $("#loginButton").click(function() {
         $("#loginModal").modal("show");
      });
   });
</script>
<script type="text/javascript">
   $(document).ready(function() {
      $("#sideNavToggle").click(function() {
         $(".sidenav").toggleClass("d-none");
         $(".content").toggleClass("expanded");
      });
   });
</script>
<decorator:head />
</head>

<body>
   <!-- 사이드 메뉴바 토글 버튼 -->
   <button id="sideNavToggle" class="btn btn-light"
      style="position: fixed; top: 10px; left: 10px; z-index: 2; padding: 10 10px;">
      <i class="fa fa-bars"></i>
   </button>
   <!-- Top Navigation Bar -->
   <nav class="navbar navbar-expand-lg navbar-custom">
      <a class="navbar-brand" href="/main/main.do"> <img
         src="/uploads/logo2.png" alt="Logo" style="margin-left: 45px;">
      </a>
   </nav>
   <!-- Side Navigation -->
   <div class="sidenav">
      <a href="/board/list.do"> <i class="fa fa-pencil"
         style="margin-left: 5px; margin-right: 8px;"></i> 여행일기
      </a> <a href="/notice/list.do"> <i class="fa fa-building"
         aria-hidden="true" style="margin-left: 5px; margin-right: 8px;"></i>
         호텔
      </a> <a href="/air/main.do"> <i class="fa fa-plane"
         style="margin-left: 5px; margin-right: 8px;"></i> 항공권
      </a> <a href="/category/list.do"> <i class="fa fa-star"
         aria-hidden="true" style="margin-left: 5px; margin-right: 8px;"></i>
         즐길거리
      </a>
      <a href="/goods/list.do"> <i class="fa fa-shopping-bag"
         aria-hidden="true" style="margin-left: 5px; margin-right: 8px;"></i>
         쇼핑몰
      </a>
      <hr>
      <c:if
         test="${!empty login && (login.gradeNo == 1 || login.gradeNo == 9 || login.gradeNo == 5)}">
         <a href="/member/list.do"> <i class="fa fa-th-list"
            style="margin-left: 5px; margin-right: 5px;"></i> 예약내역
         </a>
      </c:if>
      <c:if test="${!empty login && login.gradeNo == 9}">
         <a href="/member/list.do"> <i class="fa fa-users"
            aria-hidden="true" style="margin-left: 5px; margin-right: 5px;"></i>
            회원관리
         </a>
      </c:if>
      <a href="/board/list.do"> <i class="fa fa-question-circle-o"
         style="margin-left: 8px; margin-right: 5px;"></i> 고객센터
      </a>
      <hr>
      <ul class="navbar-nav">
         <c:if test="${empty login}">
            <li class="nav-item">
               <button type="button" class="btn btn-outline-light btn-custom"
                  id="loginButton" style="margin-right: 20px; margin-left: 50px;">
                  <i class="fa fa-user-circle-o"></i> 로그인
               </button>
            </li>
         </c:if>
         <c:if test="${!empty login}">
            <li class="nav-item">
               <button type="button" class="btn btn-outline-light btn-custom"
                  id="logoutButton" style="margin-right: 20px; margin-left: 50px;"
                  onclick="window.location.href='/member/logout.do'">
                  <i class="fa fa-user-circle-o"></i> 로그아웃
               </button>
            </li>
         </c:if>
      </ul>
   </div>



   <!-- Page Content -->
   <div class="content">
      <main>
         <decorator:body />
      </main>

      <footer class="footer">
         <p>&copy; 2024 BANGKOK. All rights reserved.</p>
      </footer>

      <!-- 처리 결과 모달창 -->
      <div class="modal" id="msgModal">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h4 class="modal-title">처리 결과</h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">${msg }</div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
               </div>
            </div>
         </div>
      </div>

      <!-- 로그인 모달창 -->
      <div class="modal fade" id="loginModal">
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
               <!-- 모달 헤더 -->
               <div class="modal-header">
                  <img src="/uploads/logo2.PNG" alt="Logo"
                     style="width: 160px; height: 45px;">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>

               <!-- 모달 바디: 초기 화면 -->
               <div class="modal-body" id="initialModalBody">
                  <img src="/uploads/login2.png" alt="login"
                     class="mx-auto d-block rounded"
                     style="width: 450px; height: 250px; margin-bottom: 15px;">
                  <h5
                     style="font-family: 'goorm-sans-code'; font-weight: bold; margin-left: 10px">로그인
                     또는 회원가입</h5>
                  <pre style="font-family: 'goorm-sans-code'; margin-left: 10px">
BANGKOK에 로그인하면, 회원 전용 시크릿 특가를 확인하고
여행 계획을 편리하게 관리할 수 있습니다.
                </pre>
                  <br>
                  <div class="text-center">
                     <button type="button" class="btn btn-outline-dark"
                        id="proceedWithEmail">
                        <i class="material-icons" style="font-size: 20px">email</i> 이메일로
                        진행하기
                     </button>
                  </div>
                  <br>
                  <div class="text-center my-3">
                     <hr class="hr-text" data-content="또는">
                  </div>
               </div>

               <!-- 모달 바디: 로그인 화면 (숨김 처리) -->
               <div class="modal-body d-none" id="loginModalBody">
                  <h3
                     style="font-family: 'goorm-sans-code'; font-weight: bold; display: flex; align-items: center; justify-content: center; position: relative;">
                     <i class="material-icons" id="backToInitial"
                        style="cursor: pointer; position: absolute; left: 0;">arrow_back</i>
                     LOGIN
                  </h3>
                  <form action="/member/login.do" method="post">
                     <div class="form-group">
                        <label for="id">ID:</label> <input type="text"
                           class="form-control" placeholder="ex) loginId@domain.com"
                           id="id" name="id" autocomplete="off" required>
                     </div>
                     <div class="form-group">
                        <label for="pw">Password:</label> <input type="password"
                           class="form-control" placeholder="Password 입력" id="pw"
                           name="pw" required>
                     </div>
                     <button type="submit" class="btn btn-outline-dark btn-block mb-2">로그인</button>
                  </form>
                  <form action="/member/joinForm.do" method="get">
                     <button type="submit" class="btn btn-outline-dark btn-block">회원가입</button>
                  </form>
               </div>


               <!-- 모달 푸터 -->
               <div class="modal-footer text-center">
                  <pre
                     style="font-family: 'goorm-sans-code'; margin-left: 10px; font-size: small;">
가입과 동시에 이용 약관 및 개인 정보 보호 정책에 동의하시게 됩니다.
                </pre>
               </div>
            </div>
         </div>
      </div>

      <script>
         // 이메일로 진행하기 버튼 클릭 시
         $('#proceedWithEmail').click(function() {
            // 초기 화면 숨기기
            $('#initialModalBody').addClass('d-none');
            // 로그인 화면 보이기
            $('#loginModalBody').removeClass('d-none');
         });

         // 뒤로가기 버튼 클릭 시 초기 화면으로 돌아가기
         $('#backToInitial').click(function() {
            // 로그인 화면 숨기기
            $('#loginModalBody').addClass('d-none');
            // 초기 화면 보이기
            $('#initialModalBody').removeClass('d-none');
         });
      </script>

      <c:if test="${ !empty msg }">
         <!-- 모달창 이벤트 -->
         <script type="text/javascript">
            $(function() {
               $("#msgModal").modal("show");
            });
         </script>
      </c:if>
   </div>
</body>
</html>
