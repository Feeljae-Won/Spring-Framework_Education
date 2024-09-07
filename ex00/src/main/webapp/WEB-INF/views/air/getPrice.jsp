<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="/js/priceAddComma.js"></script>
	<table class="table text-center" id="priceInfo">
		<tr class="priceList">
			<th style="width:110px;">기본 운임</th>
			<td class="form-inline">
				<input class="form-control basePrice text-right ml-3" id="basePrice" name="basePrice" value="${priceInfo.basePrice }" type="number"
					style="width:80%"><span class="ml-2">원</span>
				<input type="hidden" id="tax" name="tax" value="${priceInfo.tax }">
				<input type="hidden" id="fuelSurCharge" name="fuelSurCharge" value="${priceInfo.fuelSurCharge }">
				<input type="hidden" id="bookingFee" name="bookingFee" value="${priceInfo.bookingFee }">
			</td>
		</tr>	
		<tr>
			<th>세금</th>
			<td class="text-right"> 
				<span >
					<fmt:formatNumber value="${priceInfo.tax }" type="number" />
				</span>
				<span class="ml-2">원</span>
			
			</td>
		</tr>	
		<tr>
			<th>유류할증료</th>
			<td class="text-right">
				<span>
					<fmt:formatNumber value="${priceInfo.fuelSurCharge }" type="number" />
				</span>
				<span class="ml-2">원</span>
			</td>
		</tr>	
		<tr>
			<th>발권 수수료</th>
			<td class="text-right">
				<span>
					<fmt:formatNumber value="${priceInfo.bookingFee }" type="number" />
				</span>
				<span class="ml-2">원</span>
			</td>
		</tr>	
		<tr >
			<th style="border-top: 5px double #444; background-color:#FF5F49">총액 <br>
				<small>(일반석)</small>
			</th>
			<td style="border-top: 5px double #444;" class="text-right">
				<span id="ecoPrice">
				</span>
				<span class="ml-2">원</span>
			</td>
		</tr>	
		<tr>
			<th style="background-color:#FF5F49">총액 <br>
				<small>(비즈니스)</small>
			</th>
			<td class="text-right">
				<span id="bisPrice">
				</span>
				<span class="ml-2">원</span>
			</td>
		</tr>	
		<tr>
			<th style="background-color:#FF5F49">총액 <br>
				<small>(일등석)</small>
			</th>
			<td class="text-right">
				<span id="fstPrice">
				</span>
				<span class="ml-2">원</span>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="float-right">
					<button class="btn btn-warning" type="button">저장</button>
					<button class="btn btn-secondary" type="reset">초기화</button>
				</div>
			</td>
		</tr>
	</table>
<script type="text/javascript">
	
$(function() {
	let basePrice = parseInt($("#basePrice").val());
	let tax = parseInt($("#tax").val());
	let fuelSurCharge = parseInt($("#fuelSurCharge").val());
	let bookingFee = parseInt($("#bookingFee").val());
	
	console.log("basePrice : " + basePrice);
	console.log("tax : " + tax);
	console.log("fuelSurCharge : " + fuelSurCharge);
	console.log("bookingFee : " + bookingFee);
	
	let ecoPrice = basePrice + tax + fuelSurCharge + bookingFee;
	let bisPrice = ecoPrice * 2;
	let fstPrice = ecoPrice * 4;
	
	$("#ecoPrice").text(addCommas(ecoPrice));
	$("#bisPrice").text(addCommas(bisPrice));
	$("#fstPrice").text(addCommas(fstPrice));
});
	
	
	
</script>