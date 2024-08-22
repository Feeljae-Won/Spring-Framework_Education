/**
 *  날짜와 시간에 대한 표시와 처리
 */


// 날짜로 표시하는 처리
// timeStamp : Long 타입
function toDate(timeStamp, separChar) {
	
	if(!separChar) separChar = "-";
	let dateObj = new Date(timeStamp);
	
	let yy = dateObj.getFullYear();
	let mm = dateObj.getMonth() + 1; // 월은 0 ~ 11까지 사용.
	let dd = dateObj.getDate();
	
	return yy + separChar + ((mm > 9 ? '' : '0') + mm ) + separChar + ((dd > 9 ? '' : '0') + dd);

}

// 시간으로 표시하는 처리
// timeStamp : Long 타입
function toTime(timeStamp) {
	
	let dateObj = new Date(timeStamp);
	
	let hh = dateObj.getHours();
	let mi = dateObj.getMinutes();
	let ss = dateObj.getSeconds();
	
	return ((hh > 9 ? '' : '0') + hh) + ':'
		+ ((mi > 9 ? '' : '0') + mi) +  ':'
		+ ((ss > 9 ? '' : '0') + ss);
}

// 날짜와 시간 표시하는 처리
// 24이 지나지 않았으면 시간을 표시, 지났으면 날짜를 표시 하도록 처리한다.
function toDateTime(timeStamp) {
	// 현재 날짜 객체
	let today = new Date();
	let gap = today.getTime() - timeStamp; // 1000분의 1초 단위의 지나간 시간이 나온다.
	
	// 지나간 시간이 24시간 보다 작은 경우 (24시간이 안 지나갔다.) - 시간 표시
	if (gap < (1000 * 60 * 60 * 24)) return toTime(timeStamp);
	// 24시간이 지난 경우는 날짜 표시.
	else return toDate(timeStamp, "-");
}
