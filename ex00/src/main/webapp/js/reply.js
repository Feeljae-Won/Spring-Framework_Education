/**
 *  일반 게시판 댓글 처리 객체
 */
 
 // 이 곳이 실행이 되는지 확인할 수 있다.
 console.log("Board Reply Module ------------------------------------");
 
 // 일반 게시판 댓글을 처리하는 객체 선언 - jQuery의 ajax 사용 : ajax(), getJSON(), get(), post()
 let replyService = {
 
 	// 1. 일반 게시판의 댓글 리스트 처리를 위한 함수 - replyService.list(page, 성공 함수, 실패 함수);
 	"list" : function(page, callback, error) {
 		console.log("댓글 리스트 ---------------------------");
 		
 		// page가 없으면 기본값 1로 세팅한다.
 		if (!page) page = 1;
 		
 		console.log("page : " + page + ", no : " + no);
 		
 		// ajax 형태를 만들어 처리한다. - getJSON()
		$.getJSON(
			"/boardReply/list.do?page=" + page + "&no=" + no,
			// 데이터 가져오기를 성공하면 실행되는 함수. data가 서버에서 넘겨주는 JSON 데이터
			function(data){
				console.log(data);
				console.log(JSON.stringify(data));
				// callback이 있으면 실행 -> html tag를 만들어 표시하는 함수 실행 -> replyProcess.js
				if (callback) callback(data);
			}
		).fail(function(xhr, status, err) { // xhr : 통신 객체, status : 상태, err : 에러 코드
			console.log("댓글 리스트 가져오기 오류 *********************************");
			console.log("xhr : " + xhr);
			console.log("status : " + status);
			console.log("err : " + err);
			// error가 있으면 실행
			if (error) error();
			else alert("댓글 데이터 가져 오는 중 오류 발생");
		});
	},
 	
 	// 2. 일반 게시판의 댓글 등록 처리를 위한 함수 - replyService.write(댓글객체, 성공함수, 실패함수);
 	"write" : function(reply, callback, error) {
 		console.log("댓글 등록 ---------------------------");
 		
 		$.ajax({
 			type : "post", // 데이터 전송 방식
 			url : "/boardReply/write.do", // 서버에 전송할 url
 			data : JSON.stringify(reply), //서버에 전송되는 데이터 - body
 			contentType : "application/json; charset=utf-8", // 서버에 전송되는 데이터의 타입과 인코딩
 			// 성공 했을 때의 함수
 			success : function(result, status, xhr) {
 				if (callback) callback(result);
 				else alert(result);
 			},
 			// 실패 했을 때의 함수
 			error : function(xhr, status, er) {
 				console.log("xhr : " + xhr + ", status : " + status + ", er : " + er);
 				if(error) error(er);
 				else alert("댓글 등록에 실패했습니다.");
 			}
 		});
 	},
 	
 	// 3. 일반 게시판의 댓글 수정 처리를 위한 함수 - replyService.update(댓글객체, 성공함수, 실패함수);
 	"update" : function(reply, callback, error) {
 		console.log("댓글 수정 ---------------------------");
 		
 		$.ajax({
 			type : "post", // 데이터 전송 방식
 			url : "/boardReply/update.do", // 서버에 전송할 url
 			data : JSON.stringify(reply), //서버에 전송되는 데이터 - body : rno, content
 			contentType : "application/json; charset=utf-8", // 서버에 전송되는 데이터의 타입과 인코딩
 			// 성공했을 때의 함수
 			success : function(result, status, xhr) {
 				if (callback) callback(result);
 				else alert(result);
 			},
 			// 실패 했을 때의 함수
 			error : function(xhr, status, er) {
 				console.log("xhr : " + xhr + ", status : " + status + ", er : " + er);
 				if(error) error(er);
 				else alert("댓글 수정에 실패했습니다.");
 			}
 		})
 	},
 	
 	// 4. 일반 게시판의 댓글 삭제 처리를 위한 함수 - replyService.delete(rno, 성공함수, 실패함수);
 	"delete" : function(rno, callback, error) {
 		console.log("댓글 삭제 ---------------------------");
 		
 		$.ajax({
 			type : "get", // 데이터 전송 방식
 			url : "/boardReply/delete.do?rno=" + rno, // 서버에 전송할 url
 			// 성공했을 때의 함수
 			success : function(result, status, xhr) {
 				if (callback) callback(result);
 				else alert(result);
 			},
 			// 실패 했을 때의 함수
 			error : function(xhr, status, er) {
 				console.log("xhr : " + xhr + ", status : " + status + ", er : " + er);
 				if(error) error(er);
 				else alert("댓글 삭제를 실패했습니다.");
 			}
 		})
 	}
 };