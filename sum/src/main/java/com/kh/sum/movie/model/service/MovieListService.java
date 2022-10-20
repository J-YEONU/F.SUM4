package com.kh.sum.movie.model.service;

import java.util.List;

import com.kh.sum.movie.model.vo.MovieList;

public interface MovieListService {
	int getMovieListCount();

	MovieList findMovieByNo(int no);

	int delete(int no);

	int save(MovieList movieList);

	List<MovieList> getMovieList();

	List<MovieList> getMovieList2();

	List<MovieList> getMoviebyGenre(String genre);
	

}
