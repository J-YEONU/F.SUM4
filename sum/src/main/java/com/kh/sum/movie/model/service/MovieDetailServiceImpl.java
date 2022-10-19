package com.kh.sum.movie.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sum.movie.model.mapper.MovieDetailMapper;
import com.kh.sum.movie.model.vo.MovieList;

@Service
public class MovieDetailServiceImpl implements MovieDetailService {
	
	@Autowired
	private MovieDetailMapper mapper;

	@Override
	public MovieList getMovieDetail() {
		
		return mapper.selectMovieDetail();
	}

}
