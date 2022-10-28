package com.kh.sum.cinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.cinema.model.service.CinemaService;
import com.kh.sum.cinema.model.vo.Cinema;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cinema")
public class CinemaController {
   
	@Autowired
	private CinemaService service;
	
   @GetMapping("/cinema")
   public ModelAndView cinema(ModelAndView model) {
      List<Cinema> cinemaS = null;
      List<Cinema> cinemaGG = null;
      List<Cinema> cinemaIC = null;
      List<Cinema> cinemaGW = null;
      List<Cinema> cinemaD = null;
      
      cinemaS = service.getCinemaS();
      cinemaGG = service.getCinemaGG();
      cinemaIC = service.getCinemaIC();
      cinemaGW = service.getCinemaGW();
      cinemaD = service.getCinemaD();
      
      System.out.println(cinemaS);
      
      model.addObject("cinemaS", cinemaS);
      model.addObject("cinemaGG", cinemaGG);
      model.addObject("cinemaIC", cinemaIC);
      model.addObject("cinemaGW", cinemaGW);
      model.addObject("cinemaD", cinemaD);
      model.setViewName("/cinema/cinema");
      
      
      return model;
   }
}