<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 수정 폼</title>
<jsp:include page="../jsp/webLib.jsp"></jsp:include>
</head>
<body>
<p>
<div class="container">
	<h1>일반 게시판 글 수정 폼</h1>
	<hr>
	<form action="update.do" method="post">
		<input type="hidden" name="no" value="${vo.no }">
		<div class="form-group">
			<label for="title"><b>> 제목</b></label>
			<input class="form-control" id="title" name="title" value="${vo.title }">
		</div>
		<div class="form-group">
			<label for="content"><b>> 내용</b></label>
			<textarea class="form-control" id="content" name="content" rows="10">${vo.content }</textarea>
		</div>
		<div class="form-group">
			<label for="writer"><b>> 작성자</b></label>
			<input class="form-control" id="writer" name="writer" value="${vo.writer }">
		</div>
		<div class="form-inline form-group">
			<label for="pw"><b>> 비밀번호</b></label>
			<input type="password" class="form-control ml-3" id="pw" name="pw" placeholder="비밀번호 입력" required>
		</div>
		<hr>
		<button class="btn btn-primary updateBtn">글 수정</button>
		<button type="reset" class="btn btn-secondary">초기화</button>
		<button type="button" class="btn btn-dark" onclick="history.back()">돌아가기</button>
	</form>
</div>
</body>
</html>