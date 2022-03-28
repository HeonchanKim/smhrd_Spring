<%@page import="kr.smhrd.domain.Member"%>
<%@page import="kr.smhrd.domain.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
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
<%
	Member mvo = (Member)session.getAttribute("mvo");
	if(mvo!=null){
		System.out.println("memId : " + mvo.getMemId()); 
		System.out.println("memUser : " + mvo.getMemUser()); 
	}
%>
<div class="container">
  <h2>Spring WEB MVC 게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">
    
		<c:if test="${empty mvo}">
			<form class="form-inline" action="${cpath}/login.do" method="post">
			  <div class="form-group">
			    <label for="memId">ID : </label>
			    <input type="text" class="form-control" id="memId" name="memId">
			  </div>
			  <div class="form-group">
			    <label for="memPw">Password:</label>
			    <input type="password" class="form-control" id="memPw" name="memPw">
			  </div>
			  <button type="submit" class="btn btn-default">LOGIN</button>
			</form>
		</c:if>
		<c:if test="${!empty mvo}">
			<div class="form-group">
				<label>${mvo.memUser} 환영합니다</label>
				<button class="btn btn-default btn-sm" onclick="logout()">로그아웃</button>
			</div>
		</c:if>
		
	</div>
    <div class="panel-body" id="list"></div>
    <div class="panel-body" id="wform" style="display:none">
    	
    	<form id="frm" class="form-horizontal" method="post">
	    	<input type="hidden" name="memId" value="${mvo.memId}">
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
	            <input type="text" class="form-control" id="writer" name="writer" value="${mvo.memUser}" readonly="readonly">
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

<script src="./resources/js/fn.js"></script>
<script>
$(document).ready(()=>{
	loadList();
});

function htmlView(data){
	var result = "<table class='table table-bordered table-hover'>";
	result += "<tr>";
	result += "<td>번호</td>";
	result += "<td>제목</td>";
	result += "<td>작성자</td>";
	result += "<td>작성일</td>";
	result += "<td>조회수</td>"; 
	result += "<td>수정하기</td>"; 
	result += "<td>삭제하기</td>"; 
	result += "</tr>";
	
	//반복문
	$.each(data,(index,vo)=>{
		result += "<tr>" 
		result += "<td>"+vo.idx+"</td>";
		result += "<td id='t"+vo.idx+"'><a href='javascript:contentView("+vo.idx+")'>"+vo.title+"</a></td>";
		result += "<td id='w"+vo.idx+"'>"+vo.writer+"</td>";
		result += "<td>"+vo.indate+"</td>";
		result += "<td>"+vo.count+"</td>";
		
		if(vo.memId == "${mvo.memId}"){
			result += "<td id='u"+vo.idx+"'><button class='btn btn-success btn-sm' onclick='goUpdate("+vo.idx+")'>수정</button></td>";
			result += "<td><button class='btn btn-warning btn-sm' onclick='goDelete("+vo.idx+")'>삭제</button></td>";
		}else{
			result += "<td id='u"+vo.idx+"'><button disabled class='btn btn-success btn-sm' onclick='goUpdate("+vo.idx+")'>수정</button></td>";
			result += "<td><button disabled class='btn btn-warning btn-sm' onclick='goDelete("+vo.idx+")'>삭제</button></td>";			
		}
		
		result += "</tr>"; 
		result += "<tr style='display:none' id='cv"+vo.idx+"'>";
		result += "<td>내용</td>" ;
		result += "<td colspan='4'>"; 		
		result += "<textarea id='c"+vo.idx+"' rows='6' class='form-control'>"+vo.content+"</textarea>";		
		result += "<br>";
		if(vo.memId == "${mvo.memId}"){
			result += "<button class='btn btn-success btn-sm' onclick='updateCt("+vo.idx+")'>수정</button>&nbsp";
		}else{
			result += "<button disabled class='btn btn-success btn-sm' onclick='updateCt("+vo.idx+")'>수정</button>&nbsp";			
		}
		result += "<button class='btn btn-warning btn-sm' onclick='closeCt("+vo.idx+")'>닫기</button>"; 
		result += "</td>"; 
		result += "</tr>";
	});
	
	if(${!empty mvo}){
		result += "<tr>";
		result += "<td colspan='7' align='right'>";
		result += "<button class='btn btn-primary btn-sm' onclick='goView()'>글쓰기</button>";	
		result += "</td>";
		result += "</tr>";
		result += "</table>";
	}
	$("#list").html(result);
}
</script>
</body>
</html>
