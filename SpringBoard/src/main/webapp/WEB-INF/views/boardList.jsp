<%@page import="kr.smhrd.domain.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>
<div class="container">
  <h2>Spring WEB MVC 게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD</div>
    <div class="panel-body">
    
		<table class="table table-bordered table-hover">
		    <tr>
		      <th>번호</th>
		      <th>제목</th>
		      <th>작성자</th>
		      <th>작성일</th>
		      <th>조회수</th>
		    </tr>
			<%for(Board vo : list) {%>
			<tr>
				<td><%=vo.getIdx() %></td>
				<td><%=vo.getTitle() %></td>
				<td><%=vo.getWriter() %></td>
				<td><%=vo.getIndate() %></td>
				<td><%=vo.getCount() %></td>
			</tr>
			<%} %>
		</table>

	</div>
    <div class="panel-footer">지능형 IoT융합 SW전문가과정</div>
  </div>
</div>

</body>
</html>
