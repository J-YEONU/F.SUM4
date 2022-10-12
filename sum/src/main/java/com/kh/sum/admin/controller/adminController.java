package com.kh.sum.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.common.util.PageInfo;
import com.kh.sum.myPage.controller.myPageController;
import com.kh.sum.myPage.model.vo.MyQnA;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class adminController {

	/* 관리자 메인 대시보드 */
	
	@GetMapping("/main")
	public String main() {
		
		return "/admin/main";
	}
	
	
	/* 회원 목록 리스트 */

	@GetMapping("/memberList")
	public String memberList() {
		
		return "/admin/memberList";
	}
	
	@GetMapping("/memberDetail")
	public String memberDetail() {
		
		return "/admin/memberDetail";
	}
	
	/* 1:1 문의 */
	
	@GetMapping("/inquiry")
	public String inquiry() {
		
		return "/admin/inquiry";
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