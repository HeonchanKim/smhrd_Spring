package kr.smhrd.myapp;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//@Controller : Spring MVC 프로젝트에서 컨트롤러 역할
// 주로 View를 반환하기 위해 사용
@Controller
public class BoardController {
	
	//게시판리스트 요청받는 메서드
	//@RequestMapping : 특정 URI로 온 요청 처리 방식 정의
	@RequestMapping("/boardList.do")
	public String boardList(HttpServletRequest request) {
		ArrayList<String> list = new ArrayList<String>();
		list.add("봄");
		list.add("여름");
		list.add("가을");
		list.add("겨울");
		request.setAttribute("list", list);
		
		//return "/WEB-INF/views/boardList.jsp";
		return "boardList";
	}// end of boardList()
	
	
}// end of class