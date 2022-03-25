/**
 * 
 */

function getContextPath(){
	var hostIndex = location.href.indexOf(location.host)+location.host.length;
	var contextPath = location.href.substring(hostIndex,location.href.indexOf("/",hostIndex+1));
	return contextPath;
}
 
 
function loadList() {
	$.ajax({
		url : getContextPath()+"/boardList.do",
		type : "get",
		dataType : "json",
		success : htmlView,
		error : function (){
			alert("error");
		}
	});
}

function goDelete(idx){
	$.ajax({
		url : "/myapp1/boardDelete.do",
		type : "get",
		data : {"idx":idx},
		success : loadList,
		error : function(){
			alert("error");
		}
	});
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

function logout(){
	location.href = getContextPath()+"/logout.do"
}

