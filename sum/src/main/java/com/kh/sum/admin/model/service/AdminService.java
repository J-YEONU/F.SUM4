package com.kh.sum.admin.model.service;

import java.util.List;

import com.kh.sum.common.util.PageInfo;
import com.kh.sum.member.model.vo.Member;
import com.kh.sum.myPage.model.vo.MyQnA;

public interface AdminService {

	int getMemberCount();

	List<Member> getMemberList(PageInfo pageInfo);

	Member findMemberByNo(int no);

	int getInquiryCount();

	List<MyQnA> getInquiryList(PageInfo pageInfo);


}
