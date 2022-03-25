package kr.smhrd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.smhrd.domain.Member;
import kr.smhrd.mapper.MemberMapper;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	public Member login(Member vo) {
		//1.매개인자 : Member
		//2.반환 타입
		//3.mapper interface
		//4.mapper - login() 호출
		//5.반환값
		Member mvo = mapper.login(vo);
		return mvo;
	}
}
