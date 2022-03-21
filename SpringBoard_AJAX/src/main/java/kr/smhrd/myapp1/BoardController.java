package kr.smhrd.myapp1;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.domain.Board;
import kr.smhrd.mapper.BoardMapper;

//@Controller : Spring MVC 프로젝트에서 컨트롤러 역할
// 주로 View를 반환하기 위해 사용
// Model 반환
@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper mapper;
	
	@RequestMapping("/")
	public String main() { //127.0.0.1:8081/myapp1/
		return "boardList";
	}
	
	//@ResponseBody : 자바 객체는 HTTP 응답객체로 변환해주는데 사용
	@RequestMapping("/boardList.do")
	public @ResponseBody ArrayList<Board> boardList(){
		ArrayList<Board> list = mapper.boardList();
		return list;
	}
	
	//boardContentUpdate.do
	//메서드 이름은 boardContentUpdate
	//매개변수 작성
	// @ResponseBody 꼭 작성!!
	//springboard 수정 추상메서드 interface 작성
	//sql작성 - xml, annotation
	//반환 데이터 x
	@RequestMapping("/boardContentUpdate.do")
	public @ResponseBody void boardContentUpdate() {
		
	}
	
	
}// end of class