<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글 등록 폼</title>
<jsp:include page="../jsp/webLib.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h2 class="mt-3">일반 게시판 글 등록 폼</h2>
	<hr>
	<form action="write.do" method="post">
		<div >
			<div class="form-group">
				<label for="title"><b>> 제목</b></label>
				<input class="form-control" id="title" name="title" placeholder="제목을 입력하세요." required>
			</div>
			<div class="form-group">
				<label for="content"><b>> 내용</b></label>
				<textarea class="form-control" id="content" name="content" rows="10" placeholder="내용을 입력하세요." required></textarea>
			</div>
			<div class="form-group">
				<label for="writer"><b>> 작성자</b></label>
				<input class="form-control" id="writer" name="writer" placeholder="작성자를 입력하세요." required>
			</div>
			<div class="form-inline form-group">
				<label for="pw" class="mr-2"><b>> 비밀번호</b></label>
				<input type="password" class="form-control mr-5" id="pw" name="pw" placeholder="비밀번호 입력" required>
				<label for="pw2" class="mr-2"><b>> 비밀번호 확인</b></label>
				<input type="password" class="form-control" id="pw2" name="pw2" placeholder="비밀번호 확인" required>
			</div>
			<hr>
			<button class="btn btn-primary">글 등록</button>
			<button type="reset" class="btn btn-secondary">초기화</button>
			<button type="button" class="btn btn-dark cancleBtn" onclick="history.back()">돌아가기</button>
		</div>
	</form>
</div>
</body>
</html>