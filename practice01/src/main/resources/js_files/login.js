$("#insertB").click(function(){
	alert("insert worker");
	location.href="/vfront01/dh/insertWorker";
//	상대 주소로는 dh/insertWorker 과 동일
});

$("#submitB").click(function(){
	var numValue = parseInt($("#numCheck").val());
	var numLength = $("#numCheck").val().length;
	
	alert(numValue);
	if(isNaN(numValue) || numLength>3){
		alert("3자리 이하의 번호를 입력해주세요");
		return;
	}else{
		alert("here");
	}
	document.getElementsByName("insertfrm")[0].submit();
});

$("#emailTestB").click(function(){
	
	var emailSender = document.getElementsByName("emailFrm")[0];
	emailSender.method="post";
	emailSender.submit();
});

$("#jsonB").click(function(){
	var jsonData = {
			"test1":"jsonValue1",
			"test2":"jsonValue2",
			"test3":"jsonValue3",
			
	}
	$.ajax({
//		ajax로 data전송 후, return값을 json형태로 받을 생각이 아니라면,
//		dataType='json'을 명시하면 안된다.(오히려 에러남)
		method:"post",
		url:"/vfront01/dh/writeJson",
		data:jsonData,
		success:function(msg){
			alert("jsonData sent successfully msg :"+msg);
		}
		
	})
});

$("#rcvJson").click(function(){
	$.ajax({
		method:"post",
		dataType:"json",
		url:"/vfront01/dh/rcvJson",
		
		success: function(rcvJson){
			alert(rcvJson.test1+","+rcvJson.test2+","+rcvJson.test3);
		}
		
	});
});

$("#jsonp1").click(function(){

	$.getJSON("https://api.github.com/users/jeresig?callback=?",function(json){
		alert(json);
		
	});
});

$("#myjsonp1").on("click",function(){
	$.getJSON("http://localhost:8080/vfront01/dh/myjsonp1?mycallback=?",
			{
				"test1":"val1",
				"test2":"val2",
				"test3":"val3"
			},
			function(jsonp){
		alert("rcved : "+jsonp.test1);
	})
});

window.onload=function(){
	
	var msg = $("#alertMsg").val();
	if(msg !=undefined){
		alert(msg);
	}
	
}

$(document).ready(function() {
    $.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?",
    		{
				tags: "dogs",
				tagmode: "any",
				format: "json"
    		},		
    	function(data){  
        var listItems = '';
        $.each(data.items, function(i,item){
           listItems
               += '<tr>'+
                    '<td class="title">'+item.title+'</td>'+
                 '<td>'+'<img src="'+item.media.m+'" />'+'</td>'+
                  '</tr>';
          if (i == 3) return false; ;
        });
        $('table.dogTable').append(listItems);
    });  
});


