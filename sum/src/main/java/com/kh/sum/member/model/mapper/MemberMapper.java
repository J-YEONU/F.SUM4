package com.kh.sum.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.sum.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	Member selectMemberById(@Param("id") String id);

	Member selectMemberByEmail(@Param("email") String email);
	
	Member selectMemberByPhone(@Param("phone") String phone);

	int insertMember(Member member);

	int updateMember(Member member);
	
	int updatePwdMember(Member member);

	int deleteMember(int no);
}