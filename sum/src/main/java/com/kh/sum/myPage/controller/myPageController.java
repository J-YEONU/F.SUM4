package com.kh.sum.myPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.common.util.PageInfo;
import com.kh.sum.member.model.service.MemberService;
import com.kh.sum.member.model.vo.Member;
import com.kh.sum.myPage.model.service.MyPageService;
import com.kh.sum.myPage.model.vo.MyQnA;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/myPage")
public class myPageController {
	
	@Autowired
	private MyPageService service;
	
	@Autowired
	private MemberService memberService;
	
	//===============  myBooking ===============
	@GetMapping("/myBooking")
	public ModelAndView myBooking(ModelAndView model,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<MyQnA> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 5, service.getBookingCount(), 5);
		list = service.getBookingList(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/myPage/myBooking");
		
		return model;
	}
	
	//===============  myQnA ===============
	
	@GetMapping("/myQnA")
	public ModelAndView myQnA(ModelAndView model,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<MyQnA> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 5, service.getQnACount(), 5);
		list = service.getQnAList(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/myPage/myQnA");
		
		return model;
	}
	
	
	//===============  myQnADetail ===============
	
    @GetMapping("/myQnADetail")
    public ModelAndView myQnADetail(ModelAndView model,
        @RequestParam int no) {
        
        MyQnA qna = null;
        
        qna = service.findQnAByNo(no);
        
        model.addObject("qna", qna);
        model.setViewName("/myPage/myQnADetail");
        
        return model;
    }	
	
	
	//===============  myReview ===============	
	
	@GetMapping("/myReview")
	public String myReview() {
		return "/myPage/myReview";
	}
	
	//===============  myInfoMod ===============
	
	@GetMapping("/myInfoMod")
	public String myInfoMod() {
		return "/myPage/myInfoMod";
	}
	
	@GetMapping("/myInfoMod/detail")
	public String myInfoModDetail() {
		return "/myPage/myInfoModDetail";
	}
	
	@PostMapping("/myInfoMod/pwdCheck")
	public ModelAndView pwdCheck(ModelAndView model, String id, String password) {	
		
		Member loginMember = memberService.login(id, password);
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.setViewName("/myPage/myInfoModDetail");
		} else {
			model.addObject("msg", "비밀번호를 입력 또는 확인해주세요.");
			model.addObject("location", "/myPage/myInfoMod");
			model.setViewName("common/msg");			
		}		
		
		return model;
	}


}
