package com.kh.sum.myPage.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.kh.sum.member.model.vo.Member;
import com.kh.sum.myPage.model.vo.MyQnA;

@Mapper
public interface MyPageMapper {

	int selectCount();

	int updateMember(Member member);

	int insertMember(Member member);



}
