package com.kh.sum.movie.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comments {
	private int cmNo;
	
	private int rowNum;
	
	private String cmId;
	
	private int mNo;
	
	private String mName;
	
	private String content;
	
	private int score;
	
	private Date regDate;
}
