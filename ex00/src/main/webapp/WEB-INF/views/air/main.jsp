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
	top: 40%;
	left: 50%;
	transform: translate(-50%, -40%);
	background-color: rgba(255, 255, 255, 0.8);
	/* White background with transparency */
	border-radius: 20px;
	width: 60%;
	text-align: left;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	/* Optional shadow for better visibility */
}

.overlay h5 {
	color: #444;
	margin-bottom: 20px;
}

.searchAir {
	padding: 30px 40px;
	
}
.type {
	margin: 0 20px;
}
</style>
</head>
<body>

	<div class="background-image">
		<div class="overlay">
			<div class="searchAir">
				<h5><b>항공권 예약</b></h5>
				<div>
					<label class="type">왕복</label>
					<label class="type">편도</label>
					<label class="type">다구간</label>
				</div>
				
			</div>
		</div>
	</div>

	<div class="container"></div>

</body>
</html>