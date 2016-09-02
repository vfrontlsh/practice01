<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/pr01/resources/angular.min.js"></script>
</head>
<body>


<p>Try to change the names.</p>
<%-- 
안녕안녕 이선하
	MVC 
	
	ng-controller 
	ng-model : 객체 역할
	view : {{}} -> 표현식
 --%>
<div ng-app="myApp" ng-controller="myCtrl">
 First Name: <input type="text" ng-model="firstName"><br>
 Last Name: <input type="text" ng-model="lastName"><br>
 <br>
 Full Name: {{firstName + " " + lastName}}
</div>

<script>
	 var app = angular.module('myApp', []);
	 app.controller('myCtrl', function($scope) {
	     $scope.firstName= "joongseo";
	     $scope.lastName= "dong";
	 });

</script>

	

</body>
</html>