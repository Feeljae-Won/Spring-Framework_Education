<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 관리</title>
<script type="text/javascript">
$(function(){
	
	// 이벤트 처리
	$(".nav-link")
	// 대분류 클릭 이벤트
	.click(function() {
// 		alert("대분류 클릭");
		
		// 대분류 번호 가져오기
		let cate_code1 = $(this).data("cate_code1");
// 		alert("cate_code1 : " + cate_code1);
		// 현재 대분류(active)가 아닌 경우만 페이지 이동
		if(!$(this).hasClass("active"))
			location = "list.do?cate_code1=" + cate_code1;
	})
	// 오른쪽 마우스 버튼 이벤트
	.contextmenu(function(e){
		e.preventDefault(); // 오른쪽 마우스 버튼의 기본 기능을 막는다.
		alert("수정이나 삭제");
	});
});
</script>
</head>
<body>
<div class="container">
	<div class="card">
	  <div class="card-header"><h2>카테고리 관리</h2></div>
	  <div class="card-body">
	  <p> 대분류 탭을 수정하거나 삭제하려면 오른쪽 마우스 버튼을 클릭하세요.</p>
	  	
	  	  <!-- Nav tabs -->
		  <ul class="nav nav-tabs">
			  <c:forEach items="${bigList }" var="vo">
			    <li class="nav-item">
			      <a class="nav-link ${(vo.cate_code1 == param.cate_code1)?'active':'' }" 
			      	data-toggle="tab" href="#mid_category" data-cate_code1="${vo.cate_code1 }">
			      		${vo.cate_name }
			      </a>
			    </li>
			   </c:forEach>
			   <li class="nav-item">
			   </li>
		  </ul>
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <div id="mid_category" class="container tab-pane active"><br>
		      <h3>카테고리 - 중분류</h3>
		      
		      	<ul class="list-group">
			      	<c:forEach items="${midList }" var="vo">
			      		<li class="list-group-item">${vo.cate_name }
					      	<span class="pull-right">
					      		<button class="btn btn-light btn-sm">수정</button>
					      		<button class="btn btn-danger btn-sm">삭제</button>
					      	</span>
				      	</li>
			      	</c:forEach>
		      	</ul>
		    </div>
		  </div>
	  	
	  </div>
	  <div class="card-footer">Footer</div>
	</div>
</div>
</body>
</html>