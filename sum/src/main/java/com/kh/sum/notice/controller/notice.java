package com.kh.sum.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class notice {
   
   @GetMapping("/notice")
   public String noticelist() {
      
      
   return "/notice/notice";
   }
}

// @GetMapping("/notice")
// 	public ModelAndView myQnA(ModelAndView model,
// 			@RequestParam(value = "page", defaultValue = "1") int page) {
		
// 		List<Notice> list = null;
// 		PageInfo pageInfo = null;
		
// 		pageInfo = new PageInfo(page, 5, service.getNoticeCount(), 5);
// 		list = service.getNoticeList(pageInfo);
		
// 		model.addObject("list", list);
// 		model.addObject("pageInfo", pageInfo);
// 		model.setViewName("/notice/notice");
		
// 		return model;
// 	}