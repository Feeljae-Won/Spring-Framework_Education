<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="pagNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<style type="text/css">
.dataRow:hover {
	background: #d4d4d4;
	border: 3px solid red;
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
	
});
</script>

</head>
<body>
<body>
<div class="container">
<p>
	<div class="card">
		<div class="card-header">
			<h3 onclick="location='list.do'" id="header">일반 게시판 리스트</h3>
		</div>
		<div class="card-body bg-secondary">
		
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