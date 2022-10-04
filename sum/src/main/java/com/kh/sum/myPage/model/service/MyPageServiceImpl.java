package com.kh.sum.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sum.myPage.model.mapper.MyPageMapper;
import com.kh.sum.myPage.model.vo.MyQnA;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageMapper mapper;

	@Override
	public int selectCount() {
		
		return mapper.selectCount();
	}

}
