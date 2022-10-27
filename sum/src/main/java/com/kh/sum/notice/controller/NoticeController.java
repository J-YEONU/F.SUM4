package com.kh.sum.notice.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.admin.model.service.AdminService;
import com.kh.sum.admin.model.vo.Notice;
import com.kh.sum.common.util.PageInfo;

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
	
	@GetMapping("/notice/view")
	public ModelAndView view(ModelAndView model, 
			@RequestParam int no,
			HttpServletRequest request, HttpServletResponse response) {
		
		Notice notice = null;
		int result = 0;
		
		
		
		//새로 고침 시 조회 수가 증가하는 것을 방지하는 로직
		// 쿠키에 조회한 게시글의 번호를 기록하여 한 번 조회하면 그 뒤에는 조회 수가 올라가지 않도록 설정
		//1. 쿠키에 조회한 이력이 있는지 확인
		Cookie[] cookies = request.getCookies();
		String boardHistory = ""; //조회한 게시글 번호를 저장하는 변수
		boolean hasRead = false; // 읽은 글이면 true 안읽었으면 false
		
		if(cookies != null) {
			String name = null;
			String value = null;
			
			for(Cookie cookie : cookies) {
				name = cookie.getName();
				value = cookie.getValue();

				//boardHistory인 쿠키 값을 찾기
				if(name.equals("boardHistory")) {
					boardHistory = value;
					
					if(value.contains("|"+no+"|")) {
						hasRead = true;
						
						break;
					}
				}
			}
		}
		
		//2. 읽지 않은 게시물이면 cookie에 기록
		if(!hasRead) {
			Cookie cookie = new Cookie("boardHistory", boardHistory+ "|"+no+"|");
			
			cookie.setMaxAge(-1);//브라우저 종료 시 삭제
			response.addCookie(cookie);
		}
		
		
		notice = service.findNoticeByNo(no);
		
		//게시글 조회수 증가 로직
		if(notice != null && !hasRead) {
			result = service.updateReadCount(no);
		}
		
		
		model.addObject("notice", notice);
		model.setViewName("/notice/view");
		
		return model;
		
		
	}
}
