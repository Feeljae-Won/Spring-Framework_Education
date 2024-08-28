<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Air Main</title>
<!-- Bootstrap and Datepicker JavaScript -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<style type="text/css">
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
	width: 100%;
}

.background-image {
	position: relative;
	width: 100%;
	height: 600px;
	background-image: url('/uploads/airMain.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
}

.overlay {
	position: absolute;
	top: 45%;
	left: 50%;
	transform: translate(-50%, -40%);
	background-color: rgba(255, 255, 255, 0.8);
	/* White background with transparency */
	border-radius: 20px;
	width: 62%;
	text-align: left;
	box-shadow: 10px 10px 12px rgba(0, 0, 0, 0.5);
	/* Optional shadow for better visibility */
}

.overlay h5 {
	color: #444;
}

.searchAir {
	padding: 30px 40px;
	
}
.type {
	margin: 0 20px;
	font-border: 3px;
}

.airport {
	margin: 20px;
	text-align: center;
	position: relative;
}
#departureAirport {
	border:2px solid rgba(255, 255, 255, 0);
	background-color: rgba(255, 255, 255, 0);

}
#departureAirport:hover {
	cursor: pointer;
	border: 2px solid #E37027;
	border-radius: 10px;
}
#arrivalAirport {
	border:2px solid rgba(255, 255, 255, 0);
	background-color: rgba(255, 255, 255, 0);

}
#arrivalAirport:hover {
	cursor: pointer;
	border: 2px solid #E37027;
	border-radius: 10px;
}
.material-icons:hover {
	cursor: pointer;
	color: #e25600!important;
}
#airportList {
	display: none;
	background-color: white;
	border: 1px solid #ccc;
	border-radius: 15px;
	padding: 20px;
	width: 500px;
	position: absolute;
	top: 100%;
	left: 0;
	z-index: 10;
	text-align: left;
}
#departure {
	font-size: 37px;
	font-weight: bold;
	margin-bottom: 10px;
}
#departureKor {
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 10px;
}
#arrival {
	font-size: 37px;
	font-weight: bold;
	margin-bottom: 10px;
}
#arrivalKor {
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 10px;
}

#inputDate {
	border-top:1px solid rgba(255, 255, 255, 0); 
	border-left:1px solid rgba(255, 255, 255, 0); 
	border-right:1px solid rgba(255, 255, 255, 0); 
	border-bottom:1px solid #444; 
	width:260px; 
	padding:10px;
}
#inputPerson {
	border-top:1px solid rgba(255, 255, 255, 0); 
	border-left:1px solid rgba(255, 255, 255, 0); 
	border-right:1px solid rgba(255, 255, 255, 0); 
	border-bottom:1px solid #444; 
	width:150px; 
	padding:10px;
}
#inputSeat {
	border-top:1px solid rgba(255, 255, 255, 0); 
	border-left:1px solid rgba(255, 255, 255, 0); 
	border-right:1px solid rgba(255, 255, 255, 0); 
	border-bottom:1px solid #444; 
	width:150px; 
	padding:10px;
}

#inputDate:hover {
	cursor:pointer;
	border:1px solid #E37027 !important;
	border-radius: 10px;
}
#inputPerson:hover {
	cursor:pointer;
	border:1px solid #E37027 !important;
	border-radius: 10px;
}
#inputSeat:hover {
	cursor:pointer;
	border:1px solid #E37027 !important;
	border-radius: 10px;
}
#searchBtn:hover {
	cursor:pointer;
	background-color: #e25600 !important;
}
.active {
	color:#E37027; 
	border-bottom: 3px solid #E37027; 
	font-weight:bold;
}
.type:hover {
	cursor: pointer;
	color:#E37027 !important;
}

#inputSchedule {
	display: none;
	background-color: white;
	border: 1px solid #ccc;
	border-radius: 15px;
	padding: 20px;
	width: 500px;
	position: absolute;
	top: 100%;
	left: 0;
	z-index: 10;
	text-align: left;
}

