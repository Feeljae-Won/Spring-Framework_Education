<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h3>파일 업로드2</h3>
	<form action="exUploadPost2" method="post" enctype="multipart/form-data">
		<div>
			첨부파일 : <input type="file" name="files" multiple class="form-control">
		</div>
		<div>
			<button>전송</button>
		</div>
	</form>

</div>

</body>
</html>