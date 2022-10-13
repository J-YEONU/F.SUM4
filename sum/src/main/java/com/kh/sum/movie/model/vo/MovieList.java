package com.kh.sum.movie.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MovieList {
	private int MovieNo;
	
	private int memberNo;
	
	private String movieTitle;
	
	private String movieGenre;
	
	private Date movieRelease;
	
	private String movieDirector;
	
	private String movieCast;
	
	private String movieRating;
	
	private String movieTrailer;
	
	private String moviePoster;
	
	private String renamedPoster;
	
	private String movieStatus;
	
	private String img;
	
	private String renamedImg;
	
	private String movieSummary;
	
	private int price;
	
	private int readCount;
	
	private String movieComment;
	
	private String movieGrade;
	
	private Date createDate;

}
