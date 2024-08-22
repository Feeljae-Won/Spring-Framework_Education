/**
 * Javascript Utility Program
 * 
 * 댓글의 페이지네이션
 */

/* 넘어오는 데이터
 	{"page":1,"perPageNum":10,"startRow":1,"endRow":10,"perGroupPageNum":10,"startPage":1,"endPage":1,"totalPage":1,
 	"totalRow":5,"key":null,"word":null,"period":"pre","accepter":null,"acceptMode":1,"notPageQuery":"perPageNum=10&key=&word=",
 	"pageQuery":"page=1&perPageNum=10&key=&word=","limit":0}}
*/
// 댓글 페이지네이션 태그들의 문자열을 만들어 넘겨준다.
function replyPagination(pageObject) {
	let str = "";
	
	str +="<li class=\"page-item";
			
	// 이전 페이지 처리 : disabled 추가 여부 - 이전 페이지가 없으면 'disabled' 붙힌다.
	if(pageObject.startPage == 1) str += " disabled ";
	
	str +=	"\" data-page=\"" + (pageObject.startPage - 1) 
		+ "\"><a class=\"page-link\" href=\"#\" ><i class=\"fa fa-angle-left\"></i></a></li>"
	
	// startPage 부터 endPage 까지 반복 처리하면서 페이지 만들어내기
	for( i = pageObject.startPage; i <= pageObject.endPage; i++) {
		str += "<li class=\"page-item";
		// 현재 페이지가 같으면 'active' 붙힌다.
		if(i == pageObject.page) str += " active ";
		str += "\" data-page=\"" + i + "\"><a class=\"page-link\" href=\"#\">" + i + "</a></li>";
	}
	
	// 다음 페이지 처리 : endPage가 10이면 11로 보내는 처리
	str +=	"<li class=\"page-item";
		if(pageObject.endPage >= pageObject.totalPage) str += " disabled ";
		str += "\" data-page=\"" + (pageObject.endPage + 1) 
			+ "\"><a class=\"page-link\" href=\"#\" ><i class=\"fa fa-angle-right\"></i></a></li>"
				
	return str;
}

