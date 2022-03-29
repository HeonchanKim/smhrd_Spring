package com.smhrd.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.myapp.domain.Member;
import com.smhrd.myapp.service.MemberService;

@RestController
public class RController {

	@Autowired
	MemberService service;
	
	@RequestMapping("/memberMB")
	public List<Member> dataFindAllMB(){
		return service.dataFindAllMB();
	}
	
	@RequestMapping("/memberJPA")
	public List<Member> dataFindAllJPA(){
		return service.dataFindAllJPA();
	}
	
	@RequestMapping("/memberJPA/admin")
	public Member findAdmin(String id){
		return service.findAdmin(id);
	}
	
}
