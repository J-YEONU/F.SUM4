package com.kh.sum.movie.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.member.model.vo.Member;
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
	public ModelAndView movieDetail(ModelAndView model, 
			@SessionAttribute(required = false, name = "loginMember") Member loginMember,
			@RequestParam int no) {
		MovieList movieDetail = null;
		List<Comments> list = null;
		Integer avgScore = 0;
		Integer participant = 0;
		double ticketingRate = 0;
		double allCountTicketing = 0;
		double countTicketing = 0;
		String stillCut = null;
		List<String> stillCutList = null;
		
		
		movieDetail = service.getMovieDetail(no);
		list = service.getCommentsList(no);
		avgScore = service.getCommentsAvgScore(no);	
		participant = service.getCommentsParticipant(no);
		allCountTicketing = service.getAllCountTicketing(no);
		countTicketing = service.getCountTicketing(no);
		
		if(allCountTicketing == 0 || countTicketing == 0) {
			ticketingRate = 0;
		}else {			
			ticketingRate = countTicketing / allCountTicketing * 100;
		}
		
		stillCut = service.getStillCut(no);
		
		if(stillCut == null) {
			stillCutList = null;
		}else {			
			stillCutList = Arrays.asList(stillCut.split(","));			
		}
		
		
		if (list != null && !list.isEmpty()) {
			model.addObject("list", list);
		}
		
		model.addObject("avgScore", avgScore);
		model.addObject("participant", participant);
		model.addObject("ticketingRate", ticketingRate);
		model.addObject("movieDetail", movieDetail);
		model.addObject("stillCutList", stillCutList);
		model.addObject("loginMember", loginMember);
		model.setViewName("/movie/movieDetail");
		
		return model;
	}

//	@PostMapping("/movieCommentsInsert")
//	public ResponseEntity<Map<String, String>> movieCommentsInsert(@RequestParam String comment) {
//		
//		Map<String, String> map = new HashMap<>();
//	
//		
//		map.put("result", "true");
//		map.put("comment", comment);
//		
//		/*
//		 * ResponseEntity
//		 * 	- 사용자의 요청에 대한 응답(상태 코드, 헤더, 바디)을 한 번에 설정하는 객체이다.
//		 */
////		return ResponseEntity.ok()
////							 .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
////							 .body(map);
//		return new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);		
//	}
	
	@PostMapping("/movieCommentsInsert")
	public ModelAndView movieCommentsInsert(ModelAndView model, 
			@ModelAttribute Comments comments){
		int result = 0;
		
		result = service.saveComments(comments);
		
		
		if(result > 0) {
			model.addObject("msg", "댓글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/movie/movieDetail?no=" + comments.getMNo());
		} else {
			model.addObject("msg", "댓글 등록을 실패하였습니다.");
			model.addObject("location", "/movie");
		}
		
		
		model.setViewName("common/msg");
		
		
		return model;
	}
	
	@PostMapping("/movieCommentsDelete")
	public ModelAndView movieCommentsDelete(ModelAndView model, 
			@RequestParam int cmNo,
			@RequestParam int mNo){
		int result = 0;
		
		result = service.deleteComments(cmNo);
		
		
		if(result > 0) {
			model.addObject("msg", "댓글이 정상적로 삭제되었습니다.");
			model.addObject("location", "/movie/movieDetail?no=" + mNo);
		} else {
			model.addObject("msg", "댓글 삭제를 실패하였습니다.");
			model.addObject("location", "/movie/movieDetail?no=" + mNo);
		}
		
		
		model.setViewName("common/msg");
		
		
		return model;
	}
	
	
	
}
