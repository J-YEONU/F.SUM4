package com.kh.sum.movie.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sum.movie.model.mapper.MovieDetailMapper;
import com.kh.sum.movie.model.vo.Comments;
import com.kh.sum.movie.model.vo.MovieList;

@Service
public class MovieDetailServiceImpl implements MovieDetailService {
	
	@Autowired
	private MovieDetailMapper mapper;

	@Override
	public MovieList getMovieDetail(int no) {
		
		return mapper.selectMovieDetail(no);
	}

	@Override
	public List<Comments> getCommentsList(int no) {
		
		return mapper.selectAllComments(no);
	}

	@Override
	public Integer getCommentsAvgScore(int no) {
		
		return mapper.selectCommentsAvgScore(no);
	}

	@Override
	public Integer getCommentsParticipant(int no) {
		
		return mapper.countComments(no);
	}

	@Override
	public double getAllCountTicketing(int no) {
		Integer allCountTicketing = mapper.allCountTicketing(no);
		
		if(allCountTicketing == null) {
			return 0;
		} else {
			return mapper.allCountTicketing(no);			
		}
	}

	@Override
	public double getCountTicketing(int no) {
		
		Integer countTicketing = mapper.countTicketing(no);
		
		if(countTicketing == null) {
			return 0;
		} else {
			return mapper.countTicketing(no);			
		}

	}

	@Override
	public String getStillCut(int no) {

		return mapper.selectStillCut(no);	
	}

	@Override
	public int saveComments(Comments comments) {

		return mapper.insertComments(comments);
	}



}
