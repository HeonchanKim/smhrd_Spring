package kr.smhrd.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.smhrd.domain.Board;
import kr.smhrd.mapper.BoardMapper;

@Service
public class BoardService {
	@Autowired
	private BoardMapper mapper;
	
	public ArrayList<Board> boardList(){
		ArrayList<Board> list = mapper.boardList();
		return list;
	}
	
	public void boardContentUpdate(Board vo) {
		mapper.boardContentUpdate(vo);
	}
	
	public void boardInsert(Board vo) {
		mapper.boardInsert(vo);
	}
	
	public void boardTWUpdate(Board vo) {
		mapper.boardTWUpdate(vo);
	}
	
	public void boardDelete(int idx) {
		mapper.boardDelete(idx);
	}
	
} // end of class
