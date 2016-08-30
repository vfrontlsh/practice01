<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/pr01/resources/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#abc").click(function(){
		alert("aa");
		var inputdata = $("#abcdefg").serialize();
		alert("abc");
		$.ajax({
			type:"POST",
			url:"/pr01/jh/dosomething",
			data : inputdata,
			dataType:"text",
			success:function(response){
				if(response=='1'){
					alert("성공!");
				}else{
					alert("실패");
				}
			}			
		});
		
	

	});
	
	
});



</script>


</head>
<body>



<h2>체크체크</h2>

<hr>

<form id="abcdefg">
<table>
<tr>
<td>이름</td>
<td><input type="text" name="name"/></td>
</tr>
<tr>
<td>아이디</td>
<td><input type="text" name="id"/></td>
</tr>
<tr>
<td>비번</td>
<td><input type="text" name="pw"/></td>
</tr>
<tr>
<td>주소</td>
<td><input type="text" name="addr"/></td>
</tr>
</table>
</form>
<button id="abc">테스트</button>

</body>
</html>