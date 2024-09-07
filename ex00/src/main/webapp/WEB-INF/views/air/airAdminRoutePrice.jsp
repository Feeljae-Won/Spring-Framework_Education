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
fieldset {
	border: 1px solid #e0e0e0;
	border-radius:5px; 
}

legend {
	font-size:20px; 
	background-color:white; 
	border-radius:5px;
}
.hiddenInput {
	display: none;
}
.selected {
	background-color: #FEDB92;
}
</style>
<script type="text/javascript" src="/js/priceAddComma.js"></script>
<script type="text/javascript">
$(function() {
	
	// 노선 선택시 운임 정보 불러오기
	$(".dataRow").click(function() {
		
		let routeId = $(this).find(".routeId").data("routeid");
		let departure = $(this).find(".departure").data("departure");
		let arrival = $(this).find(".arrival").data("arrival");
		console.log(routeId);
		
		$(".priceList").remove();
		$(".dataRow").removeClass("selected");
		
		$(this).addClass("selected");
		
		$("#selectRouteId").text(routeId);
		$("#selectDeparture").text(departure);
		$("#selectArrival").text(arrival);
		
		$("#priceInfo").load("/ajax/getPrice.do?airlineNo=1&routeId=" + routeId);
		
	});
	
	// 노선 등록 창 보이기
	$("#addRouteBtn").click(function(){
		$(".hiddenInput").toggle();
	});
	
	// 노선 등록 버튼
	$("#totalAddBtn").click(function(){
		
		$(this).html('<span class="spinner-border spinner-border-sm"></span> Loading..');
	});
	
	// 공항 버튼을 클릭했을 때 동작
	$('.airport').on("focus",function() {
		
		// 새로 오픈 될 때 검색 데이터 지우기
		$("#searchAirport").val("");

		// '출발지 검색' 또는 '도착지 검색'에 맞게 텍스트를 설정
		if ($(this).attr('id') === 'departure') {
			$('#airportList h5').text('출발지 검색');
			$('#searchAirport').data('target', 'departure'); // target 설정
		} else {
			$('#airportList h5').text('도착지 검색');
			$('#searchAirport').data('target', 'arrival'); // target 설정
		}
		
		// 모달 오픈
		$("#airportList").modal("show");

		// input 필드에 포커스를 줘서 커서가 잡히도록 함
		$('#airportList input').focus();
	});
	
	// 공항 데이터 검색
	$("#searchAirport").keyup(function() {
		let searchAirport = $(this).val();
// 		console.log("key up : " + searchAirport);
		
		// 입력 데이터 없을 때 처리
		if(searchAirport.length === 0) {
			$('#airportListResults').empty();
            return;
		};
		
		// AJAX 요청 보내기
        $.ajax({
            url: '/air/searchAirport', // 서버의 공항 검색 API URL
            type: 'GET',
            data: { searchAirport: searchAirport }, // 요청에 검색어 전달
            dataType: 'json', // 반환되는 데이터 타입을 명시
            success: function(data, status, xhr) {
            	
            	console.log(data);
                // 검색 결과를 받아온 후 처리
                $('#airportListResults').empty(); // 기존 결과를 초기화
                if(data.list && data.list.length > 0) {
                    // 검색된 공항 목록을 추가
                    $.each(data.list, function(index, airport) {
                        $('#airportListResults').append(
                        		'<p class="search-result" data-code="' + airport.airportCode + '" data-name="' 
                        		+ airport.airportKor + '"data-country="' + airport.countryKor + '"'
                        		+ '" style="cursor: pointer;">'
                        		+ ' <i class="fa fa-plane" style="color:#E37027"></i> '
                                + airport.airportKor + ' (<b>' + airport.airportCode + '</b>) - ' 
                                + airport.countryKor + '(' + airport.pan + ')</p>'
                        );
                    });
                } else {
                    $('#airportListResults').append('<p>검색 결과가 없습니다.</p>');
                }
            },
            error: function(xhr, status, er) {
                // 오류 발생 시 처리
                $('#airportListResults').empty();
                $('#airportListResults').append('<p>오류가 발생했습니다.</p>');
            }
        });
	});
	
	// 검색된 공항 클릭 시 overlay에 반영
    $(document).on('click', '.search-result', function() {
        let selectedCode = $(this).data('code');  // 공항 코드
        let selectedName = $(this).data('name');  // 공항 이름
        let selectedCountry = $(this).data('country') // 국가 이름
        
        let departureCountry = $("#departureCountry").val();
        
        
        // 선택한 공항을 반영할 target이 'departure'인지 'arrival'인지 확인
        if ($('#searchAirport').data('target') === 'departure') {
            $('#departure').val(selectedCode);
            $('#departureKor').val(selectedName);
            $('#departureCountry').val(selectedCountry);
        } else if ($('#searchAirport').data('target') === 'arrival') {
            $('#arrival').val(selectedCode);
            $('#arrivalKor').val(selectedName);
            $('#arrivalCountry').val(selectedCountry);
            console.log(departureCountry + " +  " + selectedCountry)
            if (departureCountry === selectedCountry) {
            	$("#type").val("D");
        		$("#typeStr").val("국내선");
        	} else if (departureCountry != selectedCountry) {
        		$("#type").val("I");
        		$("#typeStr").val("국제선");
        	} else {
        		$("#type").val("");
        		$("#typeStr").val("");
        	};
        }
        
        // 검색 결과 닫기
        $('#airportListResults').empty();
        $('#airportList').modal("hide");
    });
	
 	// 출발지 선택 시
    $('#departureAirport').click(function() {
        $('#searchAirport').data('target', 'departure');
        $('#airportList').show();
    });

    // 도착지 선택 시
    $('#arrivalAirport').click(function() {
        $('#searchAirport').data('target', 'arrival');
        $('#airportList').show();
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
					<a class="nav-link" href="airAdminAirplane.do"> 
						<Strong>항공사 기종 관리</Strong>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="airAdminRoutePrice.do"> 
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
					<button class="searchBtn float-right mb-3" id="addRouteBtn">노선 등록</button>
					<h3>
						노선 및 운임 관리
					</h3>
					<small>
						<span class="ml-3 mt-2">
							새로운 노선을 등록하려면 <b>[ 노선 등록 ]</b> 버튼을 누르세요.<br>
						</span>
						<span class="ml-3 mt-2">
							아래 노선 탭에서 노선을 선택하면 운임에 대한 상세정보를 볼 수 있습니다.
						</span>
					</small>
					<div class="row mt-3">
						<!-- 노선 탭 -->
						<div class="col-sm-9">
							<fieldset class="border p-4">
							<legend class="w-auto px-2"> <b>[ 노선 ]</b></legend>
								<div class="hiddenInput  p-3" style="background:#e2e2e2; border-radius:10px; padding:10px;">
								<form>
									<!-- 노선 등록 폼 -->
									<button type="button" class="btn searchBtn float-right mb-2" id="totalAddBtn">등록</button>
									<h5> 노선 등록 </h5>
									<table class="table text-center align-middle mb-2">
										<tr>
											<th style="width:6%;">번호</th>
											<th style="width:10%;">출발지</th>
											<th style="width:20%;">출발공항</th>
											<th style="width:10%;">도착지</th>
											<th style="width:20%;">도착공항</th>
											<th style="width:20%;">거리</th>
											<th style="width:8%;">타입</th>
											<th style="width:6%;">왕복</th>
										</tr>
									<tbody id="inputRow">
										<tr>
											<td >
												<input class="form-control" name="routeId" id="routeId" readonly>
											</td>
											<td >
												<input class="form-control airport" name="departure" id="departure" required
													placeholder="코드 검색">
											</td>
											<td >
												<input class="form-control" name="departureKor" id="departureKor" readonly>
												<input type="hidden" id="departureCountry">
											</td>
											<td >
												<input class="form-control airport" name="arrival" id="arrival" required
													placeholder="코드 검색" >
											</td>
											<td >
												<input class="form-control" name="arrivalKor" id="arrivalKor" readonly>
												<input type="hidden" id="arrivalCountry">
											</td>
											<td >
												<input class="form-control" name="distance" id="distance" placeholder="거리 입력 (km)" required>
											</td>
											<td >
												<input class="form-control" id="typeStr" readonly>
												<input type="hidden" name="type" id="type">
											</td>
											<td >
												<input type="checkbox" class="form-check-input" name="goBack" id="goBack" 
													style="width:25px;height:25px;">
											</td>
										</tr>
									</tbody>
									</table>
								</form>
							</div>
								<table class="table text-center align-middle mt-2">
									<tr>
										<th style=width:8%;>번호</th>
										<th style=width:8%;>타입</th>
										<th style=width:10%;>출발 국가</th>
										<th style=width:25%;>출발지</th>
										<th style=width:10%;>도착 국가</th>
										<th style=width:25%;>도착지</th>
										<th style=width:16%;>거리</th>
									</tr>
									<c:forEach items="${routeList }" var="vo">
										<tr class="dataRow">
											<td class="routeId" data-routeid="${vo.routeId}">${vo.routeId }</td>
											<td class="type" data-type="${vo.type}">${(vo.type =='I')? '국제선' : '국내선'}</td>
											<td class="departureCountry">${vo.departureCountry }</td>
											<td class="departure" data-departure="${vo.departure}">${vo.departure } ( ${vo.departureKor } )</td>
											<td class="arrivalCountry" >${vo.arrivalCountry }</td>
											<td class="arrival" data-arrival="${vo.arrival}">${vo.arrival } ( ${vo.arrivalKor } )</td>
											<td class="distance" data-distance="${vo.distance}">
												<fmt:formatNumber value="${vo.distance}" type="number" /> km
											</td>
										</tr>
									</c:forEach>
								</table>
							</fieldset>
						</div>
						<!-- 운임 탭 -->
						<div class="col-sm-3">
							<fieldset class="border p-4">
							<legend class="w-auto px-2"> <b>[ 운임 ]</b></legend>
									<span class="ml-2">
										<strong>
											[ 번호 : <span id="selectRouteId" class="mr-2"></span>
											구간 : <span id="selectDeparture"></span> ~  <span id="selectArrival"></span> ]<br>
										</strong>
									</span>
									<span class="ml-3">
										<small>
											* 기본 운임을 입력하면 자동계산 됩니다.
										</small>											
									</span>
									<table class="table text-center" id="priceInfo">
										<tr class="priceList">
											<th style="width:110px;">기본 운임</th>
											<td class="form-inline">
												<input class="form-control basePrice text-right ml-3" id="basePrice" name="basePrice" value="" type="number"
													style="width:80%"><span class="ml-2">원</span>
											</td>
										</tr>	
										<tr class="priceList">
											<th>세금</th>
											<td class="text-right"> 
												<span id="tax" >
												</span>
												<span class="ml-2">원</span>
											
											</td>
										</tr>	
										<tr class="priceList">
											<th>유류할증료</th>
											<td class="text-right">
												<span id="fuelSurCharge" >
												</span>
												<span class="ml-2">원</span>
											</td>
										</tr>	
										<tr class="priceList">
											<th>발권 수수료</th>
											<td class="text-right">
												<span id="bookingFee">
												</span>
												<span class="ml-2">원</span>
											</td>
										</tr>	
										<tr class="priceList">
											<th style="border-top: 5px double #444; background-color:#FF5F49">총액 <br>
												<small>(일반석)</small>
											</th>
											<td style="border-top: 5px double #444;" class="text-right">
												<span id="ecoPrice">
												</span>
												<span class="ml-2">원</span>
											</td>
										</tr>	
										<tr class="priceList">
											<th style="background-color:#FF5F49">총액 <br>
												<small>(비즈니스)</small>
											</th>
											<td class="text-right">
												<span id="bisPrice">
												</span>
												<span class="ml-2">원</span>
											</td>
										</tr>	
										<tr class="priceList">
											<th style="background-color:#FF5F49">총액 <br>
												<small>(일등석)</small>
											</th>
											<td class="text-right">
												<span id="fstPrice" >
												</span>
												<span class="ml-2">원</span>
											</td>
										</tr>
										<tr class="priceList">
											<td colspan="2">
												<div class="float-right">
													<button class="btn btn-warning" type="button">저장</button>
													<button class="btn btn-secondary" type="reset">초기화</button>
												</div>
											</td>
										</tr>
								</table>
							</fieldset>
						</div>
					
					</div>
					
				</div>
			
			</div>
			<div class="card-footer">
				<pagNav:pageNav listURI="airAdminRoute.do" pageObject="${pageObject }"></pagNav:pageNav>
			</div>
		</div>
	</div>
</div>

<!-- 공항 검색 -->
<div id="airportList" class="modal">
	<div class="modal-dialog modal-md modal-dialog-centered passengerModal" role="document" >
        <div class="modal-content">
            <div class="modal-header">
				<h5><strong>출발지 검색</strong></h5>
			</div>
			<div class="modal-body">
				<input class="form-control mt-3" placeholder="공항 또는 도시 검색" id="searchAirport" autocomplete="off">
				
				<!-- 검색 결과 출력 -->
				<div id="airportListResults" class="mt-3">
				
				</div>
			</div>
			<div class="modal-footer">
				<p class="mt-5">
					<i class="material-icons" style="font-size:18px;color:#E37027">place</i>
					<strong>모든 공항 보기</strong>
				</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>