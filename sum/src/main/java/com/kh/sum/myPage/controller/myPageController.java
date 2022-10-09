package com.kh.sum.myPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.common.util.PageInfo;
import com.kh.sum.myPage.model.service.MyPageService;
import com.kh.sum.myPage.model.vo.MyQnA;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/myPage")
public class myPageController {
	
	@Autowired
	private MyPageService service;
	
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

}
