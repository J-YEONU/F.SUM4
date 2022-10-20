package com.kh.sum.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.movie.model.service.MovieDetailService;
import com.kh.sum.movie.model.vo.Comments;
import com.kh.sum.movie.model.vo.MovieList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/movie")
public class MovieDetailController {
	
	@Autowired
	private MovieDetailService  service;
	
	
	@GetMapping("/movieDetail")
	public ModelAndView movieDetail(ModelAndView model, @RequestParam int no) {
		MovieList movieDetail = null;
		List<Comments> list = null;
		
		movieDetail = service.getMovieDetail(no);
		list = service.getCommentsList(no);
		
		model.addObject("list", list);
		model.addObject("movieDetail", movieDetail);
		model.setViewName("/movie/movieDetail");
		
		return model;
	}

	
	
	
}
