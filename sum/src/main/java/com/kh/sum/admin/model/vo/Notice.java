package com.kh.sum.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {

	private int noticeNo;
	
	private String title;
	
	private String content;
	
	private Date createDate;

	private String noticeImg;
	
	private String renamedImg;
	
	private String status;
	
	private int memberNo;
	
	private int readCount;
	
	private int rowNum;
}
