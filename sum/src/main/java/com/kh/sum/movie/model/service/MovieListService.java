package com.kh.sum.movie.model.service;

import java.util.List;

import com.kh.sum.movie.model.vo.MovieList;

public interface MovieListService {

	List<MovieList> getMovieList();

	List<MovieList> getMovieList2();

	List<MovieList> getMoviebyGenre(String genre);
	
	List<MovieList> select4();
	

}
