package com.kh.sum.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.movie.model.vo.MovieList;
import com.kh.sum.movie.service.MovieListService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class movieListController {
	@Autowired
	private MovieListService service;
	
	@GetMapping("/movie/movieList")
	public ModelAndView movieList(ModelAndView model) {
		List<MovieList> list = null;
		
		list = service.getMovieList();
		
		model.addObject("list", list);
		model.setViewName("movie/movieList");
		
		
		return model;
	}
}
