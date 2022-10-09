package com.kh.sum.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int no;
	
	private String id;
	
	private String password;
	
	private String role;
	
	private String name;
	
	private Date birthDay;
	
	private String email;
	
	private String phone;
	
	private String genre;
	
	private int point;
	
	private Date enrollDate;
	
	private String status;
}