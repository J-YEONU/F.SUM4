package com.kh.sum.cinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cinema")
public class Cinema {
   
   @GetMapping("/cinema")
   public String ticketing() {
      
      
   return "/cinema/cinema";
   }
}