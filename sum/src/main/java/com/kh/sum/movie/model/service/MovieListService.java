package com.kh.sum.movie.model.service;

import java.util.List;

import com.kh.sum.common.util.PageInfo;
import com.kh.sum.movie.model.vo.MovieList;

public interface MovieListService {
	int getBoardCount();

	List<MovieList> getMovieList(PageInfo pageInfo);

	MovieList findMovieByNo(int no);

	int delete(int no);

	int save(MovieList movieList);

}
