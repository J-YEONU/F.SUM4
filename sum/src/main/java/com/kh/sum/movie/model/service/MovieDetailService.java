package com.kh.sum.movie.model.service;

import java.util.List;

import com.kh.sum.movie.model.vo.Comments;
import com.kh.sum.movie.model.vo.MovieList;

public interface MovieDetailService {

	MovieList getMovieDetail(int no);

	List<Comments> getCommentsList(int no);

	Integer getCommentsAvgScore(int no);

	Integer getCommentsParticipant(int no);

	double getAllCountTicketing(int no);

	double getCountTicketing(int no);

	String getStillCut(int no);

	int saveComments(Comments comments);

	int deleteComments(int cmNo);

}
