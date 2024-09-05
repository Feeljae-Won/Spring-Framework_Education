<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 폼</title>
<jsp:include page="../jsp/webLib.jsp"></jsp:include>
<script type="text/javascript">
	$(function() { // HTML 문서가 로딩이 다 되면 실행 해 주세요.
		
		// 판매 시작일과 종료일은 현재 날짜 이후만 입력 가능
		$("#sale_startDate, #sale_endDate").datepicker("option", {"minDate" : new Date()});
		
		// 제조일을 현재 날짜 이전만 입력
		$("#product_date").datepicker("option", {"maxDate" : new Date()});
		
		// 바로 중분류의 데이터를 세팅한다.
		$("#cate_code2").load("/ajax/getMidList.do?cate_code1="	+ $("#cate_code1").val());
		
		// 바로 사이즈의 데이터를 세팅한다.
		$("#sizeDiv").load("/ajax/getSize.do?cate_code1="	+ $("#cate_code1").val());
		
		// 바로 컬러의 데이터를 세팅한다.
		$("#colorDiv").load("/ajax/getColor.do?cate_code1="	+ $("#cate_code1").val());
		
		// ------------------------- 이벤트(동작) 처리
		// 대분류 선택에 따른 중분류 리스트 가져오기
		$("#cate_code1").change(function() {
			$("#cate_code2").load("/ajax/getMidList.do?cate_code1="	+ $("#cate_code1").val());
			
			// 바로 사이즈의 데이터를 세팅한다.
			$("#sizeDiv").load("/ajax/getSize.do?cate_code1="	+ $("#cate_code1").val());
			
			// 바로 컬러의 데이터를 세팅한다.
			$("#colorDiv").load("/ajax/getColor.do?cate_code1="	+ $("#cate_code1").val());
		});
		
		
		let appendImageTag = "";
		appendImageTag +=	"<div class=\"input-group mt-2\" >";
		appendImageTag +=		"<input class=\"form-control imageFiles\" type=\"file\" name=\"imageFiles\" >";
		appendImageTag +=			"<div class=\"input-group-append\">";
		appendImageTag +=				"<button type=\"button\" class=\"btn btn-danger btn-sm removeImageBtn\">";
		appendImageTag +=					"<i class=\"fa fa-close\"></i>";
		appendImageTag +=				"</button>";
		appendImageTag +=			"</div>";
		appendImageTag +=		"</div>";
		appendImageTag +=	"</div>";
		
		let imageCnt = 1;
		
		// 첨부 이미지 추가 처리
		$("#addImageBtn").click(function() {
			// alert("addImage");
			if(imageCnt >= 5) {
				alert("첨부 이미지는 최대 5개까지만 가능합니다.");
				return false;
			}
			$("#imageFilesDiv").append(appendImageTag);
			imageCnt++;
		});
		
		// 첨부 이미지 제거 처리
		// 이벤트의 위임 - 나중에 생긴 것이기 때문에 click 이벤트가 발생하지 않는다.
		$("#imageFilesDiv").on("click", ".removeImageBtn", function() {
			// alert("removeImage");
			$(this).closest(".input-group").remove();
			imageCnt--;
		});
		
		let appendOptionTag = "";
		appendOptionTag +=	"<div class=\"input-group mt-2\" >";
		appendOptionTag +=		"<input class=\"form-control\" name=\"option_names\" >";
		appendOptionTag +=			"<div class=\"input-group-append\">";
		appendOptionTag +=				"<button type=\"button\" class=\"btn btn-danger btn-sm removeOptionBtn\">";
		appendOptionTag +=					"<i class=\"fa fa-close\"></i>";
		appendOptionTag +=				"</button>";
		appendOptionTag +=			"</div>";
		appendOptionTag +=		"</div>";
		appendOptionTag +=	"</div>";
		
		let optionCnt = 1;
		
		// 첨부 이미지 추가 처리
		$("#addOptionBtn").click(function() {
			// alert("addImage");
			if(optionCnt >= 5) {
				alert("옵션 추가는 최대 5개까지만 가능합니다.");
				return false;
			}
			$("#optionFieldSet").append(appendOptionTag);
			optionCnt++;
		});
		
		// 첨부 이미지 제거 처리
		// 이벤트의 위임 - 나중에 생긴 것이기 때문에 click 이벤트가 발생하지 않는다.
		$("#optionFieldSet").on("click", ".removeOptionBtn", function() {
			// alert("removeImage");
			$(this).closest(".input-group").remove();
			optionCnt--;
		});
		
		// 사이즈나 색상의 체크 박스를 클릭하면 처리
		$("#sizeFieldSet, #colorFieldSet").on("click", "input", function() {
			// alert("size & color 체크 박스 클릭");
			// option input div 제거 - 처음 것은 제외 (:not(:))
			$("#optionFieldSet > div:not(:first)").remove();
			optionCnt = 1;
			$("#optionFieldSet input").val("");
		});
		
		// 옵션에 input 태그 안에 입력 size 와 color 의 체크 박스 해제
		$("#optionFieldSet").on("keyup", "input", function() {
			// alert("keyup");
			// 사이즈와 컬러의 체크 박스 전부 해제 시킨다. true = 체크, false = 해제
			$("#sizeFieldSet input, #colorFieldSet input").prop("checked", false);
		});
		
			
	});
