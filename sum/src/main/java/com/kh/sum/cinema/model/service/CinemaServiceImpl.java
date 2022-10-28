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
	public List<Cinema> getCinemaS() {

		
		return mapper.selectCinemaS();
	}

	@Override
	public List<Cinema> getCinemaGG() {
		// TODO Auto-generated method stub
		return mapper.selectCinemaGG();
	}

	@Override
	public List<Cinema> getCinemaIC() {
		// TODO Auto-generated method stub
		return mapper.selectCinemaIC();
	}

	@Override
	public List<Cinema> getCinemaGW() {
		// TODO Auto-generated method stub
		return mapper.selectCinemaGW();
	}

	@Override
	public List<Cinema> getCinemaD() {
		// TODO Auto-generated method stub
		return mapper.selectCinemaD();
	}

}
