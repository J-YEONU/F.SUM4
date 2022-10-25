package com.kh.sum.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.admin.model.service.AdminService;
import com.kh.sum.admin.model.vo.Notice;
import com.kh.sum.common.util.PageInfo;
import com.kh.sum.myPage.model.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
	

	@Autowired
	private AdminService service;
   
	@RequestMapping("/notice")
   public ModelAndView notice(ModelAndView model,
		   @RequestParam(value = "page", defaultValue = "1") int page) {
	   
	   List<Notice> list = null;
	   PageInfo pageInfo = null;
	   
	   pageInfo = new PageInfo(page, 5, service.getNoticeCount(), 5);
	   list = service.getNoticeList(pageInfo);
	   
	   model.addObject("list", list);
	   model.addObject("pageInfo", pageInfo);
	   model.setViewName("/notice/notice");
	   
	   return model;
   }
}
