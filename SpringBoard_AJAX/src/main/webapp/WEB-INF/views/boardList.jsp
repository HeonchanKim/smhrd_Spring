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
    <div class="panel-body" id="list"></div>
    <div class="panel-body" id="wform" style="display:none">
    	
    	<form id="frm" class="form-horizontal" method="post">
        <div class="form-group">
          <label class="control-label col-sm-2" for="title">제목:</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="title" name="title" placeholder="Enter title">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="content">내용:</label>
          <div class="col-sm-10">
            <textarea rows="10" id="content" class="form-control" name="content"></textarea>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="writer">작성자:</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="writer" name="writer" placeholder="Enter writer">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="button" class="btn btn-success btn-sm" onclick="goInsert()">등록</button>
            <button id="init" type="reset" class="btn btn-warning btn-sm">취소</button>
          </div>
        </div>
      </form>
    	
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
	result += "<td>수정하기</td>"; 
	result += "</tr>";
	
	//반복문
	$.each(data,(index,vo)=>{
		result += "<tr>" 
		result += "<td>"+vo.idx+"</td>";
		result += "<td id='t"+vo.idx+"'><a href='javascript:contentView("+vo.idx+")'>"+vo.title+"</a></td>";
		result += "<td id='w"+vo.idx+"'>"+vo.writer+"</td>";
		result += "<td>"+vo.indate+"</td>";
		result += "<td>"+vo.count+"</td>";
		result += "<td id='u"+vo.idx+"'><button class='btn btn-success btn-sm' onclick='goUpdate("+vo.idx+")'>수정</button></td>";
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
	result += "<tr>";
	result += "<td colspan='6' align='right'>";
	result += "<button class='btn btn-primary btn-sm' onclick='goView()'>글쓰기</button>";	
	result += "</td>";
	result += "</tr>";
	result += "</table>";
	
	$("#list").html(result);
}

function goUpdate(idx){
	var title = $("#t"+idx).text();
	$("#t"+idx).html("<input id='nt"+idx+"' type='text' class='form-control' value='"+title+"'>");
	
	var writer = $("#w"+idx).text();
	$("#w"+idx).html("<input id='nw"+idx+"' type='text' class='form-control' value='"+writer+"'>");
	
	var newBtn = "<button class='btn btn-info btn-sm' onclick='goUpdate1("+idx+")'>수정하기</button>";
	$("#u"+idx).html(newBtn);
}

function goUpdate1(idx){
	var title = $("#nt"+idx).val();
	var writer = $("#nw"+idx).val();
	
	//1. controller에 boardTWUpdate 메서드 만들기
	//2. mapper interface에 boardTWUpdate() 만들기
	//3. 어노테이션 또는 xml update 추가
	$.ajax({
		url : "/myapp1/boardTWUpdate.do",
		type : "post",
		data : {"idx":idx, "title":title, "writer":writer},
		success : loadList,
		error : function(){
			alert("error");
		}
	});
}

function goInsert(){
	var data = $("#frm").serialize();

	$.ajax({
		url : "/myapp1/boardInsert.do",
		type : "post",
		data : data,
		success : loadList,
		error : function(){
			alert("error")
		}
	});
	
	//폼 비우기
	//$("#title").val("");
	//$("#content").val("");
	//$("#writer").val("");
	//trigger() : 이벤트 강제 발생
	$("#init").trigger("click"); //reset버튼에 아이디 'init' 지정했는지 확인
	$("#wform").slideUp();
}

function goView(){
	if($("#wform").css("display") == 'none'){
		$("#wform").slideDown();
	}else{
		$("#wform").slideUp();	
	}
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
