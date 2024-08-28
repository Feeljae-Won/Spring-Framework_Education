<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Air Main</title>
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
		} else {
			$('#airportList h5').text('도착지 검색');
		}

		// 현재 열려 있는 리스트가 있으면 닫기
		$('#airportList').hide();

		// 클릭한 공항 아래에 리스트를 표시하고 input에 포커스
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
            url: '/ajax/searchAirport', // 서버의 공항 검색 API URL
            type: 'GET',
            data: { searchAirport: searchAirport }, // 요청에 검색어 전달
            success: function(data) {
                // 검색 결과를 받아온 후 처리
                $('#airportListResults').empty(); // 기존 결과를 초기화
                if(data.length > 0) {
                    // 검색된 공항 목록을 추가
                    $.each(data, function(index, airport) {
                        $('#airportListResults').append(
                            '<p>' + airport.name + ' (' + airport.code + ')</p>'
                        );
                    });
                } else {
                    $('#airportListResults').append('<p>검색 결과가 없습니다.</p>');
                }
            },
            error: function() {
                // 오류 발생 시 처리
                $('#airportListResults').empty();
                $('#airportListResults').append('<p>오류가 발생했습니다.</p>');
            }
        });
	});
	
	// 검색 결과 클릭 시, 공항 정보 업데이트
    $(document).on('click', '.search-result', function() {
        let selectedCode = $(this).data('code');
        let selectedName = $(this).data('name');

        // 클릭된 공항 정보를 overlay 내에 반영
        if ($('#searchAirport').data('target') === 'departure') {
            $('#departure').text(selectedCode);
            $('#departureKor').text(selectedName);
        } else if ($('#searchAirport').data('target') === 'arrival') {
            $('#arrival').text(selectedCode);
            $('#arrivalKor').text(selectedName);
        }

        // 검색 결과와 리스트 숨기기
        $('#airportListResults').empty();
        $('#airportList').hide();
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
	
	$(".type").click(function() {
		$(".type").removeClass("active");
		$(this).addClass("active");
		let type = $(this).text();
		console.log(type);
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
					<label class="type active"><strong>왕복</strong></label>
					<label class="type"><strong>편도</strong></label>
					<label class="type"><strong>다구간</strong></label>
				</div>
				<h5><b>항공권 예약</b></h5>
				 <div class="row justify-content-center align-items-center m-0">
				 
				 	 <!-- 출발 공항 클릭 시 히든 창 열기 -->
       				 <div class="col-ml-4 d-flex justify-content-around align-items-center" >
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
								서울/인천
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
								도쿄
							</span>
						</button>
					</div>
					<div class="col-ml-4 ml-3 mr-3 mt-3" style="width:300px;">
						<p style="font-size:13px; font-weight:bold; margin-bottom:20px;">
							여행 일정
						</p>
						<span class="d-flex align-items-center" id="inputDate">
							<i class="material-icons mr-3" style="font-size:22px">date_range</i> 
							<b>가는 날 ~ 오는 날</b>
						</span>
					</div>
					<div class="col-ml-2 ml-3 mr-3 mt-3">
						<p style="font-size:13px; font-weight:bold; margin-bottom:20px;">
							탑승객
						</p>
						<span class="d-flex align-items-center" id="inputPerson">
							<i class="fa fa-user mr-3" style="font-size:24px"></i> 
							<b>성인 1명</b>
						</span>
					</div>
					<div class="col-ml-2 ml-3 mr-3 mt-3">
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
	<input class="form-control mt-3" placeholder="공항 또는 도시 검색" id="searchAirport">
	
	<!-- 검색 결과 출력 -->
	<div id="airportListResults" class="mt-3">
	
	</div>
	
	<p class="mt-5">
		<i class="material-icons" style="font-size:24px">place</i>
		모든 공항 보기
	</p>
</div>

<div class="container">

</div>

</body>
</html>