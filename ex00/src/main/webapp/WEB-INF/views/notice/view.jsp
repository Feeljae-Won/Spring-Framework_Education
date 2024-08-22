<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판 글보기</title>

<!-- 1. 필요한 전역 변수 선언 : 직접 코딩 -->
<script type="text/javascript">
	// 보고 있는 공지사항 게시판 글 번호를 전역 변수로 지정해 보자.
	let id = "test"; // 강제 로그인 - 내가 작성한 댓글에 대해서만 수정 또는 삭제할 수 있다.
	let no = ${vo.no};
	let replyPage = 1;
	console.log("전역 변수 no : " + no);
</script>

<!-- 2. 날짜 처리 함수 선언 -->
<script type="text/javascript" src="/js/dateTime.js"></script>

<!-- 3. 댓글 객체(replyService) 선언 : Ajax 처리 포함 -->
<script type="text/javascript" src="/js/reply.js"></script>

<!-- 4. 댓글 호출 처리 함수 선언 + 이벤트 처리  -->
<script type="text/javascript" src="/js/replyProcess.js"></script>

<script type="text/javascript">
	$(function() {
		$(".updateBtn").click(function() {
			let no = $(this).data("no");
// 			alert(no);
			location = "updateForm.do?no=" + no;
		});
		
		// 글삭제 버튼
		$("#deleteBtn").click(function() {
			$("#pw").val("");
		})
	});
</script>

</head>
<body>
<p>
<div class="container">
	<form action="delete.do" method="post">
		<button type="button" class="btn btn-danger float-right deleteBtn" id="deleteBtn"data-toggle="modal" data-target="#deleteModal">
			글 삭제
		</button>
	</form> 
	<button class="btn btn-secondary float-right updateBtn" data-no="${vo.no }">글 수정</button>
	<a href="list.do" class="btn btn-dark float-right">리스트</a>
	<h4>공지사항 게시판 글 보기</h4>
	<hr>
	<div class="">
		<span class="float-right">
			<b>공지기간 : </b>
			<fmt:formatDate value="${vo.startDate }"
				pattern="yyyy-MM-dd hh:mm"/> ~ 
			<fmt:formatDate value="${vo.endDate }"
				pattern="yyyy-MM-dd hh:mm"/>
		</span>
		<h3>${vo.no }. ${vo.title }</h3>
		<span class="float-right">
			<b>최신 업데이트 : </b>
			<fmt:formatDate value="${vo.updateDate }"
				pattern="yyyy-MM-dd hh:mm"/>
		</span>
		<span>
			<b>작성일 : </b>
			<fmt:formatDate value="${vo.writeDate }"
				pattern="yyyy-MM-dd hh:mm"/>
		</span>
		<hr>
		<div style="height:300px;">
			<pre>${vo.content }</pre>
		</div>
		<hr>
		<!-- 글보기 card 끝 -->
		<div>
			<jsp:include page="boardReply.jsp"></jsp:include>
		</div>
	</div>
</div>
<p>

<!-- The Modal -->
<div class="modal" id="deleteModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">게시판 글 삭제</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <b>${vo.no }</b>번 글을 삭제하시겠습니까?
        <br><br>
        삭제 하려면 비밀번호를 입력하세요.
      </div>

      <!-- Modal footer -->
      <div class="modal-footer form-inline">
      	<form action="delete.do" method="post">
      		<input type="hidden" name="no" value="${vo.no }">
      		<input class="form-control float-left mr-3" type="password" name="pw" id="pw" placeholder="비밀번호 입력">
      		<button type="submit" class="btn btn-danger lastDeleteBtn" id="lastDeleteBtn">Delete</button>
      	</form>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>