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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
	
	let inputRowCnt = 1;
	
	// input 항목 늘리기
	$(".addBtn").click(function(){
		
		
		let inputRow = ""; 
		
		inputRow+= '<tr>';
		inputRow+= '<td>' + (inputRowCnt + 1) + '</td>';
		inputRow+= '<td><input class="form-control" name="list[' + inputRowCnt + '].court"></td>';
		inputRow+= '<td><input class="form-control" name="list[' + inputRowCnt + '].courtNo"></td>';
		inputRow+= '<td><input class="form-control" name="list[' + inputRowCnt + '].name"></td>';
		inputRow+= '<td><input class="form-control" name="list[' + inputRowCnt + '].locate"></td>';
		inputRow+= '<td><input class="form-control" name="list[' + inputRowCnt + '].no"></td>';
		inputRow+= '<td><button class="btn btn-outline-dark inputDeleteBtn"> - </button></td>';
		inputRow+= '</tr>';
		
		let newRow = $(inputRow).clone();
		
		$("#inputRow").append(newRow);
		
		return inputRowCnt++;
	});
	
	// inputRow x 버튼 클릭하면 해당 줄 삭제
	$("#inputRow").on("click", ".inputDeleteBtn", function() {
		
		$(this).closest("tr").remove();
		inputRowCnt--;
	});
});
</script>

</head>
<body>
<body>
<div class="container">
	<h3 onclick="location='list.do'" id="header">심판 리스트</h3>
	<form action="write.do" method="post">
		<div class="float-right">
			<button type="button" onclick="location='/psRefree/list.do'" class="btn btn-warning">등록화면</button>
			<button type="reset" class="btn btn-secondary">초기화</button>
			<button type="submit" class="btn btn-primary">등록</button>
		</div>
		<table class="table text-center">
			<tr>
				<th>순서</th>
				<th>코트</th>
				<th>코트 순번</th>
				<th>이름</th>
				<th>지역</th>
				<th>심판 번호</th>
				<th>추가 <button type="button" class="btn btn-outline-danger addBtn">+</button></th>
			</tr>
			<tbody id="inputRow">
				<tr>
					<td>1</td>
					<td><input class="form-control" name="list[0].court"></td>
					<td><input class="form-control" name="list[0].courtNo"></td>
					<td><input class="form-control" name="list[0].name"></td>
					<td><input class="form-control" name="list[0].locate"></td>
					<td><input class="form-control" name="list[0].no"></td>
					<td><button class="btn btn-outline-dark inputDeleteBtn"> - </button></td>
				</tr>
			</tbody>
			
		</table>
	</form>
</div>
</body>
</html>