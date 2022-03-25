package kr.smhrd.myapp1;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.domain.Member;
import kr.smhrd.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/login.do")
	public String login(Member vo, HttpSession session) {
		
		//1. 매개변수 : Member
		//2. service 작성
		//3. service login() 반환값 받아주기
		//4. 세션 생성(로그인이 가능한지(생성) / 불가능한지 파악)
		//5. boardList.jsp 돌아가기
		Member mvo = service.login(vo);
		
		if(mvo!=null) {
			session.setAttribute("mvo", mvo);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}