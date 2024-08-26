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
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
   src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 개발자가 작성한 title을 가져다가 사용 -->
<title>BGS<decorator:title /></title>
<!-- 아이콘 라이브러리(부트스트랩) -->
<style type="text/css">
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

.dm-sans-navbar-nav {
   font-family: "DM Sans", sans-serif;
   font-optical-sizing: auto;
   font-weight: <weight>;
   font-style: normal;
}

.navbar-custom {
   border-bottom: 1px solid #e6e6e6; /* 하단에 솔리드 선 추가 */
}

.navbar {
   margin-bottom: 0;
   border-radius: 0;
   height: 60px;
}

article {
   min-height: 975px;
   margin-top: 60px;
}

.nav-item {
   margin: 0 10px;
   font-family: 'goorm-sans-code';
}

.container {
   text-align: left;
   padding: 30px 0;
}

.bg-custom {
   background-color: #fff;
}

.nav-link {
   color: #444 !important;
   font-weight: bold;
}

.dropdown-menu-right {
   right: 0;
   left: auto;
}

.dropdown {
   margin-left: 50px;
}

#scrollTopBtn {
   display: none;
   position: fixed;
   bottom: 20px;
   right: 20px;
   z-index: 99;
   background-color: #007bff;
   color: white;
   border: none;
   border-radius: 50%;
   width: 50px;
   height: 50px;
   cursor: pointer;
}

.jua-regular {
   font-family: "Jua", sans-serif;
   font-weight: 400;
   font-style: normal;
}

.text-shadow {
   color: #66c2ff; /* 텍스트 색상 */
   text-shadow: -1px -1px 0 #e6f5ff, 1px -1px 0 #e6f5ff, -2px 2px 0 #e6f5ff,
      1px 1px 0 #e6f5ff; /* 윤곽선 색상 및 두께 */
}

.btn:focus {
   outline: none;
   box-shadow: none;
}
/* 햄버거 메뉴가 펼쳐졌을 때 배경색 설정 */
.navbar-collapse {
   background-color: white; /* 배경색을 하얀색으로 설정 */
}
/* 모달의 헤더와 본문 사이의 구분선 제거 */
.modal-header, .modal-footer {
   border: none; /* 기본 구분선 제거 */
}

/* 모달의 바닥글과 본문 사이의 여백 제거 */
.modal-footer {
   margin-top: 0; /* 기본 여백 제거 */
}

