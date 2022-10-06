package com.kh.sum.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class TicketingController {
	
	// ticketing
	@GetMapping("/ticketing")
	public String ticketing() {
		
		
	return "/board/ticketing";
	}


	// seat
	@GetMapping("/seat")
	public String seat() {
		
		
	return "/board/seat";
	}
	
	// payment
	@GetMapping("/payment")
	public String payment() {
		
		
	return "/board/payment";
	}
	
}