</style>
<script type="text/javascript">
$(function() {
	// 공항 버튼을 클릭했을 때 동작
	$('.airport').click(function() {
		
		// 새로 오픈 될 때 검색 데이터 지우기
		$("#searchAirport").val("");

		// '출발지 검색' 또는 '도착지 검색'에 맞게 텍스트를 설정
		if ($(this).attr('id') === 'departureAirport') {
			$('#airportList h5').text('출발지 검색');
			$('#searchAirport').data('target', 'departure'); // target 설정
		} else {
			$('#airportList h5').text('도착지 검색');
			$('#searchAirport').data('target', 'arrival'); // target 설정
		}

		// 현재 열려 있는 리스트가 있으면 닫기
// 		$('#airportList').hide();

		// 검색 리스트 초기화 및 열기
		$(this).append($('#airportList'));
		$('#airportList').css({
			top: $(this).outerHeight() + 'px',  // 공항 아이콘 아래에 위치
			left: 0  // 공항 아이콘의 왼쪽에 정렬
		}).show();

		// input 필드에 포커스를 줘서 커서가 잡히도록 함
		$('#airportList input').focus();
	});

	// 공항 리스트 외부를 클릭하면 닫기
	$(document).click(function(event) {
		// 공항 리스트, 공항 버튼, 입력 필드를 제외한 외부 클릭 시에만 닫기
		if (!$(event.target).closest('.airport, #airportList, input').length) {
			$('#airportList').hide();
		}
	});
	
	// 공항 데이터 검색
	$("#searchAirport").keyup(function() {
		let searchAirport = $(this).val();
		console.log("key up : " + searchAirport);
		
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
                        		+ airport.airportKor + '" style="cursor: pointer;">'
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
        
        // 선택한 공항을 반영할 target이 'departure'인지 'arrival'인지 확인
        if ($('#searchAirport').data('target') === 'departure') {
            $('#departure').text(selectedCode);
            $('#departureKor').text(selectedName);
        } else if ($('#searchAirport').data('target') === 'arrival') {
            $('#arrival').text(selectedCode);
            $('#arrivalKor').text(selectedName);
        }

        // 검색 결과 닫기
        $('#airportListResults').empty();
        $('#airportList').hide();
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
	
	// swap 버튼 클릭 시 출발 공항과 도착 공항의 데이터를 교체
	$('.swap-button').click(function() {
		// 출발 공항의 텍스트 정보
		let departureCode = $('#departure').text();
		let departureKor = $('#departureKor').text();
		
		// 도착 공항의 텍스트 정보
		let arrivalCode = $('#arrival').text();
		let arrivalKor = $('#arrivalKor').text();
		
		// 출발과 도착 정보를 서로 교환
		$('#departure').text(arrivalCode);
		$('#departureKor').text(arrivalKor);
		$('#arrival').text(departureCode);
		$('#arrivalKor').text(departureKor);
	});
	
	// 편도 - 왕복 - 다구간 변경
	$(".type").click(function() {
		$(".type").removeClass("active");
		$(this).addClass("active");
		let type = $(this).text();
		console.log(type);
	});
	
	// 여행 일정 클릭했을 때 이벤트
	$('#inputDate').click(function() {
		
		// 새로 오픈 될 때 검색 데이터 지우기
		$("#inputSchedule").val("");

		// 검색 리스트 초기화 및 열기
		$(this).append($('#inputSchedule'));
		$('#inputSchedule').css({
			top: $(this).outerHeight() + 'px',  // 공항 아이콘 아래에 위치
			left: 0  // 공항 아이콘의 왼쪽에 정렬
		}).show();

	});
	
	// Datepicker를 초기화
    $('#departureCalendar').datepicker({
        format: 'yyyy-mm-dd',    // 날짜 형식
        todayHighlight: true,    // 오늘 날짜 강조
        autoclose: false,        // 자동으로 닫히지 않게 함
        clearBtn: true           // 초기화 버튼 추가
    });
	
    $('#arrivalCalendar').datepicker({
        format: 'yyyy-mm-dd',    // 날짜 형식
        todayHighlight: true,    // 오늘 날짜 강조
        autoclose: false,        // 자동으로 닫히지 않게 함
        clearBtn: true           // 초기화 버튼 추가
    });

    // 선택된 날짜를 저장할 변수
    let selectedDepartDate = "";
    let selectedArriveDate = "";

    // 달력에서 날짜를 선택했을 때 처리
    $('#departureCalendar').on('changeDate', function(e) {
    	selectedDepartDate = e.format('yyyy-mm-dd');
        $("#selectedDepartDate").val(selectedDepartDate);
    });
    $('#arrivalCalendar').on('changeDate', function(e) {
    	selectedArriveDate = e.format('yyyy-mm-dd');
        $("#selectedArriveDate").val(selectedArriveDate);
    });

    // "일정 선택 완료" 버튼 클릭 시 선택된 날짜를 표시
    $('#confirmDateBtn').click(function() {
        if (selectedArriveDate != null) {
            $('#dateRange').text(selectedDepartDate + " ~ " + selectedArriveDate);
        } else {
        	$('#dateRange').text(selectedDepartDate);
        }
        // 모달 창 닫기
        console.log(selectedDepartDate  + " ~ " + selectedArriveDate);
        $('#datePickerModal').modal('hide');
    });
});
</script>
</head>
<body>

	<div class="background-image">
		<div class="overlay">
			<ul class="nav nav-tabs nav-justified" style="border-radius: 20px 20px 0 0 ;">
				<li class="nav-item m-0" style="border-radius: 20px;">
			    	<a class="nav-link" href="/air/main.do" style="border-radius: 20px 20px 0 0 ; 
			    		background-color:#E37027; color:white !important;">
			    		항공권 예약
			    	</a>
				</li>
				<li class="nav-item m-0">
			    	<a class="nav-link" href="/air/searchReservation.do">예약 조회</a>
				</li>
				<li class="nav-item m-0">
			    	<a class="nav-link" href="/air/searchSchedule.do">출/도착 조회</a>
				</li>
			</ul>
			<!-- 공항 및 항공권 예약 관련 내용 -->
			<div class="searchAir">
				<div id="selectType" class="float-right">
					<span class="type active"><strong>왕복</strong></span>
					<span class="type"><strong>편도</strong></span>
					<span class="type"><strong>다구간</strong></span>
				</div>
				<h5><b>항공권 예약</b></h5>
				 <div class="row justify-content-center align-items-center m-0">
				 
				 	 <!-- 출발 공항 클릭 시 히든 창 열기 -->
       				 <div class="col-sm d-flex justify-content-around align-items-center" >
						<button class="airport p-2" id="departureAirport">
							<span>
								<i class="material-icons mb-0" style="font-size:30px">flight_takeoff</i>
							</span>
							<br>
							<span id="departure">
								 ICN
							</span>
							<br>
							<span id="departureKor">
								인천 국제 공항
							</span>
						</button>
						
						<!-- 공항 변환 아이콘 -->
						<span class="swap-button mt-4">
							<i class="material-icons" style="font-size:48px;color:#E37027;">swap_horizontal_circle</i>
						</span>
						
						<!-- 도착 공항 클릭 시 히든 창 열기 -->
						<button class="airport p-2" id="arrivalAirport">
							<span>
								<i class="material-icons mb-0" style="font-size:30px">flight_land</i>
							</span>
							<br>
							<span id="arrival">
								NRT
							</span>
							<br>
							<span id="arrivalKor">
								도쿄 나리타 공항
							</span>
						</button>
					</div>
					<div class="col-sm ml-3 mr-3 mt-3" style="width:300px;">
						<p style="font-size:13px; font-weight:bold; margin-bottom:20px;">
							여행 일정
						</p>
						<span class="d-flex align-items-center" id="inputDate" data-toggle="modal" 
							data-target="#datePickerModal">
							<i class="material-icons mr-3" style="font-size:22px">date_range</i> 
							<span id="dateRange" name="dateRange"><b>가는 날 ~ 오는 날</b></span>
						</span>
					</div>
					<div class="col-sm ml-3 mr-3 mt-3">
						<p style="font-size:13px; font-weight:bold; margin-bottom:20px;">
							탑승객
						</p>
						<span class="d-flex align-items-center" id="inputPerson">
							<i class="fa fa-user mr-3" style="font-size:24px"></i> 
							<b>성인 1명</b>
						</span>
					</div>
					<div class="col-sm ml-3 mr-3 mt-3">
						<p style="font-size:13px; font-weight:bold; margin-bottom:20px;">
							좌석 등급
						</p>
						<span class="d-flex align-items-center" id="inputSeat" >
							<i class="material-icons mr-3" style="font-size:24px">airline_seat_recline_extra</i>
							<b>일반석</b>
						</span>
					</div>
				</div>
				<div style="background-color:#E37027; padding:10px; border-radius:5px; color:white; font-weight:bold; 
					width: 100%; text-align:center; margin-top:15px; box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.5);" 
					id="searchBtn">
					항공권 검색
				</div>
			</div>
		</div>
	</div>

<!-- 공항 검색 -->
<div id="airportList">
	<h5><strong>출발지 검색</strong></h5>
	<input class="form-control mt-3" placeholder="공항 또는 도시 검색" id="searchAirport" autocomplete="off">
	
	<!-- 검색 결과 출력 -->
	<div id="airportListResults" class="mt-3">
	
	</div>
	
	<p class="mt-5">
		<i class="material-icons" style="font-size:18px;color:#E37027">place</i>
		<strong>모든 공항 보기</strong>
	</p>
</div>

<!-- 모달 창 -->
<div class="modal" id="datePickerModal">
    <div class="modal-dialog modal-xl modal-dialog-centered" role="document" >
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="datePickerModalLabel">여정 일자 선택</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 달력이 표시될 곳 -->
                <div class="row">
                	<div class="col">
	                	<div id="departureCalendar" class="mb-3"></div>
		            </div>
		            <div class="col">
		                <div id="arrivalCalendar" class="mb-3"></div>
	                </div>
                </div>
            </div>
            <div class="modal-footer">
            	<div class="form-inline">
	          		<label for="selectedDepartDate" class="mr-3"><b>출발 날짜</b></label>
			        <input class="form-control mr-3" id="selectedDepartDate" placeholder="출발일">
			        <span class="mr-3"> ~ </span>
			        <label for="selectedArriveDate" class="mr-3"><b>돌아오는 날짜</b></label>
	                <input class="form-control mr-3" id="selectedArriveDate" placeholder="돌아오는 날짜">
		        </div>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <button type="button" id="confirmDateBtn" class="btn btn-primary">일정 선택 완료</button>
            </div>
        </div>
    </div>
</div>

<div class="container">

</div>

</body>
</html>