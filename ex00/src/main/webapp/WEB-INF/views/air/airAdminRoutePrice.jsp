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
	cursor:pointer;
}
.dataRow > .card-header {
	background: #e0e0e0;
}
#header:hover {
	cursor:pointer;
}
.searchBtn:hover {
	cursor:pointer;
	background-color: #e25600 !important;
}
.searchBtn {
	background-color:#FF9C2A; 
	padding:10px; 
	border-radius:5px; 
	color:white; 
	font-weight:bold;
	text-align:center; 
	box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.5);
	border:1px solid rgba(255, 255, 255, 0);
}

</style>
<script type="text/javascript">
$(function() {
	
	
	
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
					<a class="nav-link" href="airAdminAirplane.do"> 
						<Strong>항공사 기종 관리</Strong>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="airAdminRouteRice.do"> 
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
					<button class="searchBtn float-right addFlightBtn">[ 항공편 등록 ]</button>
					<h3>
						항공사 기종 관리
					</h3>
					<small>
						<span class="ml-3 mt-2">
							새로운 항공편을 등록하려면 <b>[ 항공편 등록 ]</b> 버튼을 누르세요.<br>
						</span>
						<span class="ml-3 mt-2">
							새로운 항공편의 노선과 스케줄을 등록하려면 <b>[ 노선 및 운임 관리 ]</b> 또는 <b>[ 운항 스케줄 관리 ]</b> 에서 등록할 수 있습니다.
						</span>
					</small>
					<div class="hiddenInput mt-3 mb-3 p-3" style="background:#e2e2e2; border-radius:10px; padding:10px;">
						<form>
							<!-- 비행기 등록 폼 -->
							<button type="button" class="btn searchBtn float-right mb-2" id="totalAddBtn">일괄 등록</button>
							<h5> 항공편 등록 </h5>
							<table class="table text-center align-middle">
								<tr>
									<th style="width:200px;">제조사</th>
									<th style="width:120px;">모델</th>
									<th style="width:170px;">편명</th>
									<th style="width:80px;">총 좌석수</th>
									<th style="width:80px;">일반석</th>
									<th style="width:80px;">프리미엄석</th>
									<th style="width:80px;">비즈니스</th>
									<th style="width:80px;">일등석</th>
									<th style="width:80px;"><i class="fa fa-plus btn-outline-light btn addBtn"></i></th>
								</tr>
							<tbody id="inputRow">
								<tr>
									<td >
										<select class="form-control mr-4 airplanePdt" name="airplanePdt" id="airplanePdt" style="width:90%;">
											<option value="AIRBUS">AIRBUS (에어버스)</option>
											<option value="BOEING">BOEING (보잉)</option>
										</select>
									</td>
									<td>
										<select class="form-control mr-4 airplaneList" name="airplanePdt" id="airplaneList" style="width:90%;">
										</select>
									</td>
									<td>
										<input class="form-control" name="flightName" id="flightName" placeholder="flightName"
											style="width:90%;">
									</td>
									<td>
										<input class="form-control" name="seatCapacity" id="seatCapacity" type="number" value="300"
											style="width:90%;">
									</td>
									<td>
										<input class="form-control" name="ecoCnt" id="ecoCnt" type="number" value="216"
											style="width:90%;">
									</td>
									<td>
										<input class="form-control" name="prEcoCnt" id="prEcoCnt" type="number" value="48"
											style="width:90%;">
									</td>
									<td>
										<input class="form-control" name="bisCnt" id="bisCnt" type="number" value="24"
											style="width:90%;">
									</td>
									<td>
										<input class="form-control" name="fstCnt" id="fstCnt" type="number" value="12"
											style="width:90%;">
									</td>
									<td>
										<i class="fa fa-close btn-light btn"></i>
									</td>
								</tr>
							</tbody>
							</table>
						</form>
					</div>
					
					<small>
						<span class="ml-3 mt-2">
							<br><br>* <b>[ 수정 ]</b> : 해당 항공편을 선택하면 자세한 내용을 확인할 수 있으며, <b>기종, 제조사, 좌석, 출발지, 도착지, 운항 스케줄</b>을 변경할 수 있습니다.
							<br>* <b>[ 삭제 ]</b> : 해당 항공편과 관련된 <span style="color:red; font-weight:bold;">모든 데이터가 삭제</span> 됩니다. 
						</span>
					</small>
					<table class="table text-center align-middle mt-3">
						<tr>
							<th>순번</th>
							<th>편명</th>
							<th>기종</th>
							<th>제조사</th>
							<th>총 좌석수</th>
							<th>일반석</th>
							<th>프리미엄석</th>
							<th>비즈니스석</th>
							<th>일등석</th>
							<th>운항여부</th>
							<th>출발지</th>
							<th>도착지</th>
						</tr>
					<c:forEach items="${flightList }" var="vo">
						<tr class="dataRow" data-flightname="${vo.flightName }" data-airplaneid="${vo.airplaneId }"
							data-routeid="${vo.routeId }" data-scheduleid="${vo.scheduleId }">
							<td>${vo.rnum }</td>
							<td>${vo.flightName }</td>
							<td>${vo.airplaneId }</td>
							<td>${vo.airplanePdt }</td>
							<td>${vo.seatCapacity }</td>
							<td>${vo.ecoCnt }</td>
							<td>${vo.prEcoCnt }</td>
							<td>${vo.bisCnt }</td>
							<td>${vo.fstCnt }</td>
							<td>${(vo.scheduleId > 0)? '<i class="fa fa-circle-thin"></i>' : '<i class="fa fa-close"></i>' }</td>
							<td>${(empty vo.departure )? '' : vo.departure }</td>
							<td>${(empty vo.arrival )? '' : vo.arrival }</td>
						</tr>
						<tr class="collapse" id="view${vo.flightName }">
							<td colspan="12">
								${vo.flightName } 상세보기
							</td>
						</tr>
					</c:forEach>
					</table>
				</div>
			
			</div>
		<div class="card-footer">
			<div>
				<pagNav:pageNav listURI="airAdminAirplane.do" pageObject="${pageObject }"></pagNav:pageNav>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>