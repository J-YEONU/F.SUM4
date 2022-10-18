package com.kh.sum.movie.controller;

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
//@RequestMapping("/movieDetail")
public class movieDetailController {
	
	@GetMapping("/movieDetail")
	public String movieDetail() {
		return "/movie/movieDetail";
	}

}
