package com.kh.sum.movie.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sum.movie.model.mapper.MovieListMapper;
import com.kh.sum.movie.model.vo.MovieList;

@Service
public class MovieListServiceImpl implements MovieListService {
	@Autowired
	private MovieListMapper mapper;
	
	@Override
	public List<MovieList> getMovieList() {
		
		
		return mapper.selectAll();
	}
	
	@Override
	public List<MovieList> getMovieList2() {
		
		
		return mapper.selectFuture();
	}

	@Override
	public List<MovieList> select4() {
		
		return mapper.select4();
	}
	
	public List<MovieList> getMoviebyGenre(String genre) {
		
		return mapper.getMoviebyGenre(genre);
	}

	@Override
	public List<MovieList> select4f() {
		// TODO Auto-generated method stub
		return mapper.select4f();
	}


}
