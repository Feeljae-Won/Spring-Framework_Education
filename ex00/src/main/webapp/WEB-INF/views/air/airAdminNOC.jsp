<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="pagNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공 관리자</title>
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
	
	$("#addBtn").click(function() {
// 		alert("중분류 수정 버튼");
		// 데이터 수집
		
		return nocProcess("국가 추가", "", "", "", "", "nocWrite.do", "add")
	});
	
	$(".updateBtn").click(function() {
// 		alert("중분류 수정 버튼");
		// 데이터 수집
		let pan = $(this).closest("li").data("pan");
		let countryKor = $(this).closest("li").data("countrykor");
		let countryEng = $(this).closest("li").data("countryeng");
		let countryCode = $(this).closest("li").data("countrycode");
// 		alert("pan : " + pan + ", kor : " + countryKor + ", eng : " + countryEng + ", code : " + countryCode)
		
		return nocProcess("국가 수정", pan, countryKor, countryEng, countryCode, "nocUpdate.do", "update")
	});
	
	function nocProcess(title, pan, countryKor, countryEng, countryCode, url, btnName) {
			// 제목 변경
			$("#NocModal").find(".modal-title").text(title);
			
			// 데이터 변경
			$("#pan").val(pan);
			$("#countryKor").val(countryKor);
			$("#countryEng").val(countryEng);
			$("#countryCode").val(countryCode);
			
			// 데이터 보낼 url 세팅
			$("#modalForm").attr("action", url);
			
			// 버튼 이름 바꾸기
			$("#submitBtn").text(btnName);
			
			$("#NocModal").modal("show");
			
			return false;  // a tag의 페이지 이동 처리를 무시시킨다.
		}
});
</script>

</head>
<body>
<div class="container-fluid p-3">
	<div class="card">
		<div class="card-header">
			<h4>항공 관리</h4>
		</div>
		<div class="card-body">
			<!-- Nav tabs -->
			<ul class="nav nav-pills">
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#"> 
						<Strong>요약</Strong>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#"> 
						<Strong>국가 관리</Strong>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#"> 
						<Strong>공항 관리</Strong>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#"> 
						<Strong>기종 등록</Strong>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#"> 
						<Strong>항공사 기종 관리</Strong>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#"> 
						<Strong>노선 및 운임 관리</Strong>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#"> 
						<Strong>운항 스케줄 관리</Strong>
					</a>
				</li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div id="mid_category" class="container tab-pane active">
					<br>
					<h3>
						국가 등록 및 관리
						<button class="btn btn-primary btn-sm" id="addBtn">add</button>
					</h3>
					<hr>
					<h4><strong><i class="material-icons" style="font-size:20px; color:#E37027;">flag</i> 아시아 (Asia)</strong></h4>
					<ul class="list-group ml-3">
						<c:forEach items="${asia }" var="vo">
							<li class="list-group-item" data-pan="${vo.pan }" data-countrykor="${vo.countryKor }"
								data-countryeng="${vo.countryEng }" data-countrycode="${vo.countryCode }">
								<button class="btn btn-danger btn-sm float-right deleteBtn">삭제</button>
								<button class="btn btn-secondary btn-sm float-right updateBtn">수정</button>
								<b>${vo.countryKor }</b> <small>${vo.countryEng }</small> - 국가 코드 : <b>${vo.countryCode }</b> 
							</li>
						</c:forEach>
					</ul>
					<hr>
					<h4><strong><i class="material-icons" style="font-size:20px; color:#E37027;">flag</i> 북미 (North Ameirca)</strong></h4>
					<ul class="list-group ml-3">
						<c:forEach items="${northAmerica }" var="vo">
							<li class="list-group-item" data-pan="${vo.pan }" data-countrykor="${vo.countryKor }"
								data-countryeng="${vo.countryEng }" data-countrycode="${vo.countryCode }">
								<button class="btn btn-danger btn-sm float-right deleteBtn">삭제</button>
								<button class="btn btn-secondary btn-sm float-right updateBtn">수정</button>
								<b>${vo.countryKor }</b> <small>${vo.countryEng }</small> - 국가 코드 : <b>${vo.countryCode }</b> 
							</li>
						</c:forEach>
					</ul>
					<hr>
					<h4><strong><i class="material-icons" style="font-size:20px; color:#E37027;">flag</i> 남미 (South America)</strong></h4>
					<ul class="list-group ml-3">
						<c:forEach items="${southAmerica }" var="vo">
							<li class="list-group-item" data-pan="${vo.pan }" data-countrykor="${vo.countryKor }"
								data-countryeng="${vo.countryEng }" data-countrycode="${vo.countryCode }">
								<button class="btn btn-danger btn-sm float-right deleteBtn">삭제</button>
								<button class="btn btn-secondary btn-sm float-right updateBtn">수정</button>
								<b>${vo.countryKor }</b> <small>${vo.countryEng }</small> - 국가 코드 : <b>${vo.countryCode }</b> 
							</li>
						</c:forEach>
					</ul>
					<hr>
					<h4><strong><i class="material-icons" style="font-size:20px; color:#E37027;">flag</i> 유럽 (Europe)</strong></h4>
					<ul class="list-group ml-3">
						<c:forEach items="${europe }" var="vo">
							<li class="list-group-item" data-pan="${vo.pan }" data-countrykor="${vo.countryKor }"
								data-countryeng="${vo.countryEng }" data-countrycode="${vo.countryCode }">
								<button class="btn btn-danger btn-sm float-right deleteBtn">삭제</button>
								<button class="btn btn-secondary btn-sm float-right updateBtn">수정</button>
								<b>${vo.countryKor }</b> <small>${vo.countryEng }</small> - 국가 코드 : <b>${vo.countryCode }</b> 
							</li>
						</c:forEach>
					</ul>
					<hr>
					<h4><strong><i class="material-icons" style="font-size:20px; color:#E37027;">flag</i> 오스트레일리아 (Australia)</strong></h4>
					<ul class="list-group ml-3">
						<c:forEach items="${australia }" var="vo">
							<li class="list-group-item" data-pan="${vo.pan }" data-countrykor="${vo.countryKor }"
								data-countryeng="${vo.countryEng }" data-countrycode="${vo.countryCode }">
								<button class="btn btn-danger btn-sm float-right deleteBtn">삭제</button>
								<button class="btn btn-secondary btn-sm float-right updateBtn">수정</button>
								<b>${vo.countryKor }</b> <small>${vo.countryEng }</small> - 국가 코드 : <b>${vo.countryCode }</b> 
							</li>
						</c:forEach>
					</ul>
					<hr>
					<h4><strong><i class="material-icons" style="font-size:20px; color:#E37027;">flag</i> 아프리카 (Africa)</strong></h4>
					<ul class="list-group ml-3">
						<c:forEach items="${africa }" var="vo">
							<li class="list-group-item" data-pan="${vo.pan }" data-countrykor="${vo.countryKor }"
								data-countryeng="${vo.countryEng }" data-countrycode="${vo.countryCode }">
								<button class="btn btn-danger btn-sm float-right deleteBtn">삭제</button>
								<button class="btn btn-secondary btn-sm float-right updateBtn">수정</button>
								<b>${vo.countryKor }</b> <small>${vo.countryEng }</small> - 국가 코드 : <b>${vo.countryCode }</b> 
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>

		</div>
		<div class="card-footer">Footer</div>
	</div>
