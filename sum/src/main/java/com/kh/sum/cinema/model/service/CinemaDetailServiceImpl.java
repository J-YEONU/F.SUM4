package com.kh.sum.cinema.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sum.cinema.model.mapper.CinemaDetailMapper;
import com.kh.sum.cinema.model.vo.Cinema;

@Service
public class CinemaDetailServiceImpl implements CinemaDetailService {
	
	@Autowired
	private CinemaDetailMapper mapper;
	
	
	@Override
	public Cinema getCinemaDetail(int no) {

		return mapper.selectCinemaDetail(no);
	}

}
