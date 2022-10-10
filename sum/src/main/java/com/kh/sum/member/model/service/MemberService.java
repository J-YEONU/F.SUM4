package com.kh.sum.member.model.service;

import com.kh.sum.member.model.vo.Member;

public interface MemberService {
	
	Member findMemberById(String id);
	
	Member login(String id, String password);

	int save(Member member);

	Boolean isDuplicateID(String id);

	int delete(int no);


}
