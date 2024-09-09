<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<style type="text/css">

#smallImageDiv img {
	width: 100px;
	height: 100px;
	margin: 3px;
}

#smallImageDiv img:hover {
	opacity:70%;
	pointer:cursor;
}
#goodsDetailDiv .data {
	padding:10px;
	border-bottom: 1px solid #e0e0e0;
}

</style>
<script type="text/javascript">
	$(function() {
		// 글 수정 버튼 처리
		$(".updateBtn").click(function() {
			let goods_no = $(this).data("goods_no");
			location = "updateForm.do?goods_no=" + goods_no + "&inc=0";
		});
		
		// 글 삭제 버튼
		$("#deleteBtn").click(function() {
			$("#pw").val("");
		});
		
		// 리스트 버튼에 대한 처리
		$("#listBtn").click(function() {
			location = "list.do?page=${param.page}&perPageNum=${param.perPageNum}";
		});
		
		// 이미지 보기 작은 이미지 클릭 -> 큰 이미지 보이기
		$("#smallImageDiv img").click(function() {
			$("#bigImageDiv img").attr("src", $(this).attr("src"));
		});
	});
</script>

</head>
<body>
<p>
<div class="container">
	<div class="card">
		<div class="card-header"><h2>상품 상세 보기</h2></div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-6">
						<div id="smallImageDiv">
							<img src="${vo.image_name }" class="img-thumbnail">
							<c:if test="${!empty image}">
								<c:forEach items="${image }" var="imageVO">
									<img src="${imageVO.image_name }" class="img-thumbnail">
								</c:forEach>
 							</c:if>
						</div>
						<div id="bigImageDiv" class="img-thumbnail">
							<!-- 대표 이미지 -->
							<img src="${vo.image_name }" style="width:100%;">
						</div>
						
					</div>
					<div class="col-md-6" id="goodsDetailDiv">
						<div class="data"><i class="fa fa-check"></i>분류 : ${vo.cate_name}</div>
						<div class="data"><i class="fa fa-check"></i>상품 번호 : ${vo.goods_no}</div>
						<div class="data"><i class="fa fa-check"></i>상품명 : ${vo.goods_name}</div>
						<div class="data"><i class="fa fa-check"></i>제조사 : ${vo.company}</div>
						<div class="data"><i class="fa fa-check"></i>제조일 : 
							<fmt:formatDate value="${vo.product_date}" pattern="yyyy-MM-dd"/>
						</div>
						<div class="data"><i class="fa fa-check"></i>정가 : 
							<fmt:formatNumber value="${vo.price }" />원
						</div>
						<div class="data"><i class="fa fa-check"></i>할인가 : 
							<fmt:formatNumber value="${(empty vo.discount )? '0' : vo.discount}" />원
						</div>
						<div class="data"><i class="fa fa-check"></i>할인율 : ${(empty vo.discount_rate)? '0' : vo.discount_rate}%
						</div>
						<div class="data"><i class="fa fa-check"></i>배송비 : 
							<fmt:formatNumber value="${(empty vo.delivery_charge)? '0' : vo.delivery_charge }" />원
							(5만원 이상 무료 배송)
						</div>
						<div class="data" style="color:red;"><i class="fa fa-check"></i>판매가 : 
							<fmt:formatNumber value="${vo.sale_price }" />원
						</div>
						<div class="data"><i class="fa fa-check"></i>적립금 : 
							<fmt:formatNumber value="${(vo.price * vo.saved_rate) / 100}" />원 (${vo.saved_rate }%)
						</div>
					</div>
				</div>
			</div>
			
			<div class="card-body">
				<div class="row">
					<div class="col-md-12">
						<form action="/cart/write.do" method="post">
							<div class="form-inline p-3">
								<c:if test="${!empty sizeColor }">
									<div class="input-group mb-3" style="border-bottom:0;">
										<div class="input-group-prepend" style="border-bottom:0;">
											<span class="input-group-text">> 사이즈/색상 : </span>
										</div>
										<select class="form-control">
											<option value="0">사이즈/색상 선택</option>
											<c:forEach items="${sizeColor }" var="sizeColorVO">
												<option value="${sizeColorVO.size_no }">
													${sizeColorVO.size_name }
													<c:if test="${!empty sizeColorVO.color_no && sizeColorVO.color_no != 0 }">
														/ ${sizeColorVO.color_name }
													</c:if>
												</option>
											</c:forEach>
										</select>
										<div class="input-group-append">
											<button type="button" class="btn btn-outline-secondary">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
								</c:if>
								<c:if test="${!empty option }">
									
								</c:if>
								<c:if test="${empty option and empty sizeColor }">
									
								</c:if>
							</div>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
					</div>
				</div>
			</div>
	
	</div>

</div>
</body>
</html>