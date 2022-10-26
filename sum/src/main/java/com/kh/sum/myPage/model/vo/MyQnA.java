package com.kh.sum.myPage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyQnA {
	private int no;
	
	private int rowNum;
	
	private String title;
	
	private String content;
	
	private char status;
	
	private int memberNo;
	
	private char answerStatus;
	
	private Date createDate;
	
}
