<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="pagNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>List</title>
<style type="text/css">
.dataRow:hover {
	background: #d4d4d4;
	cursor:pointer;
}
.dataRow > .card-header {
	background: #e0e0e0;
}
#header:hover {
	cursor:pointer;
}
</style>
<script type="text/javascript">
$(function() {
	// 노선 선택시 운임 정보 불러오기
	$(".dataRow").click(function() {
		
		let court = $(this).find(".court").data("court");
		console.log(court);
		
		$("#courtList").remove();
		
		$("#courtNo").text(court);
		
		$("#courtInfo").load("/ajax/getCourtList.do?court=" + court);
		
	});
});
</script>

</head>
<body>
<body>
<div class="float-right">
	<h3>심판 <span id="courtNo"></span>조</h3>
	<table class="table">
		<tr>
			<th>재추첨</th>
			<th>조 번호
			<th>심판 이름</th>
			<th>지역</th>
			<th>심판 번호</th>
		</tr>
		<tbody id="courtInfo">
			<tr class="courtList">
				<td>
					<input type="checkBox" name="reDraw" class="reDraw">
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<div class="float-right">
		<button class="btn btn-secondary">재 추첨</button>
	</div>
</div>
<div class="container">
	<h3 onclick="location='list.do'" id="header">심판 리스트</h3>
	<form action="write.do" method="post">
		<div class="float-right">
			<button type="button" onclick="location='/psRefree/main.do'" class="btn btn-warning">처음화면</button>
			<button type="reset" class="btn btn-secondary">초기화</button>
			<button type="submit" class="btn btn-primary">등록</button>
		</div>
		<table class="table text-center">
			<tr>
				<th>순서</th>
				<th>조</th>
				<th>조 순번</th>
				<th>이름</th>
				<th>지역</th>
				<th>심판 번호</th>
			</tr>
			<tbody id="inputRow">
				<c:forEach items="${vo }" var="vo">
					<tr class="dataRow">
						<td>${vo.rnum }</td>
						<td class="court" data-court="${vo.court }">${vo.court }</td>
						<td>${vo.courtNo }</td>
						<td>${vo.name }</td>
						<td>${vo.locate }</td>
						<td>${vo.no }</td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
	</form>
</div>

</body>
</html>