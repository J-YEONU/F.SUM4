package com.kh.sum.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.member.model.vo.Member;
import com.kh.sum.movie.model.service.MovieListService;
import com.kh.sum.movie.model.vo.MovieList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class movieListController {
	@Autowired
	private MovieListService service;
	
	@GetMapping("/movie/movieList")
	public ModelAndView movieList(ModelAndView model,
								  @SessionAttribute(required = false, name = "loginMember") Member loginMember) {
		
		
		if(loginMember != null) {
		
			Object[] MA = new Object[8];
			
			String MemberG = loginMember.getGenre();
			
			if(MemberG.contains("SF")) {
				MA[0] = service.getMoviebyGenre("SF");
			}
			if(MemberG.contains("드라마")) {
				MA[1] = service.getMoviebyGenre("드라마");
			}
			if(MemberG.contains("멜로/로맨스")) {
				MA[2] = service.getMoviebyGenre("멜로/로맨스");
			}
			if(MemberG.contains("코미디")) {
				MA[3] = service.getMoviebyGenre("코미디");
			}
			if(MemberG.contains("스릴러")) {
				MA[4] = service.getMoviebyGenre("스릴러");
			}
			if(MemberG.contains("애니매이션")) {
				MA[5] = service.getMoviebyGenre("애니매이션");
			}
			if(MemberG.contains("스포츠")) {
				MA[6] = service.getMoviebyGenre("스포츠");
			}
			if(MemberG.contains("액션")) {
				MA[7] = service.getMoviebyGenre("액션");
			}
			System.out.println(MA[7]);
			
			List<MovieList> list = null;
			List<MovieList> list1 = null;
			
			list = service.getMovieList();
			list1 = service.getMovieList2();
			
			model.addObject("list", list);
			model.addObject("list1", list1);
			
			model.addObject("MA", MA);
		} else {		
		
			List<MovieList> list = null;
			List<MovieList> list1 = null;
			
			list = service.getMovieList();
			list1 = service.getMovieList2();
			
			model.addObject("list", list);
			model.addObject("list1", list1);
		}
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
