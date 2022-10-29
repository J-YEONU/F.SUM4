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
	
	private int rowNum;
	
	private String movieTitle;
	
	private String cinemaName;
	
	private String showDate;

	private String ticketDate;

	private int memberNo;

	private int showNo;
		
	private char status;
	
	private String seatNo;
	
	private int amount;
	
	

}
