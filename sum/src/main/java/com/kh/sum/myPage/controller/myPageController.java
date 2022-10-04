package com.kh.sum.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.myPage.model.service.MyPageService;
import com.kh.sum.myPage.model.vo.MyQnA;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/myPage")
public class myPageController {
	
	@Autowired
	private MyPageService service;
	
	@GetMapping("/myBooking")
	public String myBooking() {
		return "/myPage/myBooking";
	}
	
	@GetMapping("/myQnA")
	public ModelAndView myQnA(ModelAndView model) {
		
		int qna = service.selectCount();
		
		model.addObject("qna", qna);
		model.setViewName("/myPage/myQnA");
		
		System.out.println("qna 컨트롤러 작동 확인 : " + qna);
		
		return model;
	}
	
	@GetMapping("/myReview")
	public String myReview() {
		return "/myPage/myReview";
	}
	
	@GetMapping("/myInfoMod")
	public String myInfoMod() {
		return "/myPage/myInfoMod";
	}

}
