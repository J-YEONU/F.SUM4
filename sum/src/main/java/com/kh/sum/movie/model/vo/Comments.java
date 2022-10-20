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
	
	private String cmId;
	
	private int mNo;
	
	private String content;
	
	private Date regDate;
	
	private Date upDate;
}
