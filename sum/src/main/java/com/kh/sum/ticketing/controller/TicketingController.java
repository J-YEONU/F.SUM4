package com.kh.sum.ticketing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ticket")
public class TicketingController {
	
	// ticketing
	@GetMapping("/ticketing")
	public String ticketing() {
		
		
	return "/ticket/ticketing";
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
