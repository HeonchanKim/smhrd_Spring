package kr.smhrd.mapper;

import java.util.ArrayList;

import kr.smhrd.domain.Board;

public interface BoardMapper {

	//전체 게시물 가져오기
	public ArrayList<Board> boardList();
}