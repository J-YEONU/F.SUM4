package com.kh.sum.ticketing.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.common.util.PageInfo;
import com.kh.sum.movie.model.service.MovieListService;
import com.kh.sum.movie.model.vo.MovieList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ticket")
public class TicketingController {
	
	@Autowired
	private MovieListService service;
	
	// ticketing (영화 목록)
	@GetMapping("/ticketing")
	public ModelAndView ticketing(ModelAndView model) {
		
		List<MovieList> list = null;
		
		list = service.getMovieList();
		
		model.addObject("list", list);
		model.setViewName("ticket/ticketing");
		
		return model;
	}


	// seat
	@GetMapping("/seat")
	public String seat() {
		
		
	return "/ticket/seat";
	}
	
	// payment
	@GetMapping("/payment")
	public String payment() {
		
		
	return "/ticket/payment";
	}
	
}
