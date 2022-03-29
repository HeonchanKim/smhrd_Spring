<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<button onclick="loadListMyBatis()">멤버 리스트 가져오기(마이바티스)</button>
<button onclick="loadListJPA()">멤버 리스트 가져오기(JPA)</button>
<button onclick="loadAdmin()">id가 admin인 회원</button>
<script>
	function loadAdmin(){
		$.ajax({
			url : "/myapp/memberJPA/admin",
			data : {"id":"admin"},
			type : "get",
			dataType : "json",
			success : function (data){
				console.log(data);
			},
			error : function (){
				alert("error");
			},
		});
	}
	function loadListJPA(){
		$.ajax({
			url : "/myapp/memberJPA",
			type : "get",
			dataType : "json",
			success : function (data){
				console.log(data);
			},
			error : function (){
				alert("error");
			},
		});
	}

	function loadListMyBatis(){
		$.ajax({
			url : "/myapp/memberMB",
			type : "get",
			dataType : "json",
			success : function (data){
				console.log(data);
			},
			error : function (){
				alert("error");
			},
		});
	}
</script>
</body>
</html>