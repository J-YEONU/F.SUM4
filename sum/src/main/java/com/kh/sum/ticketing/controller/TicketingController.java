package com.kh.sum.ticketing.controller;

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

import com.kh.sum.cinema.model.service.CinemaService;
import com.kh.sum.cinema.model.vo.Cinema;
import com.kh.sum.common.util.PageInfo;
import com.kh.sum.member.model.service.MemberService;
import com.kh.sum.member.model.vo.Member;
import com.kh.sum.movie.model.service.MovieListService;
import com.kh.sum.movie.model.vo.MovieList;
import com.kh.sum.myPage.model.vo.Ticketing;
import com.kh.sum.ticketing.model.service.TicketingService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ticket")
public class TicketingController {
	
    @Autowired
    private TicketingService service;
	
    @Autowired
    private MemberService memberService;
    
	@Autowired
	private MovieListService Mservice;
	
	@Autowired
	private CinemaService Cservice;
	
	// ticketing (영화,영화관 목록)
	@GetMapping("/ticketing")
	public ModelAndView ticketing(ModelAndView model,
	        @SessionAttribute(required = false, name = "loginMember") Member loginMember) {
		
		List<MovieList> mlist = null;
		List<Cinema> cinemaS = null;
        List<Cinema> cinemaGG = null;
        List<Cinema> cinemaIC = null;
        List<Cinema> cinemaGW = null;
        List<Cinema> cinemaD = null;
		
		mlist = Mservice.getMovieList();
		cinemaS = Cservice.getCinemaS();
        cinemaGG = Cservice.getCinemaGG();
        cinemaIC = Cservice.getCinemaIC();
        cinemaGW = Cservice.getCinemaGW();
        cinemaD = Cservice.getCinemaD();
		
		
		model.addObject("mlist", mlist);
        model.addObject("cinemaS", cinemaS);
        model.addObject("cinemaGG", cinemaGG);
        model.addObject("cinemaIC", cinemaIC);
        model.addObject("cinemaGW", cinemaGW);
        model.addObject("cinemaD", cinemaD);
		model.setViewName("/ticket/ticketing");
		
		return model;
	}


	// seat
	@PostMapping("/seat")
	public ModelAndView seat(ModelAndView model, @ModelAttribute Ticketing ticketing) {
			
    model.addObject("ticketing", ticketing);
	model.setViewName("/ticket/seat");
		
	return model;
	}
	
	
	// payment
	@PostMapping("/payment")
	public ModelAndView payment(ModelAndView model, @ModelAttribute Ticketing ticketing) {
		
	    model.addObject("ticketing", ticketing);
		model.setViewName("/ticket/payment");
			
		return model;
	}
	

	
	// approve
	@PostMapping("/approve")
	public ModelAndView approve(ModelAndView model, 
			@ModelAttribute Ticketing ticketing) {
		
		int result = 0;
		
		result = service.setTicketing(ticketing);
		
	    model.addObject("ticketing", ticketing);
		model.setViewName("/ticket/approve");
			
		return model;
	}
	
}
