package com.kh.sum.cinema.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sum.cinema.model.vo.Cinema;
import com.kh.sum.cinema.model.mapper.CinemaMapper;

@Service
public class CinemaServiceImpl implements CinemaService {
	@Autowired
	private CinemaMapper mapper;
	
	@Override
	public List<Cinema> getCinema() {

		
		return mapper.selectCinema();
	}

}
