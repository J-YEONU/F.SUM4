package com.kh.sum.movie.service;

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
	public int getMovieListCount() {
		// TODO Auto-generated method stub
		return mapper.selectMovieListCount();
	}

	@Override
	public List<MovieList> getMovieList() {
		
		
		return mapper.selectAll();
	}

	@Override
	public MovieList findMovieByNo(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int save(MovieList movieList) {
		// TODO Auto-generated method stub
		return 0;
	}

}
