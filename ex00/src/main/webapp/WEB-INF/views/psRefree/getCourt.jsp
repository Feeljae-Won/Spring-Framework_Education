<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:forEach items="${courtList }" var="vo">
		<tr class="courtList">
			<td>
				<input type="checkBox" name="reDraw" class="reDraw">
			</td>
			<td>${vo.courtNo }</td>
			<td>${vo.name }</td>
			<td>${vo.locate }</td>
			<td>${vo.no }</td>
		</tr>
	</c:forEach>