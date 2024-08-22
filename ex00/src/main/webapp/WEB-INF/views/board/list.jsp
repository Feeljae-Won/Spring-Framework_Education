<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="pagNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 리스트</title>
<jsp:include page="../jsp/webLib.jsp"></jsp:include>
<style type="text/css">
.dataRow:hover {
	background: #d4d4d4;
	border: 3px solid red;
	cursor:pointer;
}
.dataRow > .card-header {
	background: #e0e0e0;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".dataRow").click(function() {
			let no = $(this).data("no");
// 			alert("no = " + no);
			location = "view.do?no=" + no + "&inc=1";
		});
	});
</script>
</head>
<body>
<div class="container">
<p>
	<div class="card">
		<div class="card-header">
			<a href="writeForm.do" class="btn btn-dark float-right">글 등록</a>
			<h3>일반 게시판 리스트</h3></div>
		<div class="card-body bg-secondary">
			<c:forEach items="${list }" var="vo">
				<div class="card dataRow" data-no="${vo.no }">
					<div class="card-header">
						<span class="float-right">조회수 : ${vo.hit }</span>
						글번호 : ${vo.no }
					</div>
					<div class="card-body">
						<pre class="truncate"><b>${vo.title }</b></pre>
					</div>
					<div class="card-footer">
						<span class="float-right">
							<fmt:formatDate value="${vo.writeDate }"
								pattern="yyyy-MM-dd hh:mm"/>
						</span>
						${vo.writer }
					</div>
				</div>
				<br>
			</c:forEach>
		</div>
		<div class="card-footer">
			<div>
				<pagNav:pageNav listURI="list.do" pageObject="${pageObject }"></pagNav:pageNav>
			</div>
			
		</div>
	</div>
</div>
</body>
</html>