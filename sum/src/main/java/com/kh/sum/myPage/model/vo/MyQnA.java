package com.kh.sum.myPage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyQnA {
	private int qna_no;
	
	private String qna_title;
	
	private String qna_content;
	
	private char status;
	
	private int member_no;
	
	private char answer_status;
	
	private Date create_date;
	

}
