<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- maven으로 가져온 jquery-->

<script src="<c:url value="/webjars/jquery/2.1.4/jquery.min.js"/>"></script>

<!-- src>main>webapp>resources>js_files>login.js 등록하기-->

<script type="text/javascript" src="/pr01/resources/js_files/dh.js" defer></script> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><a href="/pr01/">선택화면 돌아가기</a></h2>
<jsp:include page="/WEB-INF/views/dh/dhTab.jsp"></jsp:include>



</body>
</html>