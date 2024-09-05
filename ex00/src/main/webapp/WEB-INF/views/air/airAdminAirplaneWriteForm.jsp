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

fieldset {
	border-radius:15px; 
	background-color:#e0e0e0;
}

legend {
	font-size:16px; 
	background-color:white; 
	border-radius:5px;
}

</style>
<script type="text/javascript">
$(function() {
	
	// 바로 중분류의 데이터를 세팅한다.
	$("#airplaneList").load("/ajax/getAirplane.do?airplanePdt="	+ $("#airplanePdt").val());
	
	// 대분류 선택에 따른 중분류 리스트 가져오기
	$("#airplanePdt").change(function() {
		$("#airplaneList").load("/ajax/getAirplane.do?airplanePdt="	+ $("#airplanePdt").val());
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
					<a class="nav-link" href="airAdminNOC.do"> 
						<Strong>국가 및 공항 관리</Strong>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="airAdminAirplane.do"> 
						<Strong>항공사 기종 관리</Strong>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#"> 
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
					<br>
					<h3>
						항공사 기종 등록
					</h3>
				<fieldset class="border p-4 mb-3 mt-3" id="imageFilesDiv">
					<legend class="w-auto px-2"> <b>[ 항공편 등록 ]</b></legend>
					<!-- 비행기 등록 폼 -->
						<div class="form-inline">
							<div class="input-group" >
								
								<!-- 제조사 선택 -->
								<label for="airplanePdt" class="mr-2"><b>> 제조사 </b></label>
								<select class="form-control mr-4" name="airplanePdt" id="airplanePdt" style="width:220px;">
									<option value="AIRBUS">AIRBUS (에어버스)</option>
									<option value="BOEING">BOEING (보잉)</option>
								</select>
								
								<!-- 비행기 모델 입력 -->
								<label for="airplanePdt" class="mr-2"><b>> 모델 </b></label>
								<select class="form-control mr-4" name="airplanePdt" id="airplaneList" style="width:130px;">
								</select>
								
								<!-- 총 좌석 수 입력 -->
								<label for="airplanePdt" class="mr-2"><b>> 총 좌석 수 <small>(기본: 300석)</small> </b></label><br>
								<input class="form-control" name="seatCapacity" id="seatCapacity" type="number" value="300"
									style="width:100px;">
							</div>
						</div>
				</fieldset>
				<fieldset class="border p-4 mb-3 mt-3" id="imageFilesDiv">
					<legend class="w-auto px-2"> <b>[ 항공편 등록 ]</b></legend>
						<div class="form-inline">
							<div class="input-group" >
								<label for="airplanePdt" class="mr-2"><b>> 편명(flightName) </b></label><br>
								
							</div>
						</div>
				</fieldset>
					<hr>
				</div>
				

		</div>
		<div class="card-footer">Footer</div>
		</div>
</div>
</div>
</body>
</html>