</div>

<!-- The Modal -->
<div class="modal" id="NocModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Modal Heading</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			
				<!-- Modal body -->
			<form method="post" id="modalForm">
				<div class="modal-body">
					<label for="pan"><b>> 대륙</b></label>
						<select class="form-control mb-3" id="pan" name="pan">
							<option value="ASIA">아시아(Asia)</option>
							<option value="AFRICA">아프리카(Afirca)</option>
							<option value="AUSTRALIA">오스트레일리아(Australia)</option>
							<option value="EUROPE">유럽(Europe)</option>
							<option value="NORTH AMERICA">북미(North America)</option>
							<option value="SOUTH AEMRICA">남미(Sout America)</option>
						</select>
					<label for="countryKor"><b>> 국가명(한글)</b></label>
					<input class="form-control mb-3" name="countryKor" id="countryKor" placeholder="한글 국가명" required pattern="[가-힣]+">
					<label for="countryEng"><b>> 국가명(영문)</b></label>
					<input class="form-control mb-3" name="countryEng" id="countryEng" placeholder="영문 국가명" required pattern="[a-zA-Z]+">
					<label for="countryCode"><b>> 국가코드명(2자리)</b> 
						<a href="https://ko.wikipedia.org/wiki/ISO_3166-1_alpha-2">
							<i class="fa fa-question-circle" style="font-size:16px; color:#E37027;"></i>
						</a>
					</label>
					<input class="form-control mb-3" name="countryCode" id="countryCode" placeholder="ISO 3166-1 alpha-2" maxlength="2"
						oninput="this.value = this.value.toUpperCase()" pattern="[A-Z]+" required>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" id="submitBtn">전송</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>
			</form>

		</div>
	</div>
</div>
</body>
</html>