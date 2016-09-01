<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/pr01/resources/jquery-1.7.2.min.js"></script>
</head>
<body>

<h3>회원가입</h3>


	<form action="/pr01/js/join" method="post">
		ID : <input type="text" name="id"><div id="area"></div>
		PW : <input type="text" name="pw"><br>
		NAME : <input type="text" name="name"><br>
		<input type="button" value="회원가입"><br>
	</form>
	
	<script type="text/javascript">
	
		var conf = 1;
		$("input[name='id']").keyup(function(){
			var thisId = $(this).val();
			$.ajax({
		 		
	 			url:"/pr01/js/idConf",
	 			type:"post",
	 			data:{id:thisId},
	 			dataType:"text",
	 			async:false,
	 			success : function (data) {
	 				$("#area").text(data);
	 				if(data=='중복된 아이디'){
	 					conf = -1;
	 				}else{
	 					conf = 1;
	 				}
	 			}
	 		});
		});
		
		$("input[type='button']").click(function(){
			if(conf==1){
				$("form").submit();
			}else{
				alert("중복된 아이디로 회원가입을 할 수 없습니다");
			}
		});
	</script>

</body>
</html>