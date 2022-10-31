package com.kh.sum.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MovieTime {

	private int showNo;
	
	private int cinemaNo;
	
	private String time;
	
	private Date startDate;

	private Date endDate;
	
	private int movieNo;
	
	private int memberNo;
	
}
