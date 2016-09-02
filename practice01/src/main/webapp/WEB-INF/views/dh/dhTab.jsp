<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><a href="/pr01/front/?cmd=dh">도형 메인페이지</a></h2>
<table id="tabTable">
	<tr>
		<td>메뉴1</td>
		<td>메뉴2</td>
		<td>메뉴3</td>
		<td>메뉴4</td>
	</tr>
</table>
<c:choose>
	<c:when test="${mainView eq null }">
		<jsp:include page="/WEB-INF/views/dh/menu1.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="/WEB-INF/views/dh/${mainView }.jsp"></jsp:include>
	</c:otherwise>
</c:choose>
</body>
</html>