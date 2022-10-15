package com.kh.sum.admin.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.sum.member.model.vo.Member;

@Mapper
public interface AdminMapper {

	int selectMemberCount();

	List<Member> selectMemberAll(RowBounds rowBounds);

	Member selectMemberAll(int no);
}
