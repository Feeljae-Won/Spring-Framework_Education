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
		
		return nocProcess("국가 추가", "ASIA", "", "", "", "nocWrite.do", "add")
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
	
	$(".deleteBtn").click(function() {
// 		alert("중분류 수정 버튼");
		// 데이터 수집
		let pan = $(this).closest("li").data("pan");
		let countryKor = $(this).closest("li").data("countrykor");
		let countryEng = $(this).closest("li").data("countryeng");
		let countryCode = $(this).closest("li").data("countrycode");
// 		alert("pan : " + pan + ", kor : " + countryKor + ", eng : " + countryEng + ", code : " + countryCode)
		
		return nocProcess("국가 삭제", pan, countryKor, countryEng, countryCode, "nocDelete.do", "delete")
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
	
	// 각 나라의 airportListBtn 눌렀을 때 공항 리스트 처리
	$(".airportListBtn").click(function() {
		let country = $(this).data("countrycode");
		// console.log(country);
		
		$(".collapse").find(".airList").remove();
		$(".collapse").collapse("hide");
		
		// 바로 중분류의 데이터를 세팅한다.
		$("#airportList" + country).load("/ajax/getAirport.do?countryCode="	+ country);
		$("#airportList" + country).collapse("show");
	});
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
					<a class="nav-link" href="airAdmin.do"> 
						<Strong>요약</Strong>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="airAdminNOC.do"> 
						<Strong>국가 및 공항 관리</Strong>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="airAdminAirplane.do"> 
						<Strong>항공사 기종 관리</Strong>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="airAdminRoutePrice.do"> 
						<Strong>노선 및 운임 관리</Strong>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#"> 
						<Strong>운항 스케줄 관리</Strong>
					</a>
				</li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div id="nocTab" class="container-fluid p-3 tab-pane active">
					<h3>
						국가 및 공항 관리
						<button class="btn btn-primary btn-sm" id="addBtn">add</button>
					</h3>
					<small>
						<span class="ml-3 mt-2">
						
							국가 옆에
							<button type ="button" class="btn btn-light btn-sm ">
								[ 공항 리스트 ]
							</button>	
							버튼을 누르면 등록된 공항을 볼 수 있습니다.
						</span>
					</small>
					<hr>
					
					<!-- 대륙별 리스트 -->
					<!-- 아시아  -->
					<h4><strong><i class="material-icons" style="font-size:20px; color:#E37027;">flag</i> 아시아 (Asia)</strong></h4>
					<ul class="list-group ml-3">
						<c:forEach items="${asia }" var="vo">
							<li class="list-group-item" data-pan="${vo.pan }" data-countrykor="${vo.countryKor }"
								data-countryeng="${vo.countryEng }" data-countrycode="${vo.countryCode }">
								
								<button class="btn btn-danger btn-sm float-right deleteBtn">삭제</button>
								<button class="btn btn-secondary btn-sm float-right updateBtn">수정</button>
								
								<b>${vo.countryKor }</b> <small>${vo.countryEng }</small> - 국가 코드 : <b>${vo.countryCode }</b> 
								<button class="btn btn-light btn-sm airportListBtn ml-3" data-countrycode="${vo.countryCode }"
										id="airportListBtn${vo.countryCode }" >
									[ 공항 리스트 ]
								</button>
								
								<div id="airportList${vo.countryCode }" class="collapse airportList p-3 ml-3">
									<div class="airList">
										<ul>
											<li>
												인천 국제 공항
												<i class="fa fa-pencil airportUpdateBtn btn-light btn-sm" style="color:#E37027;"></i>
												<i class="fa fa-close airportDeleteBtn btn-light btn-sm" style="color:red;"></i>
											</li>
										</ul>
									</div>
								</div>
								
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
								<button class="btn btn-light btn-sm airportListBtn ml-3" data-countrycode="${vo.countryCode }"
										id="airportListBtn${vo.countryCode }" >
									[ 공항 리스트 ]
								</button>
								
								<div id="airportList${vo.countryCode }" class="collapse airportList p-3 ml-3">
									<div class="airList">
										<ul>
											<li>
												인천 국제 공항
												<i class="fa fa-pencil airportUpdateBtn btn-light btn-sm" style="color:#E37027;"></i>
												<i class="fa fa-close airportDeleteBtn btn-light btn-sm" style="color:red;"></i>
											</li>
										</ul>
									</div>
								</div>
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
								<button class="btn btn-light btn-sm airportListBtn ml-3" data-countrycode="${vo.countryCode }"
										id="airportListBtn${vo.countryCode }" >
									[ 공항 리스트 ]
								</button>
								
								<div id="airportList${vo.countryCode }" class="collapse airportList p-3 ml-3">
									<div class="airList">
										<ul>
											<li>
												인천 국제 공항
												<i class="fa fa-pencil airportUpdateBtn btn-light btn-sm" style="color:#E37027;"></i>
												<i class="fa fa-close airportDeleteBtn btn-light btn-sm" style="color:red;"></i>
											</li>
										</ul>
									</div>
								</div>
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
								<button class="btn btn-light btn-sm airportListBtn ml-3" data-countrycode="${vo.countryCode }"
										id="airportListBtn${vo.countryCode }" >
									[ 공항 리스트 ]
								</button>
								
								<div id="airportList${vo.countryCode }" class="collapse airportList p-3 ml-3">
									<div class="airList">
										<ul>
											<li>
												인천 국제 공항
												<i class="fa fa-pencil airportUpdateBtn btn-light btn-sm" style="color:#E37027;"></i>
												<i class="fa fa-close airportDeleteBtn btn-light btn-sm" style="color:red;"></i>
											</li>
										</ul>
									</div>
								</div> 
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
								<button class="btn btn-light btn-sm airportListBtn ml-3" data-countrycode="${vo.countryCode }"
										id="airportListBtn${vo.countryCode }" >
									[ 공항 리스트 ]
								</button>
								
								<div id="airportList${vo.countryCode }" class="collapse airportList p-3 ml-3">
									<div class="airList">
										<ul>
											<li>
												인천 국제 공항
												<i class="fa fa-pencil airportUpdateBtn btn-light btn-sm" style="color:#E37027;"></i>
												<i class="fa fa-close airportDeleteBtn btn-light btn-sm" style="color:red;"></i>
											</li>
										</ul>
									</div>
								</div>
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
								<button class="btn btn-light btn-sm airportListBtn ml-3" data-countrycode="${vo.countryCode }"
										id="airportListBtn${vo.countryCode }" >
									[ 공항 리스트 ]
								</button>
								
								<div id="airportList${vo.countryCode }" class="collapse airportList p-3 ml-3">
									<div class="airList">
										<ul>
											<li>
												인천 국제 공항
												<i class="fa fa-pencil airportUpdateBtn btn-light btn-sm" style="color:#E37027;"></i>
												<i class="fa fa-close airportDeleteBtn btn-light btn-sm" style="color:red;"></i>
											</li>
										</ul>
									</div>
								</div>
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
							<option value="SOUTH AMERICA">남미(South America)</option>
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
					<button type="submit" class="btn btn-secondary" id="submitBtn">전송</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>
			</form>

		</div>
	</div>
</div>
</body>
</html>