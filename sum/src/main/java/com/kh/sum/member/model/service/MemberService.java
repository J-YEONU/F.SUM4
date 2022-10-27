package com.kh.sum.member.model.service;

import com.kh.sum.member.model.vo.Member;

public interface MemberService {
	
	Member findMemberById(String id);

	Member findMemberByEmail(String email);
	
	Member findMemberByPhone(String phone);
	
	Member login(String id, String password);

	int save(Member member);
	
	void updatePwd(Member member);

	Boolean isDuplicateID(String id);

	Boolean isDuplicateEmail(String email);
	
	Boolean isDuplicatePhone(String phone);

	int delete(int no);

	
}
