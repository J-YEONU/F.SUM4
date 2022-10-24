package com.kh.sum.movie.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.sum.movie.model.vo.MovieList;

@Mapper
public interface MovieListMapper {
	int selectMovieListCount();

	List<MovieList> selectAll(RowBounds rowBounds);
	
	List<MovieList> selectFuture();
	
	List<MovieList> getMoviebyGenre(@Param("genre") String genre);
	
	MovieList selectMovieByNo(@Param("no") int no);

	int insertMovie(MovieList movie);

	int updateMovie(MovieList movie);
	
	int updateStatus(@Param("no")int no, @Param("status") String status);

	List<MovieList> selectAll();
	
	List<MovieList> select4();
	
	List<MovieList> selectFuture4();
}
