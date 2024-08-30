<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row" style="margin: 40px -10px 0 -10px">
	<div class="col-lg-12">
		<!-- card -->
		<div class="card">
			<!-- 댓글 제목 -->
			<div class="card-header" style="background: #e0e0e0;">
				<i class="fa fa-comments"></i> <strong>Reply</strong>
				<!-- Button to Open the Modal -->
				<button type="button" class="btn btn-primary btn-sm pull-right" data-toggle="modal" data-target="#replyModal" id="replyOpenModal">
					New Reply
				</button>
			</div>
			
			<!-- 댓글 리스트 데이터 출력 -->
			<div class="card-body">
				<ul class="chat">
					<!-- 데이터 한개 당 li 태그가 생긴다. - foreach -->
					<li class="left clearfix" data-rno="12">
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong>
								<small class="pull-right text-muted">2024-08-20 10:27</small>
							</div>
							<p>Good job!</p>
						</div>
					</li>
				</ul>
			</div>
			<!-- 댓글 페이지 네이션 -->
			<div class="card-footer" style="background: #e0e0e0;">
				<ul class="pagination pagination-sm justify-content-center mb-0">
					<li class="page-item "><a class="page-link" href="#"><i class="fa fa-angle-left"></i></a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-right"></i></a></li>
				</ul>
			</div>	
		</div>
	</div>
</div>

<!-- The Modal -->
<div class="modal" id="replyModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
	      <h4 class="modal-title">댓글 등록</h4>
	      <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	<input type="hidden" id="replyRno">
        <textarea rows="4" class="form-control" id="replyContent"></textarea>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      		<p> 댓글을 <b class="modalText">등록</b>하려면 <b class="modalText">등록</b> 버튼을 누르세요.  </p>
      		<button type="button" class="btn-sm btn-primary" id="replyWriteBtn">등록</button>
      		<button type="button" class="btn-sm btn-secondary" id="replyUpdateBtn">수정</button>
      		<button type="button" class="btn-sm btn-danger" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
