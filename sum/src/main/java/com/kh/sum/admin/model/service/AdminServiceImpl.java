package com.kh.sum.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sum.admin.model.mapper.AdminMapper;
import com.kh.sum.common.util.PageInfo;
import com.kh.sum.member.model.vo.Member;
import com.kh.sum.myPage.model.vo.MyQnA;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public int getMemberCount() {

		return mapper.selectMemberCount();
	}

	@Override
	public List<Member> getMemberList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectMemberAll(rowBounds);
	}

	@Override
	public Member findMemberByNo(int no) {

		
		return mapper.selectMemberAll(no);
	}

	@Override
	public int getInquiryCount() {

		return mapper.selectInquiryCount();
	}

	@Override
	public List<MyQnA> getInquiryList(PageInfo pageInfo) {

		return mapper.selectInquiryAll();
	}


}
