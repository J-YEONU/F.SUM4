package com.kh.sum.movie.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.sum.movie.model.vo.MovieList;

@Mapper
public interface MovieDetailMapper {

	MovieList selectMovieDetail();

}
