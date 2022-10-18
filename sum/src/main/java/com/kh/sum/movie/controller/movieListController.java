package com.kh.sum.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.movie.model.service.MovieListService;
import com.kh.sum.movie.model.vo.MovieList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class movieListController {
	@Autowired
	private MovieListService service;
	
	@GetMapping("/movie/movieList")
	public ModelAndView movieList(ModelAndView model) {
		List<MovieList> list = null;
		List<MovieList> list1 = null;
		
		list = service.getMovieList();
		list1 = service.getMovieList2();
		
		model.addObject("list", list);
		model.addObject("list1", list1);
		model.setViewName("movie/movieList");
		
		
		return model;
	}
	
	@GetMapping("/movie/movieList2")
	public ModelAndView movieList2(ModelAndView model) {
		List<MovieList> list = null;
		
		list = service.getMovieList2();
		
		model.addObject("list", list);
		model.setViewName("movie/movieList");
		
		return model;
	}
	
}
