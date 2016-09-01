<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/pr01/resources/jquery-1.7.2.min.js"></script>
</head>
<body>

<c:if test="${ msg!=null }">
	<script type="text/javascript">
		alert("${msg}");	
	</script>
</c:if>
<div align="center">
	<h2>js page</h2>
<c:choose>
	<c:when test="${ nowLogin != null }">
		${ nowLogin } 로그인 
	</c:when>
	<c:otherwise>
		<form action="/pr01/js/tryLogin" method="post">
		ID : <input type="text" name="id"><br>
		PW : <input type="text" name="pw"><br>
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" id="joinBt">
	</form>
	</c:otherwise>
</c:choose>
	
	<br>
	
	<hr>
<a href="/pr01/js/ng">angularTest</a>
<script type="text/javascript">
	$("#joinBt").click(function(){

		location.href="/pr01/js/joinForm";		
	});
</script>


	<table border="1" style="text-align: center">
		<tr>
			<td></td>
		</tr>
	</table>

</div>

</body>
</html>