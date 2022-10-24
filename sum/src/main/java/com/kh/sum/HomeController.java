package com.kh.sum;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.sum.movie.model.service.MovieListService;
import com.kh.sum.movie.model.vo.MovieList;

@Controller
public class HomeController {
	@Autowired
	private MovieListService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView model) {
		List<MovieList> list = null;
		list = service.select4();
		
		model.addObject("list", list);
		model.setViewName("home");
		System.out.println(list);
		return model;
	}
	
}
