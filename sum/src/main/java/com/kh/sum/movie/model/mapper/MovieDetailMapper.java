package com.kh.sum.movie.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.sum.movie.model.vo.Comments;
import com.kh.sum.movie.model.vo.MovieList;

@Mapper
public interface MovieDetailMapper {

	MovieList selectMovieDetail(int no);

	List<Comments> selectAllComments(int no);
	
	Integer selectCommentsAvgScore(int no);

	Integer countComments(int no);
	
	Integer allCountTicketing(int no);

	Integer countTicketing(int no);

	String selectStillCut(int no);
	
	int insertComments(Comments comments);
	
	int deleteComments(int cmNo);
	
	// 마이페이지용
	int selectCommentsCount(String loginMemberId);
	
	List<Comments> selectAll(RowBounds rowBounds, String loginMemberId);




	
}
