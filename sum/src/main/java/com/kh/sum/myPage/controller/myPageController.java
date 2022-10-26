package com.kh.sum.myPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.common.util.PageInfo;
import com.kh.sum.member.model.service.MemberService;
import com.kh.sum.member.model.vo.Member;
import com.kh.sum.movie.model.vo.Comments;
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
	
	// 예매
	@GetMapping("/myBooking")
	public ModelAndView myBooking(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<MyQnA> list = null;
		PageInfo pageInfo = null;
		int loginMemberNo = loginMember.getNo();
		
		pageInfo = new PageInfo(page, 5, service.getBookingCount(loginMemberNo), 5);
		list = service.getBookingList(pageInfo, loginMemberNo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/myPage/myBooking");
		
		return model;
	}
	
	// 문의내역
	@GetMapping("/myQnA")
	public ModelAndView myQnA(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<MyQnA> list = null;
		PageInfo pageInfo = null;
		int loginMemberNo = loginMember.getNo();
		
		pageInfo = new PageInfo(page, 5, service.getQnACount(loginMemberNo), 5);
		list = service.getQnAList(pageInfo, loginMemberNo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/myPage/myQnA");
		
		return model;
	}
	
	
	// 문의내역 상세페이지
	
    @GetMapping("/myQnADetail")
    public ModelAndView myQnADetail(ModelAndView model,
        @RequestParam int no) {
        
        MyQnA qna = null;
        
        qna = service.findQnAByNo(no);
        
        model.addObject("qna", qna);
        model.setViewName("/myPage/myQnADetail");
        
        return model;
    }	
	
	
	// 한줄평
	@GetMapping("/myComments")
	public ModelAndView myComments(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<Comments> list = null;
		PageInfo pageInfo = null;
		String loginMemberId = loginMember.getId();
		
		pageInfo = new PageInfo(page, 5, service.getCommentsCount(loginMemberId), 5);
		list = service.getCommentsList(pageInfo, loginMemberId);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/myPage/myComments");
		
		return model;
	}
	
	
	// 개인정보수정
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