</script>
<style type="text/css">
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
</head>
<body>
<div class="container">
	<h2 class="mt-3">상품 등록 폼</h2>
	<hr>
	<!-- 상품 기본 정보 입력 시작 -->
	<form action="write.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="perPageNum" value="${param.perPageNum }">
	
	<fieldset class="border p-4 mb-3">
		<legend class="w-auto px-2"> <b>[ 상품 기본 정보 입력 ]</b></legend>
			<div class="form-inline">
				<div class="form-group">
					<label for="cate_code1" class="mr-3"><b>> 대분류</b></label>
					<select class="form-control mr-5" id="cate_code1" name="cate_code1">
						<c:forEach items="${bigList }" var="vo">
							<option value="${vo.cate_code1 }">${vo.cate_name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="cate_code2" class="mr-3"><b>> 중분류</b></label>
					<select class="form-control" id="cate_code2" name="cate_code2">
						<!-- ajax 를 이용한 중분류 option 태그 가져오기 -->
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="goods_name"><b>> 상품명</b></label>
				<input class="form-control" id="goods_name" name="goods_name" placeholder="상품 명을 입력하세요." required>
			</div>
			<div class="form-inline form-group">
				<label for="company" class="mr-2"><b>> 제조사</b></label>
				<input class="form-control mr-5" id="company" name="company" placeholder="제조사" required>
				<label for="product_date" class="mr-2"><b>> 제조 년월일</b></label>
				<input class="form-control datepicker" id="product_date" name="product_date" placeholder="제조년월" required readonly>
			</div>
			<div class="form-group">
				<!-- VO 객체의 property와 이름이 다르다. 파일 자체이므로 DB에는 파일 이름만 꺼내서 저장한다. -->
				<label for="detailImageFile"><b>> 상세 설명 이미지</b></label>
				<input class="form-control" id="detailImageFile" name="detailImageFile" type="file">
			</div>
			<div class="form-group">
				<label for="content"><b>> 상세 설명</b></label>
				<textarea class="form-control" id="content" name="content" rows="10" placeholder="상세 설명을 입력하세요." required></textarea>
			</div>
			<div class="form-group">
				<!-- VO 객체의 property와 이름이 다르다. 파일 자체이므로 DB에는 파일 이름만 꺼내서 저장한다. -->
				<label for="imageFile"><b>> 대표 이미지</b></label>
				<input class="form-control" id="imageFile" name="imageFile" type="file" required>
			</div>
		</fieldset>
			<!-- 상품 기본 정보 입력 끝 -->
			
		<!-- 가격 정보 입력 시작 -->
		<fieldset class="border p-4 mb-3">
			<legend class="w-auto px-2"> <b>[ 상품 가격 정보 입력 ]</b></legend>
			<div class="form-inline form-group">
				<label for="price" class="mr-2"><b>> 정가</b></label>
				<input class="form-control mr-5" id="price" name="price" placeholder="정가 입력" required>
			</div>
			<div class="form-inline form-group">
				<label for="discount" class="mr-2"><b>> 할인가</b></label>
				<input class="form-control mr-5" id="discount" name="discount" placeholder="할인가">
				
				<label for="discount_rate" class="mr-2"><b>> 할인율</b></label>
				<input class="form-control mr-5" id="discount_rate" name="discount_rate" placeholder="할인율" >
			</div>
			<div class="form-inline form-group">
				<label for="delivery_charge" class="mr-2"><b>> 배송료</b></label>
				<input class="form-control mr-5" id="delivery_charge" name="delivery_charge" placeholder="배송료" value="0">
				
				<label for="saved_rate" class="mr-2"><b>> 적립율</b></label>
				<input class="form-control mr-5" id="saved_rate" name="saved_rate" placeholder="배송료" value="0">
			</div>
			<div class="form-inline form-group">
				<label for="sale_startDate" class="mr-2"><b>> 판매 기간</b></label>
				<input class="form-control mr-2 datepicker" id="sale_startDate" name="sale_startDate" placeholder="시작일" required readonly>
				 ~ 
				<input class="form-control ml-2 datepicker" id="sale_endDate" name="sale_endDate" placeholder="종료일" required readonly>
			</div>
		</fieldset>
		<!-- 가격정보 입력 끝 -->
		<fieldset class="border p-4 mb-3">
			<legend class="w-auto px-2"> <b>[ 상품 옵션 정보 입력 ]</b></legend>
			<div class="m-3" style="color:red;">
				사이즈 / 색상과 옵션을 같이 사용할 수 없습니다. <br>
				사이즈나 색상을 선택하면 옵션이 사라집니다. 옵션을 선택하면 반대가 됩니다.
			 </div>
			
			<!-- 상품 사이즈 정보 입력 시작 -->
			<fieldset class="border p-4 mb-3" id="sizeFieldSet">
				<legend class="w-auto px-2"> <b>[ 사이즈 ]</b></legend>
				<div id="sizeDiv" class="form-inline">
				
				</div>
			</fieldset>
			<!-- 상품 사이즈 정보 입력 끝 -->
			
			<!-- 상품 옵션 정보 입력 시작 -->
			<fieldset class="border p-4 mb-3" id="colorFieldSet">
				<legend class="w-auto px-2"> <b>[ 색상 ]</b></legend>
				<div id="colorDiv" class="form-inline">
				
				</div>
			</fieldset>
			<!-- 상품 옵션 정보 입력 끝 -->
			
			<!-- 상품 옵션 정보 입력 시작 -->
			<fieldset class="border p-4 mb-3" id="optionFieldSet">
				<legend class="w-auto px-2"> <b>[ 옵션 ]</b>
					<button type="button" id="addOptionBtn" class="btn btn-primary btn-sm">add Option</button>
				</legend>
				<div id="optionDiv">
					<div class="input-group mb-2"> 
						<input name="option_names" class="form-control"/>	
					</div>		
				</div>
			</fieldset>
			<!-- 상품 옵션 정보 입력 끝 -->
		
		</fieldset>
		
		<!-- 상품 첨부 이미지 정보 입력 시작 -->
		<fieldset class="border p-4 mb-3" id="imageFilesDiv">
			<legend class="w-auto px-2"> <b>[ 상품 첨부 이미지 입력 ]</b>
				<button type="button" id="addImageBtn" class="btn btn-primary btn-sm">add Image</button>
			</legend>
			<!-- 첫번째 첨부파일은 삭제할 수 없다. -->
			<div class="input-group" >
				<!-- VO 객체의 property와 이름이 다르다. 파일 자체이므로 DB에는 파일 이름만 꺼내서 저장한다. -->
				<input class="form-control imageFiles" type="file" name="imageFiles" >
			</div>
		</fieldset>
		<!-- 상품 첨부 이미지 정보 입력 끝 -->
			
			<hr>
			<button class="btn btn-primary">글 등록</button>
			<button type="reset" class="btn btn-secondary">초기화</button>
			<button type="button" class="btn btn-dark cancleBtn" onclick="history.back()">돌아가기</button>
			<hr>
	</form>
</div>
</body>
</html>