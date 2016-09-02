<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- css 파일 local -->
<link rel="stylesheet" href="/pr01/resources/css/dhcss.css">

<!-- maven으로 가져온 jquery-->
<script src="<c:url value="/webjars/jquery/3.1.0/jquery.min.js"/>"></script>

<!-- src>main>webapp>resources>js_files>login.js 등록하기-->
<script type="text/javascript" src="/pr01/resources/js_files/dh.js" defer></script>
 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3><a href="/pr01/">선택화면 돌아가기</a></h3>
<button id="testB">alert!</button>
<jsp:include page="/WEB-INF/views/dh/dhTab.jsp"></jsp:include>



</body>
</html>