/* 모달의 상단, 하단 여백 추가 (선택 사항) */
.modal-content {
   margin: 0; /* 기본 여백 제거 */
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
</style>
<script type="text/javascript">
   $(function() {
      // 취소 버튼 이벤트
      $(".cancelBtn").click(function() {
         history.back();
      });
   });
</script>
<script>
   // TOP 버튼 이벤트
   document.addEventListener('DOMContentLoaded', function() {
      var scrollTopBtn = document.getElementById("scrollTopBtn");

      window.addEventListener('scroll', function() {
         var scrollPosition = window.scrollY
               || document.documentElement.scrollTop;

         if (scrollPosition > 20) {
            scrollTopBtn.style.display = "block";
         } else {
            scrollTopBtn.style.display = "none";
         }
      });
      // TOP 버튼 이벤트 스크롤 상세 설정
      scrollTopBtn.addEventListener("click", function() {
         window.scrollTo({
            top : 0,
            behavior : "smooth"
         });
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

<decorator:head />

</head>
<body>
   <header>
      <!-- TOP 버튼 -->
      <button id="scrollTopBtn" title="Go to top">Top</button>
      <!-- 네비게이션 메뉴바 (로고 이미지)-->
      <nav class="navbar navbar-expand-lg bg-custom fixed-top navbar-custom">
         <a class="navbar-brand" href="/main/main.do"> <img src="/uploads/logo2.png"
            alt="Logo" style="width: 160px; height: 45px; margin-left: 10px;">
         </a>
         <!-- 모바일 화면시 보이는 햄버거 버튼 -->
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="fa fa-align-justify" style="color: orange"></span>
         </button>
         <!-- 네비게이션 메뉴바 -->
         <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
               <li class="nav-item ${( module == '/Board')?'active':'' }"><a
                  class="nav-link" href="/board/list.do"><i class="fa fa-pencil"
                     style="width: 20px; height: 20px;"></i>여행일기</a></li>
               <li class="nav-item ${( module == '/album')?'active':'' }"><a
                  class="nav-link" href="/notice/list.do"><img
                     src="/uploads/free-icon-double-bed.png"
                     style="width: 20px; height: 20px;"> 호텔</a></li>
               <li class="nav-item ${( module == '/air')?'active':'' }"><a
                  class="nav-link" href="/air/main.do"><i
                     class="fa fa-plane" style="width: 24px; height: 24px;"></i>항공권</a></li>
               <li class="nav-item ${( module == '/air')?'active':'' }"><a
                  class="nav-link" href="/music/topList.do"><img
                     src="/uploads/free-icon-ferris-wheel.png"
                     style="width: 20px; height: 20px;"> 즐길거리</a></li>
               <c:if test="${!empty login && login.gradeNo == 9 }">
                  <li class="nav-item ${( module == '/member')?'active':'' }"><a
                     class="nav-link" href="/member/list.do">MEMBER</a></li>
                  <li class="nav-item ${( module == '/pay')?'active':'' }"><a
                     class="nav-link" href="/pay/adminList.do">PAY</a></li>
               </c:if>
            </ul>

            <!-- 회원 관리 일반 버튼 형식 메뉴 -->
            <c:if test="${ empty login }">
            <a href="/member/loginForm.do">
            <button type="button" class="btn btn-outline-dark" id="loginButton">
               <i class="fa fa-user-circle-o" style="width: 18px; height: 18px;"></i>
               로그인
            </button>
            </a>
            </c:if>
            <c:if test="${ !empty login }">
            <a href="/member/logout.do">
            <button type="button" class="btn btn-outline-dark" id="loginButton">
               <i class="fa fa-user-circle-o" style="width: 18px; height: 18px;"></i>
               로그아웃
            </button>
            </a>
            </c:if>
         </div>
      </nav>
   </header>

   <article>
      <decorator:body />
   </article>
   <footer class="container-fluid text-center py-3">
      <hr class="my-2" style="border-color: #ddd;">
      <p class="mb-0" style="color: #444;">&copy; 2024 BANGKOK. All
         rights reserved.</p>
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

            <div class="modal-header">
               <img src="/uploads/logo2.PNG" alt="Logo"
                  style="width: 160px; height: 45px;">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
               <!-- 이미지 출처 -->
               <!--             <a href="https://kr.freepik.com/free-photo/locked-padlock-security-protection-privacy-3d-icon-bubble-speech-chat_30495036.htm#fromView=search&page=1&position=2&uuid=32c98d98-b79d-44b8-8208-b0739da57c0e">작가 mamewmy 출처 Freepik</a> -->
               <img src="/uploads/login2.png" alt="login"
                  class="mx-auto d-block rounded"
                  style="width: 450px; height: 250px; margin-bottom: 15px;"><br>
               <h5
                  style="font-family: 'goorm-sans-code'; font-weight: bold; margin-left: 10px">로그인
                  또는 회원가입</h5>
               <pre style="font-family: 'goorm-sans-code'; margin-left: 10px">BANGKOK에 로그인하면, 회원 전용 시크릿 특가를 확인하고<br>여행 계획을 편리하게 관리할 수 있습니다.</pre>
               <br>
               <div class="text-center">
                  <button type="button" class="btn btn-outline-dark">
                     <i class="material-icons" style="font-size: 20px">email</i> 이메일로
                     가입하기
                  </button>
               </div>
               <br>
               <div class="text-center my-3">
                  <hr class="hr-text" data-content="또는">
               </div>
            </div>

            <div class="modal-footer text-center">
               <pre
                  style="font-family: 'goorm-sans-code'; margin-left: 10px; font-size: small;">가입과 동시에 이용 약관 및 개인 정보 보호 정책에 동의하시게 됩니다.</pre>
            </div>

         </div>
      </div>
   </div>

   <c:if test="${ !empty msg }">
      <!-- 모달창 이벤트 -->
      <script type="text/javascript">
         $(function() {
            $("#msgModal").modal("show");
         });
      </script>
<!--       <script type="text/javascript"> -->
//          $(function() {
//             $("#loginModal").modal("show");
//          });
<!--       </script> -->
   </c:if>
</body>
</html>

