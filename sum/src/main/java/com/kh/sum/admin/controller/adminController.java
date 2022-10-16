package com.kh.sum.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.admin.model.service.AdminService;
import com.kh.sum.common.util.PageInfo;
import com.kh.sum.member.model.vo.Member;
import com.kh.sum.myPage.model.vo.MyQnA;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class adminController {

	// 서비스 객체가 존재하지 않으니 서비스 작성
	// 서비스를 빈으로 만들어서 주입을 시켜준다.
	@Autowired
	private	AdminService service;
	
	/* 관리자 메인 대시보드 */
	
	@GetMapping("/main")
	public String main() {
		
		return "/admin/main";
	}
	
	
	/* 회원 목록 리스트 */

	@GetMapping("/memberList")
	public ModelAndView memberList(ModelAndView model, 
			@RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<Member> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getMemberCount(), 10);
		list = service.getMemberList(pageInfo);
		
		System.out.println(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("admin/memberList");
		
		return model;
		
	}
	
	@GetMapping("/memberDetail")
	public ModelAndView memberDetail(ModelAndView model, @RequestParam int no) {
		Member member = null;
		
		member = service.findMemberByNo(no);
		
		model.addObject("Member", member);
		model.setViewName("/admin/memberDetail");
		
		return model;
	}
	
	/* 1:1 문의 */
	
	@GetMapping("/inquiry")
	public ModelAndView inquiry(ModelAndView model,
		@RequestParam(value = "page", defaultValue = "1") int page) {
			
			List<MyQnA> list = null;
			PageInfo pageInfo = null;
			
			pageInfo = new PageInfo(page, 10, service.getInquiryCount(), 10);
			list = service.getInquiryList(pageInfo);
			
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
			
		
		model.setViewName("/admin/inquiry");
		
		return model;
	}
	
	@GetMapping("/inquiryDetail") 
	public String inquiryDetail() {
		
		return "/admin/inquiryDetail";
	}
	
	/* 영화 (영화관 등록, 영화 등록, 영화 시간 등록 ) */

	@GetMapping("/movie")
	public String movie() {
		
		return "/admin/movie";
	}
	
	@GetMapping("/cinema")
	public String cinema() {
	
		return "/admin/cinema";
	}

	@GetMapping("/movieTime")
	public String movieTime() {
		
		return "/admin/movieTime";
	}

	/* 공지사항 (등록하기, 목록보기) */
	
	@GetMapping("/noticeList")
	public String noticeList() {
		
		return "/admin/noticeList";
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail() {
		
		return "/admin/noticeDetail";
	}
	
	@GetMapping("/noticeWrite")
	public String noticeWrite() {
		
		return "/admin/noticeWrite";
	}
	
}