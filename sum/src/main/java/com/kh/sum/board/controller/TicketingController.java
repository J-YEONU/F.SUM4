package com.kh.sum.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class TicketingController {

	@GetMapping("/ticketing")
	public String ticketing() {
		
		
		return "/board/ticketing";
	}
	
	
	
}
