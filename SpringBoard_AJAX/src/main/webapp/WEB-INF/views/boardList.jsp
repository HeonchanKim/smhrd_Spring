<%@page import="kr.smhrd.domain.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Spring WEB MVC 게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD</div>
    <div class="panel-body">
    
		
	</div>
    <div class="panel-footer">지능형 IoT융합 SW전문가과정</div>
  </div>
</div>

<script>
$(document).ready(()=>{
	loadList();
});

function loadList() {
	$.ajax({
		url : "/myapp1/boardList.do",
		type : "get",
		dataType : "json",
		success : htmlView,
		error : function (){
			alert("error");
		}
	});
}

function htmlView(data){
	var result = "<table class='table table-bordered table-hover'>";
	result += "<tr>";
	result += "<td>번호</td>";
	result += "<td>제목</td>";
	result += "<td>작성자</td>";
	result += "<td>작성일</td>";
	result += "<td>조회수</td>"; 
	result += "</tr>";
	
	//반복문
	$.each(data,(index,vo)=>{
		result += "<tr>" 
		result += "<td>"+vo.idx+"</td>";
		result += "<td><a href='javascript:contentView("+vo.idx+")'>"+vo.title+"</a></td>";
		result += "<td>"+vo.writer+"</td>";
		result += "<td>"+vo.indate+"</td>";
		result += "<td>"+vo.count+"</td>";
		result += "</tr>" 
		result += "<tr style='display:none' id='cv"+vo.idx+"'>"
		result += "<td>내용</td>" 
		result += "<td colspan='4'>" 		
		result += "<textarea id='c"+vo.idx+"' rows='6' class='form-control'>"+vo.content+"</textarea>"		
		result += "<br>" 
		result += "<button class='btn btn-success btn-sm' onclick='updateCt("+vo.idx+")'>수정</button>&nbsp" 
		result += "<button class='btn btn-warning btn-sm' onclick='closeCt("+vo.idx+")'>닫기</button>" 
		result += "</td>" 
		result += "</tr>" 
	});
	result += "</table>";
	
	$(".panel-body").html(result);
}

function updateCt(idx){
	var content = $("#c"+idx).val();
	
	$.ajax({
		url : "/myapp1/boardContentUpdate.do",
		type : "post",
		data : {"idx":idx, "content":content},
		success : loadList, // (수정된 값 반영한) 다시 리스트 보여지도록
		error : function (){
			alert("error");
		}
	});
	
}

function closeCt(idx){
	$("#cv"+idx).css("display", "none");
}

function contentView(idx){
	if($("#cv"+idx).css("display") == 'none'){
		$("#cv"+idx).css("display", "table-row");
	}else{
		$("#cv"+idx).css("display", "none");
	}
}

</script>



</body>
</html>