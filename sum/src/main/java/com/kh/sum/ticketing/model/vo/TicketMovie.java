package com.kh.sum.ticketing.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TicketMovie {
	private int movieNo;
	
	private int memberNo;
	
	private String movieTitle;
	
	private String movieGenre;
	
	private java.sql.Date movieRelease;
	
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
	
	private java.sql.Date createDate;
	
}
