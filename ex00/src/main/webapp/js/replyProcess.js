/**
 * replyService 객체를 이용한 댓글 처리 코드
 */
// HTML 로딩이 다 되지 않아도 실행한다.
function showList(page) {
	replyService.list(page,
		// 데이터 가져오기 성공했을 때 실행되는 함수 : callback -> html tag를 만들어 표시하는 함수 실행
		function(data) {
			// data의 구조 - {list[], pageObject}
			let list = data.list;
			// ul tag 안에 들어가는 문자열
			let str = "";
			
			// 데이터가 없는 경우의 처리
			if (list == null || list.length == 0) {
				$(".chat").html("<li> 댓글이 존재 하지 않습니다. </li>");
				$(".pagination").html("");
				return;
			}
			
			// 데이터가 있는 경우의 처리
			for(let i = 0 ; i < list.length ; i ++) {
				str += "<li class=\"mb-3 left clearfix\" data-rno=\"" + list[i].rno  + "\" style=\"border-bottom:1px solid #e0e0e0;\">";
				str += 		"<div>";
				str += 			"<div class=\"header\">";
				str += 				"<strong class=\"primary-font\">" + list[i].name + "(" + list[i].id + ")</strong>";
				str +=				"<small class=\"pull-right text-muted\">" + toDateTime(list[i].writeDate) + "</small>";
				str +=			"</div>";
				if(id == list[i].id) {
					str +=		"<div class=\"pull-right\">";
					str +=		"<button class=\"replyUpdateBtn btn-sm btn-secondary\">수정</button> ";
					str +=		"<button class=\"replyDeleteBtn btn-sm btn-danger\">삭제</button>";
					str +=		"</div>";
				}
				str +=			"<p><pre class=\"replyContent\">" + list[i].content + "</pre></p>";
				str +=		"</div>";
				str += "</li>";
			} // end of for
			
			$(".chat").html(str);
			
			// 댓글 페이지 네이션 출력
			$(".pagination").html(replyPagination(data.pageObject));
		}
			
	);
};

// 일반 게시판 글보기가 처음에 보여질 때 댓글 리스트 보이기 실행.
showList(1);


// HTML이 로딩이 된 상태에서 실행한다.
$(function() {
	
	// 이벤트 처리
	// 댓글 작성 창 내용 비우기
	$("#replyOpenModal").click(function() {
		// 모달 타이블 변경
		$("#replyModal .modal-title").text("댓글 등록");
		
		// 버튼 처리
		$("#replyModal #replyUpdateBtn").hide();
		$("#replyModal #replyWriteBtn").show();
		$(".modalText").text("등록");
		
		// 모달 오픈 될 때 내용 삭제
		$("#replyContent").val("");
	});
	
	// 댓글 등록 처리에 대한 이벤트
	$("#replyWriteBtn").click(function () {
		
//		alert("댓글 등록 -------------");
		// 댓글 등록에 필요한 데이터(no, content) 수집
		let reply = {no : no, content : $("#replyContent").val()};
//		alert(JSON.stringify(reply));
		replyService.write(reply,
			function (result) {
				$("#replyModal").modal("hide");
//				alert(result);
				$("#msgModal .modal-body").text(result);
				$("#msgModal").modal("show");
				// 댓글 리스트 데이터가 변경 되었으므로 리스트를 다시 불러온다.
				showList(1);
			}
		);
	});
	
	// 댓글 수정 버튼 클릭 이벤트
	// 맨 앞에 선택자는 새로 만들어 진게 아닌 원래 있었던 객체를 선택
	// 그 안에 만들어진 HTML 에서 find 를 이용해서 다시 찾아서 함수를 전달해서 사용한다. -> 이벤트의 위임
	$(".chat").on("click", ".replyUpdateBtn", function() {
//		alert("댓글 수정 버튼 Click Event ---------------");

		// rno 찾기
		let li = $(this).closest("li");
		let rno = li.data("rno");
		
		// 모달 타이블 바꾸기
		$("#replyModal .modal-title").text("댓글 수정");
		
		// 버튼 처리
		$("#replyModal #replyWriteBtn").hide();
		$("#replyModal #replyUpdateBtn").show();
		$(".modalText").text("수정");
		
		// 데이터 가져오기
		$("#replyRno").val(li.data("rno")); // 댓글 번호 채우기
		$("#replyContent").val(li.find(".replyContent").text()); // 댓글 내용 채우기
		
		// 모달 처리
		$("#replyModal").modal("show");
	});
	
	// 댓글 수정 처리에 대한 이벤트
	$("#replyUpdateBtn").click(function () {
		
//		alert("댓글 등록 -------------");
		
		// 데이터 수집 -> JSON 데이터로 만든다. rno, content
		let reply = {rno : $("#replyRno").val(), content : $("#replyContent").val()};
//		alert(JSON.stringify(reply));
		
		// 처리
		replyService.update(
			reply, // 전달되는 데이터
			function (result) { // 성공했을 때 함수
				$("#replyModal").modal("hide");
//				alert(result);
				$("#msgModal .modal-body").text(result);
				$("#msgModal").modal("show");
				// 댓글 리스트 데이터가 변경 되었으므로 리스트를 다시 불러온다.
				showList(replyPage);
			}
		);
	});
	
	// 댓글 삭제 이벤트
	// 맨 앞에 선택자는 새로 만들어 진게 아닌 원래 있었던 객체를 선택
	// 그 안에 만들어진 HTML 에서 find 를 이용해서 다시 찾아서 함수를 전달해서 사용한다. -> 이벤트의 위임
	$(".chat").on("click", ".replyDeleteBtn", function() {
		if (!confirm("정말 삭제 하시겠습니까?")) return;
		
		// rno 수집
		let rno = $(this).closest("li").data("rno");
		
		// 삭제 처리
		replyService.delete(
			rno, // 전달되는 데이터
			function (result) { // 성공했을 때 함수
				$("#msgModal .modal-body").text(result);
				$("#msgModal").modal("show");
				// 댓글 리스트 데이터가 변경 되었으므로 리스트를 다시 불러온다.
				showList(1);
			}
		)
	});
	
	// 댓글 페이지네이션 이벤트 처리
	$(".pagination").on("click", "a", function() {
		
		// alert("페이지 클릭");
		let page = $(this).parent().data("page");
		
//		if (page == replyPage)
//			alert("이동페이지(이동 안함) : " + page);
//		else alert("이동페이지(이동함) : " + page);
		
		if (page != replyPage) {
//			alert("이동페이지(이동함) : " + page);
			replyPage = page;
			showList(replyPage);
		}
		
		return false;
	});
	
	
});