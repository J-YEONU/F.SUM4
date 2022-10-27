package com.kh.sum.cinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.cinema.model.service.CinemaDetailService;
import com.kh.sum.cinema.model.vo.Cinema;
import com.kh.sum.movie.model.vo.MovieList;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/cinema")
public class CinemaDetailController {
	
	@Autowired
	private CinemaDetailService service;
	
	@GetMapping("/cinemaDetail")
	public ModelAndView movieDetail(ModelAndView model, @RequestParam int no) {
		Cinema cinemaDetail = null;
		
		cinemaDetail = service.getCinemaDetail(no);
		
		System.out.println(cinemaDetail);
		
		model.addObject("cinemaDetail", cinemaDetail);
		model.setViewName("/cinema/cinemaDetail");
		
	return model;
	}
}
