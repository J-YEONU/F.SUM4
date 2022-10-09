package com.kh.sum.myPage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ticketing {
	private int no;
	
	private String movieTitle;
	
	private String cinemaName;
	
	private Date showDate;

	private Date ticketDate;

	private int memberNo;

	private int showNo;
		
	private char status;
	
	

}
