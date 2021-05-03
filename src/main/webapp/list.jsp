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
<body>list.jsp<br>
	<jsp:useBean id="dao" class="board.BoardDAO"/>
	<div align="center">
		<table border="1">
			<tr>
				<th>번호</th> <th>이름</th> <th>제목</th> <th>날짜</th>
				<th>조회수</th> <th>idgroup</th> <th>step</th> <th>indent</th>
			</tr>
			<c:forEach var="dto" items="${dao.list() }">
			<tr>
				<td>${dto.number }</td> <td>${dto.name }</td>
				<td>
					<a href="content_view.jsp?id=${dto.number }">${dto.title }</a>
				
				</td> 
				<td>${dto.savedate }</td>
				<td>${dto.hit }</td> <td>${dto.idgroup }</td>
				<td>${dto.step }</td> <td>${dto.indent }</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8">
					<a href="write_view.jsp">글작성</a>
				</td>
			</tr>
		</table>
	</div>
	
</body>
</html>
