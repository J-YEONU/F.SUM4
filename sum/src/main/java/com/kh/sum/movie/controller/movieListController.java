package com.kh.sum.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class movieListController {

	@GetMapping("/movie/movieList")
	public String movieList() {
		
		
		return "/movie/movieList";
	}
}
