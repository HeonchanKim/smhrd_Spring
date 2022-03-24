package kr.smhrd.myapp1;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.domain.Board;
import kr.smhrd.mapper.BoardMapper;
import kr.smhrd.service.BoardService;

@RestController
public class RestBoardController {

	@Autowired
	private BoardService service;
	
	//@ResponseBody : 자바 객체는 HTTP 응답객체로 변환해주는데 사용
	@RequestMapping("/boardList.do")
	public ArrayList<Board> boardList(){
		ArrayList<Board> list = service.boardList();
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
	public void boardContentUpdate(Board vo) {
		service.boardContentUpdate(vo);
	}
	
	@RequestMapping("/boardInsert.do")
	public void boardInsert(Board vo) {
		service.boardInsert(vo);
	}
	
	@RequestMapping("/boardTWUpdate.do")
	public void boardTWUpdate(Board vo) {
		service.boardTWUpdate(vo);
	}
	
	@RequestMapping("/boardDelete.do")
	public void boardDelete(int idx) {
		service.boardDelete(idx);
	}

}
