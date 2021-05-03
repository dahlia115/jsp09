<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>content_view.jsp<br>
	<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="board.BoardDAO"/>
	<c:set var="dto" value="${dao.contentView(param.id) }"/>
	<form action="">
		<input type="hidden" name="id" value="${dto.number }">
		<table>
			<tr>
				<td>번호</td><td>${dto.number }</td>
			</tr>
			<tr>
				<td>조회수</td><td>${dto.hit }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" value="${dto.name }"> 
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" value="${dto.title }"> 
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content">${dto.content }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정"> &nbsp;
					<a href="list.jsp">목록이동</a>&nbsp;
					<a href="">삭제</a>&nbsp;
					<a href="">답변</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>