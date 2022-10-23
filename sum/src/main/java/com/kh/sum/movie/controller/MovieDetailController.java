package com.kh.sum.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

	@PostMapping("/movieCommentsInsert")
	public ResponseEntity<Map<String, String>> movieCommentsInsert(@RequestParam String comment) {
		
		Map<String, String> map = new HashMap<>();
	
		
		map.put("result", "true");
		map.put("comment", comment);
		
		/*
		 * ResponseEntity
		 * 	- 사용자의 요청에 대한 응답(상태 코드, 헤더, 바디)을 한 번에 설정하는 객체이다.
		 */
//		return ResponseEntity.ok()
//							 .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
//							 .body(map);
		return new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);		
	}
	
	
	
}
