package kr.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.domain.Member;

@Mapper
public interface MemberMapper {
	
	@Select("select * from springmember where memId = #{memId} and memPw = #{memPw}")
	public Member login(Member vo);
	//1. 반환 타입
	//2. SQL (annotation)
